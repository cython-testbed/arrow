//+build !noasm !appengine
// AUTO-GENERATED BY C2GOASM -- DO NOT EDIT

TEXT ·_sum_int64_avx2(SB), $0-24

	MOVQ buf+0(FP), DI
	MOVQ len+8(FP), SI
	MOVQ res+16(FP), DX

	WORD $0x8548; BYTE $0xf6 // test    rsi, rsi
	JE   LBB0_1
	LONG $0x1ffe8348         // cmp    rsi, 31
	JBE  LBB0_3
	WORD $0x8949; BYTE $0xf1 // mov    r9, rsi
	LONG $0xe0e18349         // and    r9, -32
	JE   LBB0_3
	LONG $0xe0418d4d         // lea    r8, [r9 - 32]
	WORD $0x8944; BYTE $0xc0 // mov    eax, r8d
	WORD $0xe8c1; BYTE $0x05 // shr    eax, 5
	WORD $0xc0ff             // inc    eax
	LONG $0x07e08348         // and    rax, 7
	JE   LBB0_8
	WORD $0xf748; BYTE $0xd8 // neg    rax
	LONG $0xc0effdc5         // vpxor    ymm0, ymm0, ymm0
	WORD $0xc931             // xor    ecx, ecx
	LONG $0xc9eff5c5         // vpxor    ymm1, ymm1, ymm1
	LONG $0xd2efedc5         // vpxor    ymm2, ymm2, ymm2
	LONG $0xdbefe5c5         // vpxor    ymm3, ymm3, ymm3
	LONG $0xe4efddc5         // vpxor    ymm4, ymm4, ymm4
	LONG $0xedefd5c5         // vpxor    ymm5, ymm5, ymm5
	LONG $0xf6efcdc5         // vpxor    ymm6, ymm6, ymm6
	LONG $0xffefc5c5         // vpxor    ymm7, ymm7, ymm7

LBB0_10:
	LONG $0x04d4fdc5; BYTE $0xcf         // vpaddq    ymm0, ymm0, yword [rdi + 8*rcx]
	LONG $0x4cd4f5c5; WORD $0x20cf       // vpaddq    ymm1, ymm1, yword [rdi + 8*rcx + 32]
	LONG $0x54d4edc5; WORD $0x40cf       // vpaddq    ymm2, ymm2, yword [rdi + 8*rcx + 64]
	LONG $0x5cd4e5c5; WORD $0x60cf       // vpaddq    ymm3, ymm3, yword [rdi + 8*rcx + 96]
	QUAD $0x000080cfa4d4ddc5; BYTE $0x00 // vpaddq    ymm4, ymm4, yword [rdi + 8*rcx + 128]
	QUAD $0x0000a0cfacd4d5c5; BYTE $0x00 // vpaddq    ymm5, ymm5, yword [rdi + 8*rcx + 160]
	QUAD $0x0000c0cfb4d4cdc5; BYTE $0x00 // vpaddq    ymm6, ymm6, yword [rdi + 8*rcx + 192]
	QUAD $0x0000e0cfbcd4c5c5; BYTE $0x00 // vpaddq    ymm7, ymm7, yword [rdi + 8*rcx + 224]
	LONG $0x20c18348                     // add    rcx, 32
	WORD $0xff48; BYTE $0xc0             // inc    rax
	JNE  LBB0_10
	JMP  LBB0_11

LBB0_3:
	WORD $0x3145; BYTE $0xc9 // xor    r9d, r9d
	WORD $0xc031             // xor    eax, eax

LBB0_4:
	LONG $0xcf0c8d4a         // lea    rcx, [rdi + 8*r9]
	WORD $0x294c; BYTE $0xce // sub    rsi, r9

LBB0_5:
	WORD $0x0348; BYTE $0x01 // add    rax, qword [rcx]
	LONG $0x08c18348         // add    rcx, 8
	WORD $0xff48; BYTE $0xce // dec    rsi
	JNE  LBB0_5
	JMP  LBB0_15

LBB0_1:
	WORD $0xc031 // xor    eax, eax

LBB0_15:
	WORD $0x8948; BYTE $0x02 // mov    qword [rdx], rax
	VZEROUPPER
	RET

LBB0_8:
	WORD $0xc931     // xor    ecx, ecx
	LONG $0xc0effdc5 // vpxor    ymm0, ymm0, ymm0
	LONG $0xc9eff5c5 // vpxor    ymm1, ymm1, ymm1
	LONG $0xd2efedc5 // vpxor    ymm2, ymm2, ymm2
	LONG $0xdbefe5c5 // vpxor    ymm3, ymm3, ymm3
	LONG $0xe4efddc5 // vpxor    ymm4, ymm4, ymm4
	LONG $0xedefd5c5 // vpxor    ymm5, ymm5, ymm5
	LONG $0xf6efcdc5 // vpxor    ymm6, ymm6, ymm6
	LONG $0xffefc5c5 // vpxor    ymm7, ymm7, ymm7

