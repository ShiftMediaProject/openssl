default	rel
%define XMMWORD
%define YMMWORD
%define ZMMWORD
section	.text code align=64


ALIGN	64
$L$AVX2_AND_MASK:
$L$AVX2_POLY:
	DQ	0x1fffffff,0x1fffffff,0x1fffffff,0x1fffffff
	DQ	0x1fffffff,0x1fffffff,0x1fffffff,0x1fffffff
	DQ	0x1fffffff,0x1fffffff,0x1fffffff,0x1fffffff
	DQ	0x000001ff,0x000001ff,0x000001ff,0x000001ff
	DQ	0x00000000,0x00000000,0x00000000,0x00000000
	DQ	0x00000000,0x00000000,0x00000000,0x00000000
	DQ	0x00040000,0x00040000,0x00040000,0x00040000
	DQ	0x1fe00000,0x1fe00000,0x1fe00000,0x1fe00000
	DQ	0x00ffffff,0x00ffffff,0x00ffffff,0x00ffffff

$L$AVX2_POLY_x2:
	DQ	0x7FFFFFFC,0x7FFFFFFC,0x7FFFFFFC,0x7FFFFFFC
	DQ	0x7FFFFFFC,0x7FFFFFFC,0x7FFFFFFC,0x7FFFFFFC
	DQ	0x7FFFFFFC,0x7FFFFFFC,0x7FFFFFFC,0x7FFFFFFC
	DQ	0x400007FC,0x400007FC,0x400007FC,0x400007FC
	DQ	0x3FFFFFFE,0x3FFFFFFE,0x3FFFFFFE,0x3FFFFFFE
	DQ	0x3FFFFFFE,0x3FFFFFFE,0x3FFFFFFE,0x3FFFFFFE
	DQ	0x400FFFFE,0x400FFFFE,0x400FFFFE,0x400FFFFE
	DQ	0x7F7FFFFE,0x7F7FFFFE,0x7F7FFFFE,0x7F7FFFFE
	DQ	0x03FFFFFC,0x03FFFFFC,0x03FFFFFC,0x03FFFFFC

$L$AVX2_POLY_x8:
	DQ	0xFFFFFFF8,0xFFFFFFF8,0xFFFFFFF8,0xFFFFFFF8
	DQ	0xFFFFFFF8,0xFFFFFFF8,0xFFFFFFF8,0xFFFFFFF8
	DQ	0xFFFFFFF8,0xFFFFFFF8,0xFFFFFFF8,0xFFFFFFF8
	DQ	0x80000FF8,0x80000FF8,0x80000FF8,0x80000FF8
	DQ	0x7FFFFFFC,0x7FFFFFFC,0x7FFFFFFC,0x7FFFFFFC
	DQ	0x7FFFFFFC,0x7FFFFFFC,0x7FFFFFFC,0x7FFFFFFC
	DQ	0x801FFFFC,0x801FFFFC,0x801FFFFC,0x801FFFFC
	DQ	0xFEFFFFFC,0xFEFFFFFC,0xFEFFFFFC,0xFEFFFFFC
	DQ	0x07FFFFF8,0x07FFFFF8,0x07FFFFF8,0x07FFFFF8

$L$ONE:
	DQ	0x00000020,0x00000020,0x00000020,0x00000020
	DQ	0x00000000,0x00000000,0x00000000,0x00000000
	DQ	0x00000000,0x00000000,0x00000000,0x00000000
	DQ	0x1fffc000,0x1fffc000,0x1fffc000,0x1fffc000
	DQ	0x1fffffff,0x1fffffff,0x1fffffff,0x1fffffff
	DQ	0x1fffffff,0x1fffffff,0x1fffffff,0x1fffffff
	DQ	0x1f7fffff,0x1f7fffff,0x1f7fffff,0x1f7fffff
	DQ	0x03ffffff,0x03ffffff,0x03ffffff,0x03ffffff
	DQ	0x00000000,0x00000000,0x00000000,0x00000000




$L$TO_MONT_AVX2:
	DQ	0x00000400,0x00000400,0x00000400,0x00000400
	DQ	0x00000000,0x00000000,0x00000000,0x00000000
	DQ	0x00000000,0x00000000,0x00000000,0x00000000
	DQ	0x1ff80000,0x1ff80000,0x1ff80000,0x1ff80000
	DQ	0x1fffffff,0x1fffffff,0x1fffffff,0x1fffffff
	DQ	0x1fffffff,0x1fffffff,0x1fffffff,0x1fffffff
	DQ	0x0fffffff,0x0fffffff,0x0fffffff,0x0fffffff
	DQ	0x1fffffff,0x1fffffff,0x1fffffff,0x1fffffff
	DQ	0x00000003,0x00000003,0x00000003,0x00000003

$L$FROM_MONT_AVX2:
	DQ	0x00000001,0x00000001,0x00000001,0x00000001
	DQ	0x00000000,0x00000000,0x00000000,0x00000000
	DQ	0x00000000,0x00000000,0x00000000,0x00000000
	DQ	0x1ffffe00,0x1ffffe00,0x1ffffe00,0x1ffffe00
	DQ	0x1fffffff,0x1fffffff,0x1fffffff,0x1fffffff
	DQ	0x1fffffff,0x1fffffff,0x1fffffff,0x1fffffff
	DQ	0x1ffbffff,0x1ffbffff,0x1ffbffff,0x1ffbffff
	DQ	0x001fffff,0x001fffff,0x001fffff,0x001fffff
	DQ	0x00000000,0x00000000,0x00000000,0x00000000

$L$IntOne:
	DD	1,1,1,1,1,1,1,1
global	ecp_nistz256_avx2_transpose_convert

