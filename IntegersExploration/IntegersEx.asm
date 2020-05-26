.386
.model flat,c

extern GlChar:BYTE ;import global vars from CPP
extern GlShort:WORD
extern GlInt:DWORD
extern GLongLong:QWORD

.code
IntegerAddition		proc
					;prologue
					push ebp
					mov ebp,esp

					;Compute GlChar +=a
					mov al,[ebp+8]
					add [G1Char],al

					;Compute G1Short +=b
					mov ax,[ebp+12]
					add[G1Short],ax

					;Compute GlInt +=c
					mov eax,[ebp+16]
					add [GlInt],eax

					;Compute GLongLong +=d
					mov eax,[ebp+20] ;long long is 64bit so first 32 here
					mov edx,[ebp+24] ;second 32 here. notice ebp....+4 holds 32
					add DWORD ptr[GLongLong],eax
					adc DWORD ptr[GLongLong],edx

					;epilogue
					pop ebp
					ret

IntegerAddition		endp
					end