LBB0_11:
	LONG $0xe0f88149; WORD $0x0000; BYTE $0x00 // cmp    r8, 224
	JB   LBB0_14
	WORD $0x894c; BYTE $0xc8                   // mov    rax, r9
	WORD $0x2948; BYTE $0xc8                   // sub    rax, rcx
	QUAD $0x00000700cf8c8d48                   // lea    rcx, [rdi + 8*rcx + 1792]

LBB0_13:
	QUAD $0xfffff9e0b9d4c5c5                   // vpaddq    ymm7, ymm7, yword [rcx - 1568]
	QUAD $0xfffff9c0b1d4cdc5                   // vpaddq    ymm6, ymm6, yword [rcx - 1600]
	QUAD $0xfffff9a0a9d4d5c5                   // vpaddq    ymm5, ymm5, yword [rcx - 1632]
	QUAD $0xfffff980a1d4ddc5                   // vpaddq    ymm4, ymm4, yword [rcx - 1664]
	QUAD $0xfffff96099d4e5c5                   // vpaddq    ymm3, ymm3, yword [rcx - 1696]
	QUAD $0xfffff94091d4edc5                   // vpaddq    ymm2, ymm2, yword [rcx - 1728]
	QUAD $0xfffff92089d4f5c5                   // vpaddq    ymm1, ymm1, yword [rcx - 1760]
	QUAD $0xfffff90081d4fdc5                   // vpaddq    ymm0, ymm0, yword [rcx - 1792]
	QUAD $0xfffffa0081d4fdc5                   // vpaddq    ymm0, ymm0, yword [rcx - 1536]
	QUAD $0xfffffa2089d4f5c5                   // vpaddq    ymm1, ymm1, yword [rcx - 1504]
	QUAD $0xfffffa4091d4edc5                   // vpaddq    ymm2, ymm2, yword [rcx - 1472]
	QUAD $0xfffffa6099d4e5c5                   // vpaddq    ymm3, ymm3, yword [rcx - 1440]
	QUAD $0xfffffa80a1d4ddc5                   // vpaddq    ymm4, ymm4, yword [rcx - 1408]
	QUAD $0xfffffaa0a9d4d5c5                   // vpaddq    ymm5, ymm5, yword [rcx - 1376]
	QUAD $0xfffffac0b1d4cdc5                   // vpaddq    ymm6, ymm6, yword [rcx - 1344]
	QUAD $0xfffffae0b9d4c5c5                   // vpaddq    ymm7, ymm7, yword [rcx - 1312]
	QUAD $0xfffffbe0b9d4c5c5                   // vpaddq    ymm7, ymm7, yword [rcx - 1056]
	QUAD $0xfffffbc0b1d4cdc5                   // vpaddq    ymm6, ymm6, yword [rcx - 1088]
	QUAD $0xfffffba0a9d4d5c5                   // vpaddq    ymm5, ymm5, yword [rcx - 1120]
	QUAD $0xfffffb80a1d4ddc5                   // vpaddq    ymm4, ymm4, yword [rcx - 1152]
	QUAD $0xfffffb6099d4e5c5                   // vpaddq    ymm3, ymm3, yword [rcx - 1184]
	QUAD $0xfffffb4091d4edc5                   // vpaddq    ymm2, ymm2, yword [rcx - 1216]
	QUAD $0xfffffb2089d4f5c5                   // vpaddq    ymm1, ymm1, yword [rcx - 1248]
	QUAD $0xfffffb0081d4fdc5                   // vpaddq    ymm0, ymm0, yword [rcx - 1280]
	QUAD $0xfffffc0081d4fdc5                   // vpaddq    ymm0, ymm0, yword [rcx - 1024]
	QUAD $0xfffffc2089d4f5c5                   // vpaddq    ymm1, ymm1, yword [rcx - 992]
	QUAD $0xfffffc4091d4edc5                   // vpaddq    ymm2, ymm2, yword [rcx - 960]
	QUAD $0xfffffc6099d4e5c5                   // vpaddq    ymm3, ymm3, yword [rcx - 928]
	QUAD $0xfffffc80a1d4ddc5                   // vpaddq    ymm4, ymm4, yword [rcx - 896]
	QUAD $0xfffffca0a9d4d5c5                   // vpaddq    ymm5, ymm5, yword [rcx - 864]
	QUAD $0xfffffcc0b1d4cdc5                   // vpaddq    ymm6, ymm6, yword [rcx - 832]
	QUAD $0xfffffce0b9d4c5c5                   // vpaddq    ymm7, ymm7, yword [rcx - 800]
	QUAD $0xfffffde0b9d4c5c5                   // vpaddq    ymm7, ymm7, yword [rcx - 544]
	QUAD $0xfffffdc0b1d4cdc5                   // vpaddq    ymm6, ymm6, yword [rcx - 576]
	QUAD $0xfffffda0a9d4d5c5                   // vpaddq    ymm5, ymm5, yword [rcx - 608]
	QUAD $0xfffffd80a1d4ddc5                   // vpaddq    ymm4, ymm4, yword [rcx - 640]
	QUAD $0xfffffd6099d4e5c5                   // vpaddq    ymm3, ymm3, yword [rcx - 672]
	QUAD $0xfffffd4091d4edc5                   // vpaddq    ymm2, ymm2, yword [rcx - 704]
	QUAD $0xfffffd2089d4f5c5                   // vpaddq    ymm1, ymm1, yword [rcx - 736]
	QUAD $0xfffffd0081d4fdc5                   // vpaddq    ymm0, ymm0, yword [rcx - 768]
	QUAD $0xfffffe0081d4fdc5                   // vpaddq    ymm0, ymm0, yword [rcx - 512]
	QUAD $0xfffffe2089d4f5c5                   // vpaddq    ymm1, ymm1, yword [rcx - 480]
	QUAD $0xfffffe4091d4edc5                   // vpaddq    ymm2, ymm2, yword [rcx - 448]
	QUAD $0xfffffe6099d4e5c5                   // vpaddq    ymm3, ymm3, yword [rcx - 416]
	QUAD $0xfffffe80a1d4ddc5                   // vpaddq    ymm4, ymm4, yword [rcx - 384]
	QUAD $0xfffffea0a9d4d5c5                   // vpaddq    ymm5, ymm5, yword [rcx - 352]
	QUAD $0xfffffec0b1d4cdc5                   // vpaddq    ymm6, ymm6, yword [rcx - 320]
	QUAD $0xfffffee0b9d4c5c5                   // vpaddq    ymm7, ymm7, yword [rcx - 288]
	LONG $0x79d4c5c5; BYTE $0xe0               // vpaddq    ymm7, ymm7, yword [rcx - 32]
	LONG $0x71d4cdc5; BYTE $0xc0               // vpaddq    ymm6, ymm6, yword [rcx - 64]
	LONG $0x69d4d5c5; BYTE $0xa0               // vpaddq    ymm5, ymm5, yword [rcx - 96]
	LONG $0x61d4ddc5; BYTE $0x80               // vpaddq    ymm4, ymm4, yword [rcx - 128]
	QUAD $0xffffff6099d4e5c5                   // vpaddq    ymm3, ymm3, yword [rcx - 160]
	QUAD $0xffffff4091d4edc5                   // vpaddq    ymm2, ymm2, yword [rcx - 192]
	QUAD $0xffffff2089d4f5c5                   // vpaddq    ymm1, ymm1, yword [rcx - 224]
	QUAD $0xffffff0081d4fdc5                   // vpaddq    ymm0, ymm0, yword [rcx - 256]
	LONG $0x01d4fdc5                           // vpaddq    ymm0, ymm0, yword [rcx]
	LONG $0x49d4f5c5; BYTE $0x20               // vpaddq    ymm1, ymm1, yword [rcx + 32]
	LONG $0x51d4edc5; BYTE $0x40               // vpaddq    ymm2, ymm2, yword [rcx + 64]
	LONG $0x59d4e5c5; BYTE $0x60               // vpaddq    ymm3, ymm3, yword [rcx + 96]
	QUAD $0x00000080a1d4ddc5                   // vpaddq    ymm4, ymm4, yword [rcx + 128]
	QUAD $0x000000a0a9d4d5c5                   // vpaddq    ymm5, ymm5, yword [rcx + 160]
	QUAD $0x000000c0b1d4cdc5                   // vpaddq    ymm6, ymm6, yword [rcx + 192]
	QUAD $0x000000e0b9d4c5c5                   // vpaddq    ymm7, ymm7, yword [rcx + 224]
	LONG $0x00c18148; WORD $0x0008; BYTE $0x00 // add    rcx, 2048
	LONG $0xff000548; WORD $0xffff             // add    rax, -256
	JNE  LBB0_13

