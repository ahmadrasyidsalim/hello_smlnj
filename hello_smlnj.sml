structure HELLO_SMLNJ = struct
	open CML
	
	fun hello () = let
		val c : string chan = channel ()
		in
			spawn (fn () => TextIO.print (recv c));
			send (c, "Hello, world\n");
			exit ()
		end

	fun main (_, argv) =
		RunCML.doit (fn () => ignore (spawn hello), NONE)
end
