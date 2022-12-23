.model small
.code
org 100h

start:
	jmp mulai
teks		db 13,10,'Aplikasi Penjualan Handphone Gaming','$'
teks5		db 13,10,'___________________________________','$'

nama	db 13,10,'Masukkan Nama Anda   : $'
nama1 db 13,10,'Masukkan No HP       : $'
nama2 db 13,10,'Masukkan Alamat Anda : $'

kat4	db 13,10,'Aplikasi Penjualan Handphone Gaming:',13,10
	db '|--|------------------------|----------------|--------------------|',13,10
	db '|NO| Daftar Seri Handphone  | Rilis Tahun    | Harga Handphone    |',13,10	
	db '|--|------------------------|----------------|--------------------|',13,10
	db '|01| Asus ROG phone 6 Pro   | Juli 2022      | Rp 19.500.000      |',13,10
	db '|--|------------------------|----------------|--------------------|',13,10
	db '|02| Poco F4 GT 5G          | Juni 2022      | Rp 9.000.000       |',13,10
	db '|--|------------------------|----------------|--------------------|',13,10
	db '|03| Oppo Find X5 Pro 5G    | Juni 2022      | Rp 15.000.000      |',13,10
	db '|--|------------------------|----------------|--------------------|',13,10
	db '|04| Samsung Galaxy A73 5G  | April 2022     | Rp 7.800.000       |',13,10	
	db '|--|------------------------|----------------|--------------------|',13,10
	db '|05| Xiaomi 12 Pro          | April 2022     | Rp 12.750.000      |',13,10	
	db '|--|------------------------|----------------|--------------------|',13,10
	db '|06| Vivo X80 Pro           | April 2022     | Rp 12.200.000      |',13,10	
	db '|--|------------------------|----------------|--------------------|',13,10
	db '|07| Xiaomi 12              | April 2022     | Rp 9.465.000       |',13,10
	db '|--|------------------------|----------------|--------------------|',13,10
lanjut	db 13,10,'Lanjut Tekan y untuk lanjut >>>>>>> $'

tampung_nama	db 30,?,30 dup(?)
tampung_nama1	db 30,?,30 dup(?)
tampung_nama2	db 30,?,30 dup(?)

error		db 13,10,'Kode Yang Anda Masukkan Salah $'
prodi		db 13,10,'Silahkan Masukkan Nilai Anda: $'
success	db 13,10,'Selamat Anda Berhasil $'


mulai:
	mov ah,09h
	mov dx,offset teks
	int 21h
	mov ah,09h
	mov dx,offset teks5
	int 21h

	
mov ah,09h
	lea dx,nama
	int 21h
	mov ah,0ah
	lea dx,tampung_nama
	int 21h
	push dx


	mov ah,09h
	lea dx,nama1
	int 21h
	mov ah,0ah
	lea dx,tampung_nama1
	int 21h
	push dx


	mov ah,09h
	lea dx,nama2
	int 21h
	mov ah,0ah
	lea dx,tampung_nama2
	int 21h
	push dx

	
	mov ah,09h
	mov dx,offset lanjut
	int 21h
	mov ah,01h
	int 21h
	cmp al,'y'
	je bingkai
	jne error_msg

bingkai:
	mov ah,09h
	mov dx,offset kat4
	int 21h
	mov ah,01h
	int 21h
	je proses

error_msg:
	mov ah,09h
	mov dx,offset error
	int 21h
	int 20h

	jne error_msg

proses:
	mov ah,09h
	mov dx,offset prodi
	int 21h

	mov ah,1
	int 21h
	mov bh,al
	mov ah,1
	int 21h
	mov bl,al
	cmp bh,'0'
	cmp bl,'1'
	je hasil1

	cmp bh,'0'
	cmp bl,'1'
	je hasil1

	cmp bh,'0'
	cmp bl,'2'
	je hasil2

	cmp bh,'0'
	cmp bl,'3'
	je hasil3

	cmp bh,'0'
	cmp bl,'4'
	je hasil4

	cmp bh,'0'
	cmp bl,'5'
	je hasil5

	cmp bh,'0'
	cmp bl,'6'
	je hasil6

	cmp bh,'0'
	cmp bl,'7'
	je hasil7

jne error_msg

;----------------------------------------------------------------

hasil1:
	mov ah,09h
	lea dx,daftar1
	int 21h
	int 20h

hasil2:
	mov ah,09h
	lea dx,daftar2
	int 21h
	int 20h

hasil3:
	mov ah,09h
	lea dx,daftar3
	int 21h
	int 20h

hasil4:
	mov ah,09h
	lea dx,daftar4
	int 21h
	int 20h

hasil5:
	mov ah,09h
	lea dx,daftar5
	int 21h
	int 20h

hasil6:
	mov ah,09h
	lea dx,daftar6
	int 21h
	int 20h

hasil7:
	mov ah,09h
	lea dx,daftar7
	int 21h
	int 20h

;----------------------------------------------------------------

daftar1 db 13,10,'Anda Membeli Handphone Asus ROG phone 6 Pro Dengan Membayar Rp 19.500.000','$'
daftar2 db 13,10,'Anda Membeli Handphone Poco F4 GT 5G Dengan Membayar Rp 9.000.000','$'
daftar3 db 13,10,'Anda Membeli Handphone Oppo Find X5 Pro 5G Dengan Membayar Rp 15.000.000','$'
daftar4 db 13,10,'Anda Membeli Handphone Samsung Galaxy A73 5G Dengan Membayar Rp 7.800.000 ','$'
daftar5 db 13,10,'Anda Membeli Handphone Xiaomi 12 Pro Dengan Membayar Rp 12.750.000','$'
daftar6 db 13,10,'Anda Membeli Handphone Vivo X80 Pro Dengan Membayar Rp Rp 12.200.000','$'
daftar7 db 13,10,'Anda Membeli Handphone Xiaomi 12 Dengan Membayar Rp 9.465.000','$'
end start