LBB0_14:
	LONG $0xcdd4f5c5               // vpaddq    ymm1, ymm1, ymm5
	LONG $0xdfd4e5c5               // vpaddq    ymm3, ymm3, ymm7
	LONG $0xc4d4fdc5               // vpaddq    ymm0, ymm0, ymm4
	LONG $0xd6d4edc5               // vpaddq    ymm2, ymm2, ymm6
	LONG $0xc2d4fdc5               // vpaddq    ymm0, ymm0, ymm2
	LONG $0xcbd4f5c5               // vpaddq    ymm1, ymm1, ymm3
	LONG $0xc1d4fdc5               // vpaddq    ymm0, ymm0, ymm1
	LONG $0x397de3c4; WORD $0x01c1 // vextracti128    xmm1, ymm0, 1
	LONG $0xc1d4fdc5               // vpaddq    ymm0, ymm0, ymm1
	LONG $0xc870f9c5; BYTE $0x4e   // vpshufd    xmm1, xmm0, 78
	LONG $0xc1d4fdc5               // vpaddq    ymm0, ymm0, ymm1
	LONG $0x7ef9e1c4; BYTE $0xc0   // vmovq    rax, xmm0
	WORD $0x3949; BYTE $0xf1       // cmp    r9, rsi
	JNE  LBB0_4
	JMP  LBB0_15