ALIGN	64
ecp_nistz256_avx2_transpose_convert:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_ecp_nistz256_avx2_transpose_convert:
	mov	rdi,rcx
	mov	rsi,rdx


	vzeroupper
	lea	rsp,[((-8-160))+rsp]
	vmovaps	XMMWORD[(-8-160)+rax],xmm6
	vmovaps	XMMWORD[(-8-144)+rax],xmm7
	vmovaps	XMMWORD[(-8-128)+rax],xmm8
	vmovaps	XMMWORD[(-8-112)+rax],xmm9
	vmovaps	XMMWORD[(-8-96)+rax],xmm10
	vmovaps	XMMWORD[(-8-80)+rax],xmm11
	vmovaps	XMMWORD[(-8-64)+rax],xmm12
	vmovaps	XMMWORD[(-8-48)+rax],xmm13
	vmovaps	XMMWORD[(-8-32)+rax],xmm14
	vmovaps	XMMWORD[(-8-16)+rax],xmm15

	vmovdqa	ymm0,YMMWORD[rsi]
	lea	rax,[112+rsi]
	vmovdqa	ymm4,YMMWORD[32+rsi]
	lea	rdx,[$L$AVX2_AND_MASK]
	vmovdqa	ymm1,YMMWORD[64+rsi]
	vmovdqa	ymm5,YMMWORD[96+rsi]
	vmovdqa	ymm2,YMMWORD[((128-112))+rax]
	vmovdqa	ymm6,YMMWORD[((160-112))+rax]
	vmovdqa	ymm3,YMMWORD[((192-112))+rax]
	vmovdqa	ymm7,YMMWORD[((224-112))+rax]


	vpunpcklqdq	ymm8,ymm0,ymm1
	vpunpcklqdq	ymm9,ymm2,ymm3
	vpunpckhqdq	ymm10,ymm0,ymm1
	vpunpckhqdq	ymm11,ymm2,ymm3

	vpunpcklqdq	ymm12,ymm4,ymm5
	vpunpcklqdq	ymm13,ymm6,ymm7
	vpunpckhqdq	ymm14,ymm4,ymm5
	vpunpckhqdq	ymm15,ymm6,ymm7

	vperm2i128	ymm0,ymm8,ymm9,0x20
	vperm2i128	ymm1,ymm10,ymm11,0x20
	vperm2i128	ymm2,ymm8,ymm9,0x31
	vperm2i128	ymm3,ymm10,ymm11,0x31

	vperm2i128	ymm4,ymm12,ymm13,0x20
	vperm2i128	ymm5,ymm14,ymm15,0x20
	vperm2i128	ymm6,ymm12,ymm13,0x31
	vperm2i128	ymm7,ymm14,ymm15,0x31
	vmovdqa	ymm15,YMMWORD[rdx]

	vpand	ymm8,ymm0,YMMWORD[rdx]
	vpsrlq	ymm0,ymm0,29
	vpand	ymm9,ymm0,ymm15
	vpsrlq	ymm0,ymm0,29
	vpsllq	ymm10,ymm1,6
	vpxor	ymm10,ymm10,ymm0
	vpand	ymm10,ymm10,ymm15
	vpsrlq	ymm1,ymm1,23
	vpand	ymm11,ymm1,ymm15
	vpsrlq	ymm1,ymm1,29
	vpsllq	ymm12,ymm2,12
	vpxor	ymm12,ymm12,ymm1
	vpand	ymm12,ymm12,ymm15
	vpsrlq	ymm2,ymm2,17
	vpand	ymm13,ymm2,ymm15
	vpsrlq	ymm2,ymm2,29
	vpsllq	ymm14,ymm3,18
	vpxor	ymm14,ymm14,ymm2
	vpand	ymm14,ymm14,ymm15
	vpsrlq	ymm3,ymm3,11
	vmovdqa	YMMWORD[rdi],ymm8
	lea	rax,[112+rdi]
	vpand	ymm8,ymm3,ymm15
	vpsrlq	ymm3,ymm3,29

	vmovdqa	YMMWORD[32+rdi],ymm9
	vmovdqa	YMMWORD[64+rdi],ymm10
	vmovdqa	YMMWORD[96+rdi],ymm11
	vmovdqa	YMMWORD[(128-112)+rax],ymm12
	vmovdqa	YMMWORD[(160-112)+rax],ymm13
	vmovdqa	YMMWORD[(192-112)+rax],ymm14
	vmovdqa	YMMWORD[(224-112)+rax],ymm8
	vmovdqa	YMMWORD[(256-112)+rax],ymm3
	lea	rax,[448+rdi]

	vpand	ymm8,ymm4,ymm15
	vpsrlq	ymm4,ymm4,29
	vpand	ymm9,ymm4,ymm15
	vpsrlq	ymm4,ymm4,29
	vpsllq	ymm10,ymm5,6
	vpxor	ymm10,ymm10,ymm4
	vpand	ymm10,ymm10,ymm15
	vpsrlq	ymm5,ymm5,23
	vpand	ymm11,ymm5,ymm15
	vpsrlq	ymm5,ymm5,29
	vpsllq	ymm12,ymm6,12
	vpxor	ymm12,ymm12,ymm5
	vpand	ymm12,ymm12,ymm15
	vpsrlq	ymm6,ymm6,17
	vpand	ymm13,ymm6,ymm15
	vpsrlq	ymm6,ymm6,29
	vpsllq	ymm14,ymm7,18
	vpxor	ymm14,ymm14,ymm6
	vpand	ymm14,ymm14,ymm15
	vpsrlq	ymm7,ymm7,11
	vmovdqa	YMMWORD[(288-448)+rax],ymm8
	vpand	ymm8,ymm7,ymm15
	vpsrlq	ymm7,ymm7,29

	vmovdqa	YMMWORD[(320-448)+rax],ymm9
	vmovdqa	YMMWORD[(352-448)+rax],ymm10
	vmovdqa	YMMWORD[(384-448)+rax],ymm11
	vmovdqa	YMMWORD[(416-448)+rax],ymm12
	vmovdqa	YMMWORD[(448-448)+rax],ymm13
	vmovdqa	YMMWORD[(480-448)+rax],ymm14
	vmovdqa	YMMWORD[(512-448)+rax],ymm8
	vmovdqa	YMMWORD[(544-448)+rax],ymm7

	vzeroupper
	movaps	xmm6,XMMWORD[rsp]
	movaps	xmm7,XMMWORD[16+rsp]
	movaps	xmm8,XMMWORD[32+rsp]
	movaps	xmm9,XMMWORD[48+rsp]
	movaps	xmm10,XMMWORD[64+rsp]
	movaps	xmm11,XMMWORD[80+rsp]
	movaps	xmm12,XMMWORD[96+rsp]
	movaps	xmm13,XMMWORD[112+rsp]
	movaps	xmm14,XMMWORD[128+rsp]
	movaps	xmm15,XMMWORD[144+rsp]
	lea	rsp,[((8+160))+rsp]
	mov	rdi,QWORD[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD[16+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_ecp_nistz256_avx2_transpose_convert:

global	ecp_nistz256_avx2_convert_transpose_back

ALIGN	32
ecp_nistz256_avx2_convert_transpose_back:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_ecp_nistz256_avx2_convert_transpose_back:
	mov	rdi,rcx
	mov	rsi,rdx


	vzeroupper
	lea	rsp,[((-8-160))+rsp]
	vmovaps	XMMWORD[(-8-160)+rax],xmm6
	vmovaps	XMMWORD[(-8-144)+rax],xmm7
	vmovaps	XMMWORD[(-8-128)+rax],xmm8
	vmovaps	XMMWORD[(-8-112)+rax],xmm9
	vmovaps	XMMWORD[(-8-96)+rax],xmm10
	vmovaps	XMMWORD[(-8-80)+rax],xmm11
	vmovaps	XMMWORD[(-8-64)+rax],xmm12
	vmovaps	XMMWORD[(-8-48)+rax],xmm13
	vmovaps	XMMWORD[(-8-32)+rax],xmm14
	vmovaps	XMMWORD[(-8-16)+rax],xmm15
	mov	ecx,3

$L$conv_loop:
	vmovdqa	ymm0,YMMWORD[rsi]
	lea	rax,[160+rsi]
	vmovdqa	ymm1,YMMWORD[32+rsi]
	vmovdqa	ymm2,YMMWORD[64+rsi]
	vmovdqa	ymm3,YMMWORD[96+rsi]
	vmovdqa	ymm4,YMMWORD[((128-160))+rax]
	vmovdqa	ymm5,YMMWORD[((160-160))+rax]
	vmovdqa	ymm6,YMMWORD[((192-160))+rax]
	vmovdqa	ymm7,YMMWORD[((224-160))+rax]
	vmovdqa	ymm8,YMMWORD[((256-160))+rax]

	vpsllq	ymm1,ymm1,29
	vpsllq	ymm9,ymm2,58
	vpaddq	ymm0,ymm0,ymm1
	vpaddq	ymm0,ymm0,ymm9

	vpsrlq	ymm2,ymm2,6
	vpsllq	ymm3,ymm3,23
	vpsllq	ymm10,ymm4,52
	vpaddq	ymm3,ymm3,ymm2
	vpaddq	ymm1,ymm10,ymm3

	vpsrlq	ymm4,ymm4,12
	vpsllq	ymm5,ymm5,17
	vpsllq	ymm11,ymm6,46
	vpaddq	ymm5,ymm5,ymm4
	vpaddq	ymm2,ymm11,ymm5

	vpsrlq	ymm6,ymm6,18
	vpsllq	ymm7,ymm7,11
	vpsllq	ymm12,ymm8,40
	vpaddq	ymm7,ymm7,ymm6
	vpaddq	ymm3,ymm12,ymm7

	vpunpcklqdq	ymm9,ymm0,ymm1
	vpunpcklqdq	ymm10,ymm2,ymm3
	vpunpckhqdq	ymm11,ymm0,ymm1
	vpunpckhqdq	ymm12,ymm2,ymm3

	vperm2i128	ymm0,ymm9,ymm10,0x20
	vperm2i128	ymm1,ymm11,ymm12,0x20
	vperm2i128	ymm2,ymm9,ymm10,0x31
	vperm2i128	ymm3,ymm11,ymm12,0x31

	vmovdqa	YMMWORD[rdi],ymm0
	vmovdqa	YMMWORD[96+rdi],ymm1
	vmovdqa	YMMWORD[192+rdi],ymm2
	vmovdqa	YMMWORD[288+rdi],ymm3

	lea	rsi,[288+rsi]
	lea	rdi,[32+rdi]

	dec	ecx
	jnz	NEAR $L$conv_loop

	vzeroupper
	movaps	xmm6,XMMWORD[rsp]
	movaps	xmm7,XMMWORD[16+rsp]
	movaps	xmm8,XMMWORD[32+rsp]
	movaps	xmm9,XMMWORD[48+rsp]
	movaps	xmm10,XMMWORD[64+rsp]
	movaps	xmm11,XMMWORD[80+rsp]
	movaps	xmm12,XMMWORD[96+rsp]
	movaps	xmm13,XMMWORD[112+rsp]
	movaps	xmm14,XMMWORD[128+rsp]
	movaps	xmm15,XMMWORD[144+rsp]
	lea	rsp,[((8+160))+rsp]
	mov	rdi,QWORD[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD[16+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_ecp_nistz256_avx2_convert_transpose_back:

ALIGN	32
avx2_normalize:
	vpsrlq	ymm11,ymm0,29
	vpand	ymm0,ymm0,ymm12
	vpaddq	ymm1,ymm1,ymm11

	vpsrlq	ymm11,ymm1,29
	vpand	ymm1,ymm1,ymm12
	vpaddq	ymm2,ymm2,ymm11

	vpsrlq	ymm11,ymm2,29
	vpand	ymm2,ymm2,ymm12
	vpaddq	ymm3,ymm3,ymm11

	vpsrlq	ymm11,ymm3,29
	vpand	ymm3,ymm3,ymm12
	vpaddq	ymm4,ymm4,ymm11

	vpsrlq	ymm11,ymm4,29
	vpand	ymm4,ymm4,ymm12
	vpaddq	ymm5,ymm5,ymm11

	vpsrlq	ymm11,ymm5,29
	vpand	ymm5,ymm5,ymm12
	vpaddq	ymm6,ymm6,ymm11

	vpsrlq	ymm11,ymm6,29
	vpand	ymm6,ymm6,ymm12
	vpaddq	ymm7,ymm7,ymm11

	vpsrlq	ymm11,ymm7,29
	vpand	ymm7,ymm7,ymm12
	vpaddq	ymm8,ymm8,ymm11


	DB	0F3h,0C3h		;repret



ALIGN	32
avx2_normalize_n_store:
	vpsrlq	ymm11,ymm0,29
	vpand	ymm0,ymm0,ymm12
	vpaddq	ymm1,ymm1,ymm11

	vpsrlq	ymm11,ymm1,29
	vpand	ymm1,ymm1,ymm12
	vmovdqa	YMMWORD[rdi],ymm0
	lea	rax,[160+rdi]
	vpaddq	ymm2,ymm2,ymm11

	vpsrlq	ymm11,ymm2,29
	vpand	ymm2,ymm2,ymm12
	vmovdqa	YMMWORD[32+rdi],ymm1
	vpaddq	ymm3,ymm3,ymm11

	vpsrlq	ymm11,ymm3,29
	vpand	ymm3,ymm3,ymm12
	vmovdqa	YMMWORD[64+rdi],ymm2
	vpaddq	ymm4,ymm4,ymm11

	vpsrlq	ymm11,ymm4,29
	vpand	ymm4,ymm4,ymm12
	vmovdqa	YMMWORD[96+rdi],ymm3
	vpaddq	ymm5,ymm5,ymm11

	vpsrlq	ymm11,ymm5,29
	vpand	ymm5,ymm5,ymm12
	vmovdqa	YMMWORD[(128-160)+rax],ymm4
	vpaddq	ymm6,ymm6,ymm11

	vpsrlq	ymm11,ymm6,29
	vpand	ymm6,ymm6,ymm12
	vmovdqa	YMMWORD[(160-160)+rax],ymm5
	vpaddq	ymm7,ymm7,ymm11

	vpsrlq	ymm11,ymm7,29
	vpand	ymm7,ymm7,ymm12
	vmovdqa	YMMWORD[(192-160)+rax],ymm6
	vpaddq	ymm8,ymm8,ymm11

	vmovdqa	YMMWORD[(224-160)+rax],ymm7
	vmovdqa	YMMWORD[(256-160)+rax],ymm8

	DB	0F3h,0C3h		;repret





ALIGN	32
avx2_mul_x4:
	lea	rax,[$L$AVX2_POLY]

	vpxor	ymm0,ymm0,ymm0
	vpxor	ymm1,ymm1,ymm1
	vpxor	ymm2,ymm2,ymm2
	vpxor	ymm3,ymm3,ymm3
	vpxor	ymm4,ymm4,ymm4
	vpxor	ymm5,ymm5,ymm5
	vpxor	ymm6,ymm6,ymm6
	vpxor	ymm7,ymm7,ymm7

	vmovdqa	ymm14,YMMWORD[224+rax]
	vmovdqa	ymm15,YMMWORD[256+rax]

	mov	ecx,9
	lea	rsi,[((-512))+rsi]
	jmp	NEAR $L$avx2_mul_x4_loop

ALIGN	32
$L$avx2_mul_x4_loop:
	vmovdqa	ymm9,YMMWORD[rdx]
	lea	rdx,[32+rdx]

	vpmuludq	ymm11,ymm9,YMMWORD[((0+512))+rsi]
	vpmuludq	ymm13,ymm9,YMMWORD[((32+512))+rsi]
	vpaddq	ymm0,ymm0,ymm11
	vpmuludq	ymm11,ymm9,YMMWORD[((64+512))+rsi]
	vpaddq	ymm1,ymm1,ymm13
	vpand	ymm10,ymm0,ymm12
	vpmuludq	ymm13,ymm9,YMMWORD[((96+512))+rsi]
	vpaddq	ymm2,ymm2,ymm11
	vpmuludq	ymm11,ymm9,YMMWORD[((128+512))+rsi]
	vpaddq	ymm3,ymm3,ymm13
	vpmuludq	ymm13,ymm9,YMMWORD[((160+512))+rsi]
	vpaddq	ymm4,ymm4,ymm11
	vpmuludq	ymm11,ymm9,YMMWORD[((192+512))+rsi]
	vpaddq	ymm5,ymm5,ymm13
	vpmuludq	ymm13,ymm9,YMMWORD[((224+512))+rsi]
	vpaddq	ymm6,ymm6,ymm11


	vpmuludq	ymm11,ymm10,ymm12
	vpaddq	ymm7,ymm7,ymm13
	vpmuludq	ymm8,ymm9,YMMWORD[((256+512))+rsi]
	vpaddq	ymm13,ymm0,ymm11
	vpaddq	ymm0,ymm1,ymm11
	vpsrlq	ymm13,ymm13,29
	vpaddq	ymm1,ymm2,ymm11
	vpmuludq	ymm11,ymm10,YMMWORD[96+rax]
	vpaddq	ymm0,ymm0,ymm13
	vpaddq	ymm2,ymm3,ymm11
DB	0x67
	vmovdqa	ymm3,ymm4
	vpsllq	ymm13,ymm10,18
DB	0x67
	vmovdqa	ymm4,ymm5
	vpmuludq	ymm11,ymm10,ymm14
	vpaddq	ymm5,ymm6,ymm13
	vpmuludq	ymm13,ymm10,ymm15
	vpaddq	ymm6,ymm7,ymm11
	vpaddq	ymm7,ymm8,ymm13

	dec	ecx
	jnz	NEAR $L$avx2_mul_x4_loop

	vpxor	ymm8,ymm8,ymm8

	DB	0F3h,0C3h		;repret






ALIGN	32
avx2_mul_by1_x4:
	lea	rax,[$L$AVX2_POLY]

	vpxor	ymm0,ymm0,ymm0
	vpxor	ymm1,ymm1,ymm1
	vpxor	ymm2,ymm2,ymm2
	vpxor	ymm3,ymm3,ymm3
	vpxor	ymm4,ymm4,ymm4
	vpxor	ymm5,ymm5,ymm5
	vpxor	ymm6,ymm6,ymm6
	vpxor	ymm7,ymm7,ymm7
	vpxor	ymm8,ymm8,ymm8

	vmovdqa	ymm14,YMMWORD[((96+$L$ONE))]
	vmovdqa	ymm15,YMMWORD[((224+$L$ONE))]

	mov	ecx,9
	jmp	NEAR $L$avx2_mul_by1_x4_loop

ALIGN	32
$L$avx2_mul_by1_x4_loop:
	vmovdqa	ymm9,YMMWORD[rsi]
DB	0x48,0x8d,0xb6,0x20,0,0,0

	vpsllq	ymm13,ymm9,5
	vpmuludq	ymm11,ymm9,ymm14
	vpaddq	ymm0,ymm0,ymm13
	vpaddq	ymm3,ymm3,ymm11
DB	0x67
	vpmuludq	ymm11,ymm9,ymm12
	vpand	ymm10,ymm0,ymm12
	vpaddq	ymm4,ymm4,ymm11
	vpaddq	ymm5,ymm5,ymm11
	vpaddq	ymm6,ymm6,ymm11
	vpsllq	ymm11,ymm9,23

DB	0x67,0x67
	vpmuludq	ymm13,ymm9,ymm15
	vpsubq	ymm6,ymm6,ymm11

	vpmuludq	ymm11,ymm10,ymm12
	vpaddq	ymm7,ymm7,ymm13
	vpaddq	ymm13,ymm0,ymm11
	vpaddq	ymm0,ymm1,ymm11
DB	0x67,0x67
	vpsrlq	ymm13,ymm13,29
	vpaddq	ymm1,ymm2,ymm11
	vpmuludq	ymm11,ymm10,YMMWORD[96+rax]
	vpaddq	ymm0,ymm0,ymm13
	vpaddq	ymm2,ymm3,ymm11
	vmovdqa	ymm3,ymm4
	vpsllq	ymm13,ymm10,18
	vmovdqa	ymm4,ymm5
	vpmuludq	ymm11,ymm10,YMMWORD[224+rax]
	vpaddq	ymm5,ymm6,ymm13
	vpaddq	ymm6,ymm7,ymm11
	vpmuludq	ymm7,ymm10,YMMWORD[256+rax]

	dec	ecx
	jnz	NEAR $L$avx2_mul_by1_x4_loop

	DB	0F3h,0C3h		;repret





ALIGN	32
avx2_sqr_x4:
	lea	rax,[$L$AVX2_POLY]

	vmovdqa	ymm14,YMMWORD[224+rax]
	vmovdqa	ymm15,YMMWORD[256+rax]

	vmovdqa	ymm9,YMMWORD[rsi]
	vmovdqa	ymm1,YMMWORD[32+rsi]
	vmovdqa	ymm2,YMMWORD[64+rsi]
	vmovdqa	ymm3,YMMWORD[96+rsi]
	vmovdqa	ymm4,YMMWORD[128+rsi]
	vmovdqa	ymm5,YMMWORD[160+rsi]
	vmovdqa	ymm6,YMMWORD[192+rsi]
	vmovdqa	ymm7,YMMWORD[224+rsi]
	vpaddq	ymm1,ymm1,ymm1
	vmovdqa	ymm8,YMMWORD[256+rsi]
	vpaddq	ymm2,ymm2,ymm2
	vmovdqa	YMMWORD[rcx],ymm1
	vpaddq	ymm3,ymm3,ymm3
	vmovdqa	YMMWORD[32+rcx],ymm2
	vpaddq	ymm4,ymm4,ymm4
	vmovdqa	YMMWORD[64+rcx],ymm3
	vpaddq	ymm5,ymm5,ymm5
	vmovdqa	YMMWORD[96+rcx],ymm4
	vpaddq	ymm6,ymm6,ymm6
	vmovdqa	YMMWORD[128+rcx],ymm5
	vpaddq	ymm7,ymm7,ymm7
	vmovdqa	YMMWORD[160+rcx],ymm6
	vpaddq	ymm8,ymm8,ymm8
	vmovdqa	YMMWORD[192+rcx],ymm7
	vmovdqa	YMMWORD[224+rcx],ymm8


	vpmuludq	ymm0,ymm9,ymm9
	vpmuludq	ymm1,ymm1,ymm9
	vpand	ymm10,ymm0,ymm12
	vpmuludq	ymm2,ymm2,ymm9
	vpmuludq	ymm3,ymm3,ymm9
	vpmuludq	ymm4,ymm4,ymm9
	vpmuludq	ymm5,ymm5,ymm9
	vpmuludq	ymm6,ymm6,ymm9
	vpmuludq	ymm11,ymm10,ymm12
	vpmuludq	ymm7,ymm7,ymm9
	vpmuludq	ymm8,ymm8,ymm9
	vmovdqa	ymm9,YMMWORD[32+rsi]

	vpaddq	ymm13,ymm0,ymm11
	vpaddq	ymm0,ymm1,ymm11
	vpsrlq	ymm13,ymm13,29
	vpaddq	ymm1,ymm2,ymm11
	vpmuludq	ymm11,ymm10,YMMWORD[96+rax]
	vpaddq	ymm0,ymm0,ymm13
	vpaddq	ymm2,ymm3,ymm11
	vmovdqa	ymm3,ymm4
	vpsllq	ymm11,ymm10,18
	vmovdqa	ymm4,ymm5
	vpmuludq	ymm13,ymm10,ymm14
	vpaddq	ymm5,ymm6,ymm11
	vpmuludq	ymm11,ymm10,ymm15
	vpaddq	ymm6,ymm7,ymm13
	vpaddq	ymm7,ymm8,ymm11


	vpmuludq	ymm13,ymm9,ymm9
	vpand	ymm10,ymm0,ymm12
	vpmuludq	ymm11,ymm9,YMMWORD[32+rcx]
	vpaddq	ymm1,ymm1,ymm13
	vpmuludq	ymm13,ymm9,YMMWORD[64+rcx]
	vpaddq	ymm2,ymm2,ymm11
	vpmuludq	ymm11,ymm9,YMMWORD[96+rcx]
	vpaddq	ymm3,ymm3,ymm13
	vpmuludq	ymm13,ymm9,YMMWORD[128+rcx]
	vpaddq	ymm4,ymm4,ymm11
	vpmuludq	ymm11,ymm9,YMMWORD[160+rcx]
	vpaddq	ymm5,ymm5,ymm13
	vpmuludq	ymm13,ymm9,YMMWORD[192+rcx]
	vpaddq	ymm6,ymm6,ymm11

	vpmuludq	ymm11,ymm10,ymm12
	vpaddq	ymm7,ymm7,ymm13
	vpmuludq	ymm8,ymm9,YMMWORD[224+rcx]
	vmovdqa	ymm9,YMMWORD[64+rsi]
	vpaddq	ymm13,ymm0,ymm11
	vpaddq	ymm0,ymm1,ymm11
	vpsrlq	ymm13,ymm13,29
	vpaddq	ymm1,ymm2,ymm11
	vpmuludq	ymm11,ymm10,YMMWORD[96+rax]
	vpaddq	ymm0,ymm0,ymm13
	vpaddq	ymm2,ymm3,ymm11
	vmovdqa	ymm3,ymm4
	vpsllq	ymm11,ymm10,18
	vmovdqa	ymm4,ymm5
	vpmuludq	ymm13,ymm10,ymm14
	vpaddq	ymm5,ymm6,ymm11
	vpmuludq	ymm11,ymm10,ymm15
	vpaddq	ymm6,ymm7,ymm13
	vpaddq	ymm7,ymm8,ymm11


	vpmuludq	ymm11,ymm9,ymm9
	vpand	ymm10,ymm0,ymm12
	vpmuludq	ymm13,ymm9,YMMWORD[64+rcx]
	vpaddq	ymm2,ymm2,ymm11
	vpmuludq	ymm11,ymm9,YMMWORD[96+rcx]
	vpaddq	ymm3,ymm3,ymm13
	vpmuludq	ymm13,ymm9,YMMWORD[128+rcx]
	vpaddq	ymm4,ymm4,ymm11
	vpmuludq	ymm11,ymm9,YMMWORD[160+rcx]
	vpaddq	ymm5,ymm5,ymm13
	vpmuludq	ymm13,ymm9,YMMWORD[192+rcx]
	vpaddq	ymm6,ymm6,ymm11

	vpmuludq	ymm11,ymm10,ymm12
	vpaddq	ymm7,ymm7,ymm13
	vpmuludq	ymm8,ymm9,YMMWORD[224+rcx]
	vmovdqa	ymm9,YMMWORD[96+rsi]
	vpaddq	ymm13,ymm0,ymm11
	vpaddq	ymm0,ymm1,ymm11
	vpsrlq	ymm13,ymm13,29
	vpaddq	ymm1,ymm2,ymm11
	vpmuludq	ymm11,ymm10,YMMWORD[96+rax]
	vpaddq	ymm0,ymm0,ymm13
	vpaddq	ymm2,ymm3,ymm11
	vmovdqa	ymm3,ymm4
	vpsllq	ymm11,ymm10,18
	vmovdqa	ymm4,ymm5
	vpmuludq	ymm13,ymm10,ymm14
	vpaddq	ymm5,ymm6,ymm11
	vpmuludq	ymm11,ymm10,ymm15
	vpand	ymm10,ymm0,ymm12
	vpaddq	ymm6,ymm7,ymm13
	vpaddq	ymm7,ymm8,ymm11


	vpmuludq	ymm13,ymm9,ymm9
	vpmuludq	ymm11,ymm9,YMMWORD[96+rcx]
	vpaddq	ymm3,ymm3,ymm13
	vpmuludq	ymm13,ymm9,YMMWORD[128+rcx]
	vpaddq	ymm4,ymm4,ymm11
	vpmuludq	ymm11,ymm9,YMMWORD[160+rcx]
	vpaddq	ymm5,ymm5,ymm13
	vpmuludq	ymm13,ymm9,YMMWORD[192+rcx]
	vpaddq	ymm6,ymm6,ymm11

	vpmuludq	ymm11,ymm10,ymm12
	vpaddq	ymm7,ymm7,ymm13
	vpmuludq	ymm8,ymm9,YMMWORD[224+rcx]
	vmovdqa	ymm9,YMMWORD[128+rsi]
	vpaddq	ymm13,ymm0,ymm11
	vpaddq	ymm0,ymm1,ymm11
	vpsrlq	ymm13,ymm13,29
	vpaddq	ymm1,ymm2,ymm11
	vpmuludq	ymm11,ymm10,YMMWORD[96+rax]
	vpaddq	ymm0,ymm0,ymm13
	vpaddq	ymm2,ymm3,ymm11
	vmovdqa	ymm3,ymm4
	vpsllq	ymm11,ymm10,18
	vmovdqa	ymm4,ymm5
	vpmuludq	ymm13,ymm10,ymm14
	vpaddq	ymm5,ymm6,ymm11
	vpmuludq	ymm11,ymm10,ymm15
	vpand	ymm10,ymm0,ymm12
	vpaddq	ymm6,ymm7,ymm13
	vpaddq	ymm7,ymm8,ymm11


	vpmuludq	ymm11,ymm9,ymm9
	vpmuludq	ymm13,ymm9,YMMWORD[128+rcx]
	vpaddq	ymm4,ymm4,ymm11
	vpmuludq	ymm11,ymm9,YMMWORD[160+rcx]
	vpaddq	ymm5,ymm5,ymm13
	vpmuludq	ymm13,ymm9,YMMWORD[192+rcx]
	vpaddq	ymm6,ymm6,ymm11

	vpmuludq	ymm11,ymm10,ymm12
	vpaddq	ymm7,ymm7,ymm13
	vpmuludq	ymm8,ymm9,YMMWORD[224+rcx]
	vmovdqa	ymm9,YMMWORD[160+rsi]
	vpaddq	ymm13,ymm0,ymm11
	vpsrlq	ymm13,ymm13,29
	vpaddq	ymm0,ymm1,ymm11
	vpaddq	ymm1,ymm2,ymm11
	vpmuludq	ymm11,ymm10,YMMWORD[((96+$L$AVX2_POLY))]
	vpaddq	ymm0,ymm0,ymm13
	vpaddq	ymm2,ymm3,ymm11
	vmovdqa	ymm3,ymm4
	vpsllq	ymm11,ymm10,18
	vmovdqa	ymm4,ymm5
	vpmuludq	ymm13,ymm10,ymm14
	vpaddq	ymm5,ymm6,ymm11
	vpmuludq	ymm11,ymm10,ymm15
	vpand	ymm10,ymm0,ymm12
	vpaddq	ymm6,ymm7,ymm13
	vpaddq	ymm7,ymm8,ymm11


	vpmuludq	ymm13,ymm9,ymm9
	vpmuludq	ymm11,ymm9,YMMWORD[160+rcx]
	vpaddq	ymm5,ymm5,ymm13
	vpmuludq	ymm13,ymm9,YMMWORD[192+rcx]
	vpaddq	ymm6,ymm6,ymm11

	vpmuludq	ymm11,ymm10,ymm12
	vpaddq	ymm7,ymm7,ymm13
	vpmuludq	ymm8,ymm9,YMMWORD[224+rcx]
	vmovdqa	ymm9,YMMWORD[192+rsi]
	vpaddq	ymm13,ymm0,ymm11
	vpaddq	ymm0,ymm1,ymm11
	vpsrlq	ymm13,ymm13,29
	vpaddq	ymm1,ymm2,ymm11
	vpmuludq	ymm11,ymm10,YMMWORD[96+rax]
	vpaddq	ymm0,ymm0,ymm13
	vpaddq	ymm2,ymm3,ymm11
	vmovdqa	ymm3,ymm4
	vpsllq	ymm11,ymm10,18
	vmovdqa	ymm4,ymm5
	vpmuludq	ymm13,ymm10,ymm14
	vpaddq	ymm5,ymm6,ymm11
	vpmuludq	ymm11,ymm10,ymm15
	vpand	ymm10,ymm0,ymm12
	vpaddq	ymm6,ymm7,ymm13
	vpaddq	ymm7,ymm8,ymm11


	vpmuludq	ymm11,ymm9,ymm9
	vpmuludq	ymm13,ymm9,YMMWORD[192+rcx]
	vpaddq	ymm6,ymm6,ymm11

	vpmuludq	ymm11,ymm10,ymm12
	vpaddq	ymm7,ymm7,ymm13
	vpmuludq	ymm8,ymm9,YMMWORD[224+rcx]
	vmovdqa	ymm9,YMMWORD[224+rsi]
	vpaddq	ymm13,ymm0,ymm11
	vpsrlq	ymm13,ymm13,29
	vpaddq	ymm0,ymm1,ymm11
	vpaddq	ymm1,ymm2,ymm11
	vpmuludq	ymm11,ymm10,YMMWORD[96+rax]
	vpaddq	ymm0,ymm0,ymm13
	vpaddq	ymm2,ymm3,ymm11
	vmovdqa	ymm3,ymm4
	vpsllq	ymm11,ymm10,18
	vmovdqa	ymm4,ymm5
	vpmuludq	ymm13,ymm10,ymm14
	vpaddq	ymm5,ymm6,ymm11
	vpmuludq	ymm11,ymm10,ymm15
	vpand	ymm10,ymm0,ymm12
	vpaddq	ymm6,ymm7,ymm13
	vpaddq	ymm7,ymm8,ymm11


	vpmuludq	ymm13,ymm9,ymm9

	vpmuludq	ymm11,ymm10,ymm12
	vpaddq	ymm7,ymm7,ymm13
	vpmuludq	ymm8,ymm9,YMMWORD[224+rcx]
	vmovdqa	ymm9,YMMWORD[256+rsi]
	vpaddq	ymm13,ymm0,ymm11
	vpsrlq	ymm13,ymm13,29
	vpaddq	ymm0,ymm1,ymm11
	vpaddq	ymm1,ymm2,ymm11
	vpmuludq	ymm11,ymm10,YMMWORD[96+rax]
	vpaddq	ymm0,ymm0,ymm13
	vpaddq	ymm2,ymm3,ymm11
	vmovdqa	ymm3,ymm4
	vpsllq	ymm11,ymm10,18
	vmovdqa	ymm4,ymm5
	vpmuludq	ymm13,ymm10,ymm14
	vpaddq	ymm5,ymm6,ymm11
	vpmuludq	ymm11,ymm10,ymm15
	vpand	ymm10,ymm0,ymm12
	vpaddq	ymm6,ymm7,ymm13
	vpaddq	ymm7,ymm8,ymm11


	vpmuludq	ymm8,ymm9,ymm9

	vpmuludq	ymm11,ymm10,ymm12
	vpaddq	ymm13,ymm0,ymm11
	vpsrlq	ymm13,ymm13,29
	vpaddq	ymm0,ymm1,ymm11
	vpaddq	ymm1,ymm2,ymm11
	vpmuludq	ymm11,ymm10,YMMWORD[96+rax]
	vpaddq	ymm0,ymm0,ymm13
	vpaddq	ymm2,ymm3,ymm11
	vmovdqa	ymm3,ymm4
	vpsllq	ymm11,ymm10,18
	vmovdqa	ymm4,ymm5
	vpmuludq	ymm13,ymm10,ymm14
	vpaddq	ymm5,ymm6,ymm11
	vpmuludq	ymm11,ymm10,ymm15
	vpaddq	ymm6,ymm7,ymm13
	vpaddq	ymm7,ymm8,ymm11

	vpxor	ymm8,ymm8,ymm8

	DB	0F3h,0C3h		;repret





ALIGN	32
avx2_sub_x4:
	vmovdqa	ymm0,YMMWORD[rsi]
	lea	rsi,[160+rsi]
	lea	rax,[(($L$AVX2_POLY_x8+128))]
	lea	rdx,[128+rdx]
	vmovdqa	ymm1,YMMWORD[((32-160))+rsi]
	vmovdqa	ymm2,YMMWORD[((64-160))+rsi]
	vmovdqa	ymm3,YMMWORD[((96-160))+rsi]
	vmovdqa	ymm4,YMMWORD[((128-160))+rsi]
	vmovdqa	ymm5,YMMWORD[((160-160))+rsi]
	vmovdqa	ymm6,YMMWORD[((192-160))+rsi]
	vmovdqa	ymm7,YMMWORD[((224-160))+rsi]
	vmovdqa	ymm8,YMMWORD[((256-160))+rsi]

	vpaddq	ymm0,ymm0,YMMWORD[((0-128))+rax]
	vpaddq	ymm1,ymm1,YMMWORD[((32-128))+rax]
	vpaddq	ymm2,ymm2,YMMWORD[((64-128))+rax]
	vpaddq	ymm3,ymm3,YMMWORD[((96-128))+rax]
	vpaddq	ymm4,ymm4,YMMWORD[((128-128))+rax]
	vpaddq	ymm5,ymm5,YMMWORD[((160-128))+rax]
	vpaddq	ymm6,ymm6,YMMWORD[((192-128))+rax]
	vpaddq	ymm7,ymm7,YMMWORD[((224-128))+rax]
	vpaddq	ymm8,ymm8,YMMWORD[((256-128))+rax]

	vpsubq	ymm0,ymm0,YMMWORD[((0-128))+rdx]
	vpsubq	ymm1,ymm1,YMMWORD[((32-128))+rdx]
	vpsubq	ymm2,ymm2,YMMWORD[((64-128))+rdx]
	vpsubq	ymm3,ymm3,YMMWORD[((96-128))+rdx]
	vpsubq	ymm4,ymm4,YMMWORD[((128-128))+rdx]
	vpsubq	ymm5,ymm5,YMMWORD[((160-128))+rdx]
	vpsubq	ymm6,ymm6,YMMWORD[((192-128))+rdx]
	vpsubq	ymm7,ymm7,YMMWORD[((224-128))+rdx]
	vpsubq	ymm8,ymm8,YMMWORD[((256-128))+rdx]

	DB	0F3h,0C3h		;repret



ALIGN	32
avx2_select_n_store:
	vmovdqa	ymm10,YMMWORD[2312+rsp]
	vpor	ymm10,ymm10,YMMWORD[2344+rsp]

	vpandn	ymm0,ymm10,ymm0
	vpandn	ymm1,ymm10,ymm1
	vpandn	ymm2,ymm10,ymm2
	vpandn	ymm3,ymm10,ymm3
	vpandn	ymm4,ymm10,ymm4
	vpandn	ymm5,ymm10,ymm5
	vpandn	ymm6,ymm10,ymm6
	vmovdqa	ymm9,YMMWORD[2344+rsp]
	vpandn	ymm7,ymm10,ymm7
	vpandn	ymm9,ymm9,YMMWORD[2312+rsp]
	vpandn	ymm8,ymm10,ymm8

	vpand	ymm11,ymm9,YMMWORD[rsi]
	lea	rax,[160+rsi]
	vpand	ymm10,ymm9,YMMWORD[32+rsi]
	vpxor	ymm0,ymm0,ymm11
	vpand	ymm11,ymm9,YMMWORD[64+rsi]
	vpxor	ymm1,ymm1,ymm10
	vpand	ymm10,ymm9,YMMWORD[96+rsi]
	vpxor	ymm2,ymm2,ymm11
	vpand	ymm11,ymm9,YMMWORD[((128-160))+rax]
	vpxor	ymm3,ymm3,ymm10
	vpand	ymm10,ymm9,YMMWORD[((160-160))+rax]
	vpxor	ymm4,ymm4,ymm11
	vpand	ymm11,ymm9,YMMWORD[((192-160))+rax]
	vpxor	ymm5,ymm5,ymm10
	vpand	ymm10,ymm9,YMMWORD[((224-160))+rax]
	vpxor	ymm6,ymm6,ymm11
	vpand	ymm11,ymm9,YMMWORD[((256-160))+rax]
	vmovdqa	ymm9,YMMWORD[2344+rsp]
	vpxor	ymm7,ymm7,ymm10

	vpand	ymm10,ymm9,YMMWORD[rdx]
	lea	rax,[160+rdx]
	vpxor	ymm8,ymm8,ymm11
	vpand	ymm11,ymm9,YMMWORD[32+rdx]
	vpxor	ymm0,ymm0,ymm10
	vpand	ymm10,ymm9,YMMWORD[64+rdx]
	vpxor	ymm1,ymm1,ymm11
	vpand	ymm11,ymm9,YMMWORD[96+rdx]
	vpxor	ymm2,ymm2,ymm10
	vpand	ymm10,ymm9,YMMWORD[((128-160))+rax]
	vpxor	ymm3,ymm3,ymm11
	vpand	ymm11,ymm9,YMMWORD[((160-160))+rax]
	vpxor	ymm4,ymm4,ymm10
	vpand	ymm10,ymm9,YMMWORD[((192-160))+rax]
	vpxor	ymm5,ymm5,ymm11
	vpand	ymm11,ymm9,YMMWORD[((224-160))+rax]
	vpxor	ymm6,ymm6,ymm10
	vpand	ymm10,ymm9,YMMWORD[((256-160))+rax]
	vpxor	ymm7,ymm7,ymm11
	vpxor	ymm8,ymm8,ymm10
	vmovdqa	YMMWORD[rdi],ymm0
	lea	rax,[160+rdi]
	vmovdqa	YMMWORD[32+rdi],ymm1
	vmovdqa	YMMWORD[64+rdi],ymm2
	vmovdqa	YMMWORD[96+rdi],ymm3
	vmovdqa	YMMWORD[(128-160)+rax],ymm4
	vmovdqa	YMMWORD[(160-160)+rax],ymm5
	vmovdqa	YMMWORD[(192-160)+rax],ymm6
	vmovdqa	YMMWORD[(224-160)+rax],ymm7
	vmovdqa	YMMWORD[(256-160)+rax],ymm8


	DB	0F3h,0C3h		;repret



global	ecp_nistz256_avx2_point_add_affine_x4

ALIGN	32
ecp_nistz256_avx2_point_add_affine_x4:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_ecp_nistz256_avx2_point_add_affine_x4:
	mov	rdi,rcx
	mov	rsi,rdx
	mov	rdx,r8


	mov	rax,rsp
	push	rbp
	vzeroupper
	lea	rsp,[((-160))+rsp]
	vmovaps	XMMWORD[(-8-160)+rax],xmm6
	vmovaps	XMMWORD[(-8-144)+rax],xmm7
	vmovaps	XMMWORD[(-8-128)+rax],xmm8
	vmovaps	XMMWORD[(-8-112)+rax],xmm9
	vmovaps	XMMWORD[(-8-96)+rax],xmm10
	vmovaps	XMMWORD[(-8-80)+rax],xmm11
	vmovaps	XMMWORD[(-8-64)+rax],xmm12
	vmovaps	XMMWORD[(-8-48)+rax],xmm13
	vmovaps	XMMWORD[(-8-32)+rax],xmm14
	vmovaps	XMMWORD[(-8-16)+rax],xmm15
	lea	rbp,[((-8))+rax]












	sub	rsp,2624
	and	rsp,-64

	mov	r8,rdi
	mov	r9,rsi
	mov	r10,rdx

	vmovdqa	ymm0,YMMWORD[rsi]
	vmovdqa	ymm12,YMMWORD[$L$AVX2_AND_MASK]
	vpxor	ymm1,ymm1,ymm1
	lea	rax,[256+rsi]
	vpor	ymm0,ymm0,YMMWORD[32+rsi]
	vpor	ymm0,ymm0,YMMWORD[64+rsi]
	vpor	ymm0,ymm0,YMMWORD[96+rsi]
	vpor	ymm0,ymm0,YMMWORD[((128-256))+rax]
	lea	rcx,[256+rax]
	vpor	ymm0,ymm0,YMMWORD[((160-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((192-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((224-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((256-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((288-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((320-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((352-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((384-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((416-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((448-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((480-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((512-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((544-512))+rcx]
	vpcmpeqq	ymm0,ymm0,ymm1
	vmovdqa	YMMWORD[2304+rsp],ymm0

	vpxor	ymm1,ymm1,ymm1
	vmovdqa	ymm0,YMMWORD[r10]
	lea	rax,[256+r10]
	vpor	ymm0,ymm0,YMMWORD[32+r10]
	vpor	ymm0,ymm0,YMMWORD[64+r10]
	vpor	ymm0,ymm0,YMMWORD[96+r10]
	vpor	ymm0,ymm0,YMMWORD[((128-256))+rax]
	lea	rcx,[256+rax]
	vpor	ymm0,ymm0,YMMWORD[((160-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((192-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((224-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((256-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((288-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((320-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((352-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((384-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((416-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((448-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((480-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((512-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((544-512))+rcx]
	vpcmpeqq	ymm0,ymm0,ymm1
	vmovdqa	YMMWORD[2336+rsp],ymm0


	lea	rsi,[576+r9]
	lea	rdi,[576+rsp]
	lea	rcx,[2368+rsp]
	call	avx2_sqr_x4
	call	avx2_normalize_n_store


	lea	rsi,[r10]
	lea	rdx,[576+rsp]
	lea	rdi,[rsp]
	call	avx2_mul_x4

	vmovdqa	YMMWORD[rdi],ymm0
	lea	rax,[160+rdi]
	vmovdqa	YMMWORD[32+rdi],ymm1
	vmovdqa	YMMWORD[64+rdi],ymm2
	vmovdqa	YMMWORD[96+rdi],ymm3
	vmovdqa	YMMWORD[(128-160)+rax],ymm4
	vmovdqa	YMMWORD[(160-160)+rax],ymm5
	vmovdqa	YMMWORD[(192-160)+rax],ymm6
	vmovdqa	YMMWORD[(224-160)+rax],ymm7
	vmovdqa	YMMWORD[(256-160)+rax],ymm8



	lea	rsi,[576+r9]
	lea	rdx,[576+rsp]
	lea	rdi,[288+rsp]
	call	avx2_mul_x4
	call	avx2_normalize_n_store


	lea	rsi,[288+r10]
	lea	rdx,[288+rsp]
	lea	rdi,[288+rsp]
	call	avx2_mul_x4
	call	avx2_normalize_n_store


	lea	rsi,[rsp]
	lea	rdx,[r9]
	lea	rdi,[864+rsp]
	call	avx2_sub_x4
	call	avx2_normalize_n_store


	lea	rsi,[288+rsp]
	lea	rdx,[288+r9]
	lea	rdi,[1152+rsp]
	call	avx2_sub_x4
	call	avx2_normalize_n_store


	lea	rsi,[864+rsp]
	lea	rdx,[576+r9]
	lea	rdi,[576+r8]
	call	avx2_mul_x4
	call	avx2_normalize

	lea	rsi,[$L$ONE]
	lea	rdx,[576+r9]
	call	avx2_select_n_store


	lea	rsi,[1152+rsp]
	lea	rdi,[1728+rsp]
	lea	rcx,[2368+rsp]
	call	avx2_sqr_x4
	call	avx2_normalize_n_store


	lea	rsi,[864+rsp]
	lea	rdi,[1440+rsp]
	call	avx2_sqr_x4
	call	avx2_normalize_n_store


	lea	rsi,[864+rsp]
	lea	rdx,[1440+rsp]
	lea	rdi,[2016+rsp]
	call	avx2_mul_x4
	call	avx2_normalize_n_store


	lea	rsi,[r9]
	lea	rdx,[1440+rsp]
	lea	rdi,[rsp]
	call	avx2_mul_x4

	vmovdqa	YMMWORD[rdi],ymm0
	lea	rax,[160+rdi]
	vmovdqa	YMMWORD[32+rdi],ymm1
	vmovdqa	YMMWORD[64+rdi],ymm2
	vmovdqa	YMMWORD[96+rdi],ymm3
	vmovdqa	YMMWORD[(128-160)+rax],ymm4
	vmovdqa	YMMWORD[(160-160)+rax],ymm5
	vmovdqa	YMMWORD[(192-160)+rax],ymm6
	vmovdqa	YMMWORD[(224-160)+rax],ymm7
	vmovdqa	YMMWORD[(256-160)+rax],ymm8







	vpaddq	ymm0,ymm0,ymm0
	lea	rdi,[1440+rsp]
	vpaddq	ymm1,ymm1,ymm1
	vpaddq	ymm2,ymm2,ymm2
	vpaddq	ymm3,ymm3,ymm3
	vpaddq	ymm4,ymm4,ymm4
	vpaddq	ymm5,ymm5,ymm5
	vpaddq	ymm6,ymm6,ymm6
	vpaddq	ymm7,ymm7,ymm7
	vpaddq	ymm8,ymm8,ymm8
	call	avx2_normalize_n_store

















	lea	rsi,[1856+rsp]
	lea	rax,[(($L$AVX2_POLY_x2+128))]
	lea	rdx,[2144+rsp]
	lea	rcx,[1568+rsp]
	lea	rdi,[r8]

	vmovdqa	ymm0,YMMWORD[((0-128))+rsi]
	vmovdqa	ymm1,YMMWORD[((32-128))+rsi]
	vmovdqa	ymm2,YMMWORD[((64-128))+rsi]
	vmovdqa	ymm3,YMMWORD[((96-128))+rsi]
	vmovdqa	ymm4,YMMWORD[((128-128))+rsi]
	vmovdqa	ymm5,YMMWORD[((160-128))+rsi]
	vmovdqa	ymm6,YMMWORD[((192-128))+rsi]
	vmovdqa	ymm7,YMMWORD[((224-128))+rsi]
	vmovdqa	ymm8,YMMWORD[((256-128))+rsi]

	vpaddq	ymm0,ymm0,YMMWORD[((0-128))+rax]
	vpaddq	ymm1,ymm1,YMMWORD[((32-128))+rax]
	vpaddq	ymm2,ymm2,YMMWORD[((64-128))+rax]
	vpaddq	ymm3,ymm3,YMMWORD[((96-128))+rax]
	vpaddq	ymm4,ymm4,YMMWORD[((128-128))+rax]
	vpaddq	ymm5,ymm5,YMMWORD[((160-128))+rax]
	vpaddq	ymm6,ymm6,YMMWORD[((192-128))+rax]
	vpaddq	ymm7,ymm7,YMMWORD[((224-128))+rax]
	vpaddq	ymm8,ymm8,YMMWORD[((256-128))+rax]

	vpsubq	ymm0,ymm0,YMMWORD[((0-128))+rdx]
	vpsubq	ymm1,ymm1,YMMWORD[((32-128))+rdx]
	vpsubq	ymm2,ymm2,YMMWORD[((64-128))+rdx]
	vpsubq	ymm3,ymm3,YMMWORD[((96-128))+rdx]
	vpsubq	ymm4,ymm4,YMMWORD[((128-128))+rdx]
	vpsubq	ymm5,ymm5,YMMWORD[((160-128))+rdx]
	vpsubq	ymm6,ymm6,YMMWORD[((192-128))+rdx]
	vpsubq	ymm7,ymm7,YMMWORD[((224-128))+rdx]
	vpsubq	ymm8,ymm8,YMMWORD[((256-128))+rdx]

	vpsubq	ymm0,ymm0,YMMWORD[((0-128))+rcx]
	vpsubq	ymm1,ymm1,YMMWORD[((32-128))+rcx]
	vpsubq	ymm2,ymm2,YMMWORD[((64-128))+rcx]
	vpsubq	ymm3,ymm3,YMMWORD[((96-128))+rcx]
	vpsubq	ymm4,ymm4,YMMWORD[((128-128))+rcx]
	vpsubq	ymm5,ymm5,YMMWORD[((160-128))+rcx]
	vpsubq	ymm6,ymm6,YMMWORD[((192-128))+rcx]
	vpsubq	ymm7,ymm7,YMMWORD[((224-128))+rcx]
	vpsubq	ymm8,ymm8,YMMWORD[((256-128))+rcx]
	call	avx2_normalize

	lea	rsi,[r10]
	lea	rdx,[r9]
	call	avx2_select_n_store


	lea	rsi,[rsp]
	lea	rdx,[r8]
	lea	rdi,[864+rsp]
	call	avx2_sub_x4
	call	avx2_normalize_n_store


	lea	rsi,[864+rsp]
	lea	rdx,[1152+rsp]
	lea	rdi,[864+rsp]
	call	avx2_mul_x4
	call	avx2_normalize_n_store


	lea	rsi,[2016+rsp]
	lea	rdx,[288+r9]
	lea	rdi,[288+rsp]
	call	avx2_mul_x4
	call	avx2_normalize_n_store


	lea	rsi,[864+rsp]
	lea	rdx,[288+rsp]
	lea	rdi,[288+r8]
	call	avx2_sub_x4
	call	avx2_normalize

	lea	rsi,[288+r10]
	lea	rdx,[288+r9]
	call	avx2_select_n_store







	lea	rsi,[288+r8]
	lea	rdi,[288+r8]
	call	avx2_mul_by1_x4
	call	avx2_normalize_n_store

	vzeroupper
	movaps	XMMWORD[(-160)+rbp],xmm6
	movaps	XMMWORD[(-144)+rbp],xmm7
	movaps	XMMWORD[(-128)+rbp],xmm8
	movaps	XMMWORD[(-112)+rbp],xmm9
	movaps	XMMWORD[(-96)+rbp],xmm10
	movaps	XMMWORD[(-80)+rbp],xmm11
	movaps	XMMWORD[(-64)+rbp],xmm12
	movaps	XMMWORD[(-48)+rbp],xmm13
	movaps	XMMWORD[(-32)+rbp],xmm14
	movaps	XMMWORD[(-16)+rbp],xmm15
	mov	rsp,rbp
	pop	rbp
	mov	rdi,QWORD[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD[16+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_ecp_nistz256_avx2_point_add_affine_x4:



global	ecp_nistz256_avx2_point_add_affines_x4

ALIGN	32
ecp_nistz256_avx2_point_add_affines_x4:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_ecp_nistz256_avx2_point_add_affines_x4:
	mov	rdi,rcx
	mov	rsi,rdx
	mov	rdx,r8


	mov	rax,rsp
	push	rbp
	vzeroupper
	lea	rsp,[((-160))+rsp]
	vmovaps	XMMWORD[(-8-160)+rax],xmm6
	vmovaps	XMMWORD[(-8-144)+rax],xmm7
	vmovaps	XMMWORD[(-8-128)+rax],xmm8
	vmovaps	XMMWORD[(-8-112)+rax],xmm9
	vmovaps	XMMWORD[(-8-96)+rax],xmm10
	vmovaps	XMMWORD[(-8-80)+rax],xmm11
	vmovaps	XMMWORD[(-8-64)+rax],xmm12
	vmovaps	XMMWORD[(-8-48)+rax],xmm13
	vmovaps	XMMWORD[(-8-32)+rax],xmm14
	vmovaps	XMMWORD[(-8-16)+rax],xmm15
	lea	rbp,[((-8))+rax]











	sub	rsp,2624
	and	rsp,-64

	mov	r8,rdi
	mov	r9,rsi
	mov	r10,rdx

	vmovdqa	ymm0,YMMWORD[rsi]
	vmovdqa	ymm12,YMMWORD[$L$AVX2_AND_MASK]
	vpxor	ymm1,ymm1,ymm1
	lea	rax,[256+rsi]
	vpor	ymm0,ymm0,YMMWORD[32+rsi]
	vpor	ymm0,ymm0,YMMWORD[64+rsi]
	vpor	ymm0,ymm0,YMMWORD[96+rsi]
	vpor	ymm0,ymm0,YMMWORD[((128-256))+rax]
	lea	rcx,[256+rax]
	vpor	ymm0,ymm0,YMMWORD[((160-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((192-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((224-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((256-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((288-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((320-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((352-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((384-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((416-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((448-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((480-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((512-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((544-512))+rcx]
	vpcmpeqq	ymm0,ymm0,ymm1
	vmovdqa	YMMWORD[2304+rsp],ymm0

	vpxor	ymm1,ymm1,ymm1
	vmovdqa	ymm0,YMMWORD[r10]
	lea	rax,[256+r10]
	vpor	ymm0,ymm0,YMMWORD[32+r10]
	vpor	ymm0,ymm0,YMMWORD[64+r10]
	vpor	ymm0,ymm0,YMMWORD[96+r10]
	vpor	ymm0,ymm0,YMMWORD[((128-256))+rax]
	lea	rcx,[256+rax]
	vpor	ymm0,ymm0,YMMWORD[((160-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((192-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((224-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((256-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((288-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((320-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((352-256))+rax]
	vpor	ymm0,ymm0,YMMWORD[((384-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((416-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((448-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((480-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((512-512))+rcx]
	vpor	ymm0,ymm0,YMMWORD[((544-512))+rcx]
	vpcmpeqq	ymm0,ymm0,ymm1
	vmovdqa	YMMWORD[2336+rsp],ymm0


	lea	rsi,[r10]
	lea	rdx,[r9]
	lea	rdi,[864+rsp]
	call	avx2_sub_x4
	call	avx2_normalize_n_store


	lea	rsi,[288+r10]
	lea	rdx,[288+r9]
	lea	rdi,[1152+rsp]
	call	avx2_sub_x4
	call	avx2_normalize_n_store


	lea	rsi,[864+rsp]
	lea	rdi,[576+r8]
	call	avx2_mul_by1_x4
	call	avx2_normalize

	vmovdqa	ymm9,YMMWORD[2304+rsp]
	vpor	ymm9,ymm9,YMMWORD[2336+rsp]

	vpandn	ymm0,ymm9,ymm0
	lea	rax,[(($L$ONE+128))]
	vpandn	ymm1,ymm9,ymm1
	vpandn	ymm2,ymm9,ymm2
	vpandn	ymm3,ymm9,ymm3
	vpandn	ymm4,ymm9,ymm4
	vpandn	ymm5,ymm9,ymm5
	vpandn	ymm6,ymm9,ymm6
	vpandn	ymm7,ymm9,ymm7

	vpand	ymm11,ymm9,YMMWORD[((0-128))+rax]
	vpandn	ymm8,ymm9,ymm8
	vpand	ymm10,ymm9,YMMWORD[((32-128))+rax]
	vpxor	ymm0,ymm0,ymm11
	vpand	ymm11,ymm9,YMMWORD[((64-128))+rax]
	vpxor	ymm1,ymm1,ymm10
	vpand	ymm10,ymm9,YMMWORD[((96-128))+rax]
	vpxor	ymm2,ymm2,ymm11
	vpand	ymm11,ymm9,YMMWORD[((128-128))+rax]
	vpxor	ymm3,ymm3,ymm10
	vpand	ymm10,ymm9,YMMWORD[((160-128))+rax]
	vpxor	ymm4,ymm4,ymm11
	vpand	ymm11,ymm9,YMMWORD[((192-128))+rax]
	vpxor	ymm5,ymm5,ymm10
	vpand	ymm10,ymm9,YMMWORD[((224-128))+rax]
	vpxor	ymm6,ymm6,ymm11
	vpand	ymm11,ymm9,YMMWORD[((256-128))+rax]
	vpxor	ymm7,ymm7,ymm10
	vpxor	ymm8,ymm8,ymm11
	vmovdqa	YMMWORD[rdi],ymm0
	lea	rax,[160+rdi]
	vmovdqa	YMMWORD[32+rdi],ymm1
	vmovdqa	YMMWORD[64+rdi],ymm2
	vmovdqa	YMMWORD[96+rdi],ymm3
	vmovdqa	YMMWORD[(128-160)+rax],ymm4
	vmovdqa	YMMWORD[(160-160)+rax],ymm5
	vmovdqa	YMMWORD[(192-160)+rax],ymm6
	vmovdqa	YMMWORD[(224-160)+rax],ymm7
	vmovdqa	YMMWORD[(256-160)+rax],ymm8



	lea	rsi,[1152+rsp]
	lea	rdi,[1728+rsp]
	lea	rcx,[2368+rsp]
	call	avx2_sqr_x4
	call	avx2_normalize_n_store


	lea	rsi,[864+rsp]
	lea	rdi,[1440+rsp]
	call	avx2_sqr_x4
	call	avx2_normalize_n_store


	lea	rsi,[864+rsp]
	lea	rdx,[1440+rsp]
	lea	rdi,[2016+rsp]
	call	avx2_mul_x4
	call	avx2_normalize_n_store


	lea	rsi,[r9]
	lea	rdx,[1440+rsp]
	lea	rdi,[rsp]
	call	avx2_mul_x4

	vmovdqa	YMMWORD[rdi],ymm0
	lea	rax,[160+rdi]
	vmovdqa	YMMWORD[32+rdi],ymm1
	vmovdqa	YMMWORD[64+rdi],ymm2
	vmovdqa	YMMWORD[96+rdi],ymm3
	vmovdqa	YMMWORD[(128-160)+rax],ymm4
	vmovdqa	YMMWORD[(160-160)+rax],ymm5
	vmovdqa	YMMWORD[(192-160)+rax],ymm6
	vmovdqa	YMMWORD[(224-160)+rax],ymm7
	vmovdqa	YMMWORD[(256-160)+rax],ymm8







	vpaddq	ymm0,ymm0,ymm0
	lea	rdi,[1440+rsp]
	vpaddq	ymm1,ymm1,ymm1
	vpaddq	ymm2,ymm2,ymm2
	vpaddq	ymm3,ymm3,ymm3
	vpaddq	ymm4,ymm4,ymm4
	vpaddq	ymm5,ymm5,ymm5
	vpaddq	ymm6,ymm6,ymm6
	vpaddq	ymm7,ymm7,ymm7
	vpaddq	ymm8,ymm8,ymm8
	call	avx2_normalize_n_store

















	lea	rsi,[1856+rsp]
	lea	rax,[(($L$AVX2_POLY_x2+128))]
	lea	rdx,[2144+rsp]
	lea	rcx,[1568+rsp]
	lea	rdi,[r8]

	vmovdqa	ymm0,YMMWORD[((0-128))+rsi]
	vmovdqa	ymm1,YMMWORD[((32-128))+rsi]
	vmovdqa	ymm2,YMMWORD[((64-128))+rsi]
	vmovdqa	ymm3,YMMWORD[((96-128))+rsi]
	vmovdqa	ymm4,YMMWORD[((128-128))+rsi]
	vmovdqa	ymm5,YMMWORD[((160-128))+rsi]
	vmovdqa	ymm6,YMMWORD[((192-128))+rsi]
	vmovdqa	ymm7,YMMWORD[((224-128))+rsi]
	vmovdqa	ymm8,YMMWORD[((256-128))+rsi]

	vpaddq	ymm0,ymm0,YMMWORD[((0-128))+rax]
	vpaddq	ymm1,ymm1,YMMWORD[((32-128))+rax]
	vpaddq	ymm2,ymm2,YMMWORD[((64-128))+rax]
	vpaddq	ymm3,ymm3,YMMWORD[((96-128))+rax]
	vpaddq	ymm4,ymm4,YMMWORD[((128-128))+rax]
	vpaddq	ymm5,ymm5,YMMWORD[((160-128))+rax]
	vpaddq	ymm6,ymm6,YMMWORD[((192-128))+rax]
	vpaddq	ymm7,ymm7,YMMWORD[((224-128))+rax]
	vpaddq	ymm8,ymm8,YMMWORD[((256-128))+rax]

	vpsubq	ymm0,ymm0,YMMWORD[((0-128))+rdx]
	vpsubq	ymm1,ymm1,YMMWORD[((32-128))+rdx]
	vpsubq	ymm2,ymm2,YMMWORD[((64-128))+rdx]
	vpsubq	ymm3,ymm3,YMMWORD[((96-128))+rdx]
	vpsubq	ymm4,ymm4,YMMWORD[((128-128))+rdx]
	vpsubq	ymm5,ymm5,YMMWORD[((160-128))+rdx]
	vpsubq	ymm6,ymm6,YMMWORD[((192-128))+rdx]
	vpsubq	ymm7,ymm7,YMMWORD[((224-128))+rdx]
	vpsubq	ymm8,ymm8,YMMWORD[((256-128))+rdx]

	vpsubq	ymm0,ymm0,YMMWORD[((0-128))+rcx]
	vpsubq	ymm1,ymm1,YMMWORD[((32-128))+rcx]
	vpsubq	ymm2,ymm2,YMMWORD[((64-128))+rcx]
	vpsubq	ymm3,ymm3,YMMWORD[((96-128))+rcx]
	vpsubq	ymm4,ymm4,YMMWORD[((128-128))+rcx]
	vpsubq	ymm5,ymm5,YMMWORD[((160-128))+rcx]
	vpsubq	ymm6,ymm6,YMMWORD[((192-128))+rcx]
	vpsubq	ymm7,ymm7,YMMWORD[((224-128))+rcx]
	vpsubq	ymm8,ymm8,YMMWORD[((256-128))+rcx]
	call	avx2_normalize

	lea	rsi,[r10]
	lea	rdx,[r9]
	call	avx2_select_n_store


	lea	rsi,[rsp]
	lea	rdx,[r8]
	lea	rdi,[864+rsp]
	call	avx2_sub_x4
	call	avx2_normalize_n_store


	lea	rsi,[864+rsp]
	lea	rdx,[1152+rsp]
	lea	rdi,[864+rsp]
	call	avx2_mul_x4
	call	avx2_normalize_n_store


	lea	rsi,[2016+rsp]
	lea	rdx,[288+r9]
	lea	rdi,[288+rsp]
	call	avx2_mul_x4
	call	avx2_normalize_n_store


	lea	rsi,[864+rsp]
	lea	rdx,[288+rsp]
	lea	rdi,[288+r8]
	call	avx2_sub_x4
	call	avx2_normalize

	lea	rsi,[288+r10]
	lea	rdx,[288+r9]
	call	avx2_select_n_store







	lea	rsi,[288+r8]
	lea	rdi,[288+r8]
	call	avx2_mul_by1_x4
	call	avx2_normalize_n_store

	vzeroupper
	movaps	XMMWORD[(-160)+rbp],xmm6
	movaps	XMMWORD[(-144)+rbp],xmm7
	movaps	XMMWORD[(-128)+rbp],xmm8
	movaps	XMMWORD[(-112)+rbp],xmm9
	movaps	XMMWORD[(-96)+rbp],xmm10
	movaps	XMMWORD[(-80)+rbp],xmm11
	movaps	XMMWORD[(-64)+rbp],xmm12
	movaps	XMMWORD[(-48)+rbp],xmm13
	movaps	XMMWORD[(-32)+rbp],xmm14
	movaps	XMMWORD[(-16)+rbp],xmm15
	mov	rsp,rbp
	pop	rbp
	mov	rdi,QWORD[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD[16+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_ecp_nistz256_avx2_point_add_affines_x4:



global	ecp_nistz256_avx2_to_mont

ALIGN	32
ecp_nistz256_avx2_to_mont:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_ecp_nistz256_avx2_to_mont:
	mov	rdi,rcx
	mov	rsi,rdx


	vzeroupper
	lea	rsp,[((-8-160))+rsp]
	vmovaps	XMMWORD[(-8-160)+rax],xmm6
	vmovaps	XMMWORD[(-8-144)+rax],xmm7
	vmovaps	XMMWORD[(-8-128)+rax],xmm8
	vmovaps	XMMWORD[(-8-112)+rax],xmm9
	vmovaps	XMMWORD[(-8-96)+rax],xmm10
	vmovaps	XMMWORD[(-8-80)+rax],xmm11
	vmovaps	XMMWORD[(-8-64)+rax],xmm12
	vmovaps	XMMWORD[(-8-48)+rax],xmm13
	vmovaps	XMMWORD[(-8-32)+rax],xmm14
	vmovaps	XMMWORD[(-8-16)+rax],xmm15
	vmovdqa	ymm12,YMMWORD[$L$AVX2_AND_MASK]
	lea	rdx,[$L$TO_MONT_AVX2]
	call	avx2_mul_x4
	call	avx2_normalize_n_store

	vzeroupper
	movaps	xmm6,XMMWORD[rsp]
	movaps	xmm7,XMMWORD[16+rsp]
	movaps	xmm8,XMMWORD[32+rsp]
	movaps	xmm9,XMMWORD[48+rsp]
	movaps	xmm10,XMMWORD[64+rsp]
	movaps	xmm11,XMMWORD[80+rsp]
	movaps	xmm12,XMMWORD[96+rsp]
	movaps	xmm13,XMMWORD[112+rsp]
	movaps	xmm14,XMMWORD[128+rsp]
	movaps	xmm15,XMMWORD[144+rsp]
	lea	rsp,[((8+160))+rsp]
	mov	rdi,QWORD[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD[16+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_ecp_nistz256_avx2_to_mont:



global	ecp_nistz256_avx2_from_mont

ALIGN	32
ecp_nistz256_avx2_from_mont:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_ecp_nistz256_avx2_from_mont:
	mov	rdi,rcx
	mov	rsi,rdx


	vzeroupper
	lea	rsp,[((-8-160))+rsp]
	vmovaps	XMMWORD[(-8-160)+rax],xmm6
	vmovaps	XMMWORD[(-8-144)+rax],xmm7
	vmovaps	XMMWORD[(-8-128)+rax],xmm8
	vmovaps	XMMWORD[(-8-112)+rax],xmm9
	vmovaps	XMMWORD[(-8-96)+rax],xmm10
	vmovaps	XMMWORD[(-8-80)+rax],xmm11
	vmovaps	XMMWORD[(-8-64)+rax],xmm12
	vmovaps	XMMWORD[(-8-48)+rax],xmm13
	vmovaps	XMMWORD[(-8-32)+rax],xmm14
	vmovaps	XMMWORD[(-8-16)+rax],xmm15
	vmovdqa	ymm12,YMMWORD[$L$AVX2_AND_MASK]
	lea	rdx,[$L$FROM_MONT_AVX2]
	call	avx2_mul_x4
	call	avx2_normalize_n_store

	vzeroupper
	movaps	xmm6,XMMWORD[rsp]
	movaps	xmm7,XMMWORD[16+rsp]
	movaps	xmm8,XMMWORD[32+rsp]
	movaps	xmm9,XMMWORD[48+rsp]
	movaps	xmm10,XMMWORD[64+rsp]
	movaps	xmm11,XMMWORD[80+rsp]
	movaps	xmm12,XMMWORD[96+rsp]
	movaps	xmm13,XMMWORD[112+rsp]
	movaps	xmm14,XMMWORD[128+rsp]
	movaps	xmm15,XMMWORD[144+rsp]
	lea	rsp,[((8+160))+rsp]
	mov	rdi,QWORD[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD[16+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_ecp_nistz256_avx2_from_mont:



global	ecp_nistz256_avx2_set1

ALIGN	32
ecp_nistz256_avx2_set1:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_ecp_nistz256_avx2_set1:
	mov	rdi,rcx


	lea	rax,[(($L$ONE+128))]
	lea	rdi,[128+rdi]
	vzeroupper
	vmovdqa	ymm0,YMMWORD[((0-128))+rax]
	vmovdqa	ymm1,YMMWORD[((32-128))+rax]
	vmovdqa	ymm2,YMMWORD[((64-128))+rax]
	vmovdqa	ymm3,YMMWORD[((96-128))+rax]
	vmovdqa	ymm4,YMMWORD[((128-128))+rax]
	vmovdqa	ymm5,YMMWORD[((160-128))+rax]
	vmovdqa	YMMWORD[(0-128)+rdi],ymm0
	vmovdqa	ymm0,YMMWORD[((192-128))+rax]
	vmovdqa	YMMWORD[(32-128)+rdi],ymm1
	vmovdqa	ymm1,YMMWORD[((224-128))+rax]
	vmovdqa	YMMWORD[(64-128)+rdi],ymm2
	vmovdqa	ymm2,YMMWORD[((256-128))+rax]
	vmovdqa	YMMWORD[(96-128)+rdi],ymm3
	vmovdqa	YMMWORD[(128-128)+rdi],ymm4
	vmovdqa	YMMWORD[(160-128)+rdi],ymm5
	vmovdqa	YMMWORD[(192-128)+rdi],ymm0
	vmovdqa	YMMWORD[(224-128)+rdi],ymm1
	vmovdqa	YMMWORD[(256-128)+rdi],ymm2

	vzeroupper
	mov	rdi,QWORD[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD[16+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_ecp_nistz256_avx2_set1:
global	ecp_nistz256_avx2_multi_gather_w7

ALIGN	32
ecp_nistz256_avx2_multi_gather_w7:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_ecp_nistz256_avx2_multi_gather_w7:
	mov	rdi,rcx
	mov	rsi,rdx
	mov	rdx,r8
	mov	rcx,r9
	mov	r8,QWORD[40+rsp]
	mov	r9,QWORD[48+rsp]


	vzeroupper
	lea	rsp,[((-8-160))+rsp]
	vmovaps	XMMWORD[(-8-160)+rax],xmm6
	vmovaps	XMMWORD[(-8-144)+rax],xmm7
	vmovaps	XMMWORD[(-8-128)+rax],xmm8
	vmovaps	XMMWORD[(-8-112)+rax],xmm9
	vmovaps	XMMWORD[(-8-96)+rax],xmm10
	vmovaps	XMMWORD[(-8-80)+rax],xmm11
	vmovaps	XMMWORD[(-8-64)+rax],xmm12
	vmovaps	XMMWORD[(-8-48)+rax],xmm13
	vmovaps	XMMWORD[(-8-32)+rax],xmm14
	vmovaps	XMMWORD[(-8-16)+rax],xmm15
	lea	rax,[$L$IntOne]

	vmovd	xmm0,edx
	vmovd	xmm1,ecx
	vmovd	xmm2,r8d
	vmovd	xmm3,r9d

	vpxor	ymm4,ymm4,ymm4
	vpxor	ymm5,ymm5,ymm5
	vpxor	ymm6,ymm6,ymm6
	vpxor	ymm7,ymm7,ymm7
	vpxor	ymm8,ymm8,ymm8
	vpxor	ymm9,ymm9,ymm9
	vpxor	ymm10,ymm10,ymm10
	vpxor	ymm11,ymm11,ymm11
	vmovdqa	ymm12,YMMWORD[rax]

	vpermd	ymm0,ymm4,ymm0
	vpermd	ymm1,ymm4,ymm1
	vpermd	ymm2,ymm4,ymm2
	vpermd	ymm3,ymm4,ymm3

	mov	ecx,64
	lea	rdi,[112+rdi]
	jmp	NEAR $L$multi_select_loop_avx2


ALIGN	32
$L$multi_select_loop_avx2:
	vpcmpeqd	ymm15,ymm12,ymm0

	vmovdqa	ymm13,YMMWORD[rsi]
	vmovdqa	ymm14,YMMWORD[32+rsi]
	vpand	ymm13,ymm13,ymm15
	vpand	ymm14,ymm14,ymm15
	vpxor	ymm4,ymm4,ymm13
	vpxor	ymm5,ymm5,ymm14

	vpcmpeqd	ymm15,ymm12,ymm1

	vmovdqa	ymm13,YMMWORD[4096+rsi]
	vmovdqa	ymm14,YMMWORD[4128+rsi]
	vpand	ymm13,ymm13,ymm15
	vpand	ymm14,ymm14,ymm15
	vpxor	ymm6,ymm6,ymm13
	vpxor	ymm7,ymm7,ymm14

	vpcmpeqd	ymm15,ymm12,ymm2

	vmovdqa	ymm13,YMMWORD[8192+rsi]
	vmovdqa	ymm14,YMMWORD[8224+rsi]
	vpand	ymm13,ymm13,ymm15
	vpand	ymm14,ymm14,ymm15
	vpxor	ymm8,ymm8,ymm13
	vpxor	ymm9,ymm9,ymm14

	vpcmpeqd	ymm15,ymm12,ymm3

	vmovdqa	ymm13,YMMWORD[12288+rsi]
	vmovdqa	ymm14,YMMWORD[12320+rsi]
	vpand	ymm13,ymm13,ymm15
	vpand	ymm14,ymm14,ymm15
	vpxor	ymm10,ymm10,ymm13
	vpxor	ymm11,ymm11,ymm14

	vpaddd	ymm12,ymm12,YMMWORD[rax]
	lea	rsi,[64+rsi]

	dec	ecx
	jnz	NEAR $L$multi_select_loop_avx2

	vmovdqu	YMMWORD[(0-112)+rdi],ymm4
	vmovdqu	YMMWORD[(32-112)+rdi],ymm5
	vmovdqu	YMMWORD[(64-112)+rdi],ymm6
	vmovdqu	YMMWORD[(96-112)+rdi],ymm7
	vmovdqu	YMMWORD[(128-112)+rdi],ymm8
	vmovdqu	YMMWORD[(160-112)+rdi],ymm9
	vmovdqu	YMMWORD[(192-112)+rdi],ymm10
	vmovdqu	YMMWORD[(224-112)+rdi],ymm11

	vzeroupper
	movaps	xmm6,XMMWORD[rsp]
	movaps	xmm7,XMMWORD[16+rsp]
	movaps	xmm8,XMMWORD[32+rsp]
	movaps	xmm9,XMMWORD[48+rsp]
	movaps	xmm10,XMMWORD[64+rsp]
	movaps	xmm11,XMMWORD[80+rsp]
	movaps	xmm12,XMMWORD[96+rsp]
	movaps	xmm13,XMMWORD[112+rsp]
	movaps	xmm14,XMMWORD[128+rsp]
	movaps	xmm15,XMMWORD[144+rsp]
	lea	rsp,[((8+160))+rsp]
	mov	rdi,QWORD[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD[16+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_ecp_nistz256_avx2_multi_gather_w7:

EXTERN	OPENSSL_ia32cap_P
global	ecp_nistz_avx2_eligible

ALIGN	32
ecp_nistz_avx2_eligible:
	mov	eax,DWORD[((OPENSSL_ia32cap_P+8))]
	shr	eax,5
	and	eax,1
	DB	0F3h,0C3h		;repret

