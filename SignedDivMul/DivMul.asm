.386
.model flat,c
.386
.model flat,c
.code

;return : 0 Error (division by zero)
;		: 1 Success
;
;Computation *prod = a*b
;			 *quo = a/b
;			 *rem = a % b

IntegerMulDiv	proc
				;prologue saves and inits frame pointer from cpp
				push ebp
				mov ebp,esp
				;push caller reg onto stack also. according to visual C++ calling convention for 32bit programs
				;must preserve the values of ebx, esi, edi, and edp. these registers are called the nonvolatile registers
				;eax ecx and edx are considered volatile and do not need to be preserved
				push ebx

				;make sure divisor is not equal to 0
				xor eax,eax
				;load argument

				mov ecx,[ebp+8] ;ecx = a
				mov edx,[ebp+12] ;edx = b

				or edx,edx
				;jump if zero flag = 1. avoiding divide by zero
				jz InvalidDivisor
				;if it was zero then the process already jumped out

				imul edx,ecx ;edx = a * b using signed int mult

				mov ebx,[ebp+16] ;ebx = prod
				mov [ebx], edx

				mov eax, ecx ;eax = a
				;convert double word to quad word. in x86 signed div using 32 bit operands must be perfomred using 64bit dividend 
				;loaded into register pair edx and eax. the cdq instruction extends eax
				cdq ; edx:eax contains dividend

				idiv DWORD ptr[ebp+12] ;edx:eax is always used as dividend divisor aka b is located at ebp+12
				mov ebx,[ebp+20] ;store quotient at +20
				mov [ebx],eax
				mov ebx,[ebp+24] ;put remainder from ebp+24 to ebx
				mov [ebx],edx
				mov eax,1