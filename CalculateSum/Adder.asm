.386
.model flat,c ;notice the ,c which is used to tie into CPP? it means  "c style names for public symbols

.code
AdderASM	proc
			;prologue pushes onto stack
			push ebp ;saves content of ebp reg onto stack
			mov ebp,esp ;inits ebp as stack frame. enables access to functions argument ebp is base pointer reg esp is current stack pointer reg
			
			;load into registers
			mov eax,[ebp+8] ;[] means refer to memory location + 8 is the offset. in this case it is eax = a. a is from arguments
			mov ecx,[ebp+12] ; ecx = b
			mov edx,[ebp+16] ;eax = c

			add eax,ecx ;eax = a + b
			add eax, edx ;eax = eax + c eax must be used to return the value to the prog

			;epilogue pops off of stack
			pop ebp

			ret ;transfers control back to calling function

AdderASM	endp
			end



