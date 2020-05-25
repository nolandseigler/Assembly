.386
.model flat,c

.code
CalculateSum	proc

				;Function prolog
				push ebp
				mov ebp,esp
				;move pointer -12 down stack.
				;simply put allocate local storage. (we have three args so 3 times 4 ??)
				sub esp,12 ;before nonvolatile registers are saved we allocate 12 bytes of local storage space to be used by the function
				;sub is used instead of add because x86 stack grows downwards towards memory address.
				;when using ebp to access values on stack function arguments are always referenced while using positive displacement
				;local variables are referenced using negative displacement values
				push ebx
				push esi
				push edi