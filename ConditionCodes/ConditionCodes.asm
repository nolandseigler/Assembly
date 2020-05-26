.386
.model flat,c

.code

;Find min()
SignedMinA		proc
				push ebp
				mov ebp,esp
				mov eax,[ebp+8] ;eax=a
				mov ecx,[ebp+12] ;ecx=b

				cmp eax,ecx ;subtract source from dest
				jle @F ;jump to nearest forward @@ label if less than or equal to
				mov eax, ecx ;eax = min(a,b)

@@:				mov ecx,[ebp+16]
				cmp eax,ecx
				jle @F
				mov eax,ecx ;eax = min(a, b, c)

@@:				pop ebp
				ret

SignedMinA		endp

