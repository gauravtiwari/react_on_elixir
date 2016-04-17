defmodule ReactOnElixir.Renderer do
	require EEx

	defmodule Error, do: defexception [:message]
	defmodule RuntimeError, do: defexception [:message]

	def result(component_name, props, render_type) do
	  program = EEx.eval_file(ReactOnElixir.Config.renderer_path(), [server_bundle_path: ReactOnElixir.Config.server_bundle_path()])
	  command = "node" |> System.find_executable
	  tmpfile = compile_to_tempfile(program)

	  command_with_args = "echo '#{Poison.encode!(%{component: component_name, props: props, render_type: render_type})}' | #{command} #{tmpfile}"
	  try do
	    port = Port.open({ :spawn, command_with_args },
	      [:stream, :in, :binary])
	    extract_result(loop(port))
	  after
	    File.rm! tmpfile
	  end
	end

	defp loop(port) do
	  loop(port, "")
	end

	defp loop(port, acc) do
	  receive do
	    { ^port, { :data, data } } ->
	      data
	    { ^port, :eof } ->
	      send port, { self, :close }
	      acc
	  end
	end

	defp compile_to_tempfile(program) do
	  hash = :erlang.phash2(:crypto.rand_bytes(8))
	  filename = "renderer-#{hash}.js"
	  path = Path.join(System.tmp_dir!, filename)
	  File.write! path, program
	  path
	end

	defp extract_result(output) do
	  case Poison.decode!(output) do
	    [ "ok", value ] ->
	      value
	    [ "ok" ] ->
	      :undefined
	    [ "error", message ] ->
	      raise %RuntimeError{message: message}
	    [ "error" ] ->
	      raise %Error{}
	  end
	end
end
