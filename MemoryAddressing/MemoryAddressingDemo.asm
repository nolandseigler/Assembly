.386
.model flat,c

.const ;defines a block of memory that contains read only data
FibVals DWORD 0,1,1,2,3,5,8,13,21
		DWORD 34,55,89,144,233,377,610 ;this is all an array even if it is on dif lines

NumFibVals DWORD($ - FibVals)/SIZEOF DWORD ; $ === value of location counter or offset from beginning of current mem block
;we do ($ - FibVals) to determine size of table in bytes
;we divide by the size of a DWORD to get the correct number of elements in the array
; It is the same as NumFibVals = sizeof(FibVals) / sizeof(int) in CPP

;make it public so CPP can use it havent had to do this yet...weird

public NumFibVals

.code

MemoryAddressing		proc

						;prologue
						push ebp
						mov ebp,esp
						push ebx
						push esi
						push edi
						;end prologue

						xor eax,eax ;make sure i isnt invalid
						mov ecx,[ebp+8] ;ecx = i
						cmp ecx,0 ;compares ecx value to immediate value of zero
						jl InvalidIndex ;jump if less than
						cmp ecx,[NumFibVals] ;comp to number of elements in lookup table
						jge InvalidIndex ;jump if greater than or equal to

						;Eg1 -base register
						mov ebx, OFFSET FibVals ;ebx = FibVals
						mov esi,[ebp+8] ; esi = i
						shl esi,2 ;shl means shift left. esi = i * 4
						add ebx,esi ;ebx - FibVals + i * 4
						mov eax,[ebx] ;load table value
						mov edi,[ebp+12]
						mov [edi], eax

						;Eg2 - base register + displacement
						mov esi,[ebp+8]
						shl esi,2
						mov eax,[esi+FibVals]
						mov edi,[ebp+16]
						mov [edi],eax

						;Eg3 - base register + index register
						mov ebx, OFFSET FibVals
						mov esi,[ebp+8]
						shl esi,2
						mov eax,[ebx+esi]
						mov edi,[ebp+20]
						mov [edi],eax

						;Eg4 - base register + index register * scale factor
						mov ebx, OFFSET FibVals
						mov esi,[ebp+8]
						mov eax,[ebx+esi*4]
						mov edi,[ebp+24]
						mov [edi],eax
						mov eax,1

						;epilogue
InvalidIndex:
						pop edi
						pop esi
						pop ebx
						pop ebp

						ret

MemoryAddressing		endp
						end