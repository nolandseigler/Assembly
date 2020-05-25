.386
.model flat,c

.code
CalculateSum	proc

				;Function prolog
				push ebp
				mov ebp,esp
				;move pointer -12 down stack.
				;simply put allocate local storage. (we have three args so 3 times 4 ??)
				;normally esp and ebp are at same location???
				sub esp,12 ;before nonvolatile registers are saved we allocate 12 bytes of local storage space to be used by the function
				;sub is used instead of add because x86 stack grows downwards towards memory address.
				;when using ebp to access values on stack function arguments are always referenced while using positive displacement
				;local variables are referenced using negative displacement values
				push ebx
				push esi
				push edi

				;Load arguments
				mov eax,[ebp+8] ;eax = a
				mov ebx,[ebp+12] ;ebx = b
				mov ecx,[ebp+16] ;ecx = c
				mov edx,[ebp+20] ;edx = s1
				mov esi,[ebp+24] ;esi = s2
				mov edi,[ebp+28] ;edi = s3

				;[ebp-12] is an example of a memory destination operand instead of a reg destination
				;we are taking eax which is the value of [ebp+8] which is a from our CPP method
				;we are taking a and moving it into the memory location at [ebp-12]
				;this is the deepest location down the mem stack that we cleared out for local vars
				;using sub esp,12
				;this may all be lies because it came from my brain not the curric but it makes sense rn
				mov [ebp-12],eax
				add [ebp-12],ebx
				add [ebp-12],ecx