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
				
				
				;Compute S1; s1 = a + b + c
				mov [ebp-12],eax
				;now do math in memory instead of registers. why? i dont know
				;instructor just said we are doing this to demo local vars
				add [ebp-12],ebx ;eax + ebx which is a + b
				add [ebp-12],ecx ; eax + ebx was in the location now we are adding ecx which means a + b + c
				;[ebp-12] is temporaty s1 in local storage. yay.


				;Compute S2. s2 = a*a + b*b + c * c
				;find squares. a ^ 2; b ^ 2; c ^ 2;
				imul eax,eax ;signed multiplication
				imul ebx,ebx
				imul ecx,ecx

				;store S2 in temp 2
				mov [ebp-8],eax
				add [ebp-8],ebx
				add [ebp-8],ecx

				;Compute s3 = a*a*a + b*b*b + c*c*c
				imul eax,[ebp+8] ;multiply the value that is already a*a by a
				imul ebx,[ebp+12]
				imul ecx,[ebp+16]

				;store S3 in temp 3
				mov [ebp-4],eax
				add [ebp-4],ebx
				add [ebp-4],ecx

				;Save s1, s2, and s3 in registers
				mov eax,[ebp-12] ;s1 to eax
				mov [edx],eax ;saves it to first edx mem location because it is the return register
				mov eax,[ebp-8] ;s2 to eax
				mov [esi],eax ;saves
				mov eax,[ebp-4] ;s3 to eax
				mov [edi],eax ;saves

				;procdure epilgoue
				pop edi
				pop esi
				pop ebx
				mov esp,ebp ;give back local storage?? releaseas storage and restores esp
				pop ebp

				ret

CalculateSum	endp
				end