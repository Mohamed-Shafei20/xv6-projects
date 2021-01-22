
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc a0 bf 10 80       	mov    $0x8010bfa0,%esp
8010002d:	b8 30 2f 10 80       	mov    $0x80102f30,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb d4 bf 10 80       	mov    $0x8010bfd4,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 00 75 10 80       	push   $0x80107500
80100051:	68 a0 bf 10 80       	push   $0x8010bfa0
80100056:	e8 d5 43 00 00       	call   80104430 <initlock>
8010005b:	c7 05 ec 06 11 80 9c 	movl   $0x8011069c,0x801106ec
80100062:	06 11 80 
80100065:	c7 05 f0 06 11 80 9c 	movl   $0x8011069c,0x801106f0
8010006c:	06 11 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba 9c 06 11 80       	mov    $0x8011069c,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 9c 06 11 80 	movl   $0x8011069c,0x50(%ebx)
80100092:	68 07 75 10 80       	push   $0x80107507
80100097:	50                   	push   %eax
80100098:	e8 63 42 00 00       	call   80104300 <initsleeplock>
8010009d:	a1 f0 06 11 80       	mov    0x801106f0,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d f0 06 11 80    	mov    %ebx,0x801106f0
801000b6:	3d 9c 06 11 80       	cmp    $0x8011069c,%eax
801000bb:	72 c3                	jb     80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 a0 bf 10 80       	push   $0x8010bfa0
801000e4:	e8 87 44 00 00       	call   80104570 <acquire>
801000e9:	8b 1d f0 06 11 80    	mov    0x801106f0,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 9c 06 11 80    	cmp    $0x8011069c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 9c 06 11 80    	cmp    $0x8011069c,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d ec 06 11 80    	mov    0x801106ec,%ebx
80100126:	81 fb 9c 06 11 80    	cmp    $0x8011069c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 9c 06 11 80    	cmp    $0x8011069c,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 a0 bf 10 80       	push   $0x8010bfa0
80100162:	e8 c9 44 00 00       	call   80104630 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 ce 41 00 00       	call   80104340 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 dd 1f 00 00       	call   80102160 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 0e 75 10 80       	push   $0x8010750e
80100198:	e8 f3 01 00 00       	call   80100390 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 2d 42 00 00       	call   801043e0 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 97 1f 00 00       	jmp    80102160 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 1f 75 10 80       	push   $0x8010751f
801001d1:	e8 ba 01 00 00       	call   80100390 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 ec 41 00 00       	call   801043e0 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 9c 41 00 00       	call   801043a0 <releasesleep>
80100204:	c7 04 24 a0 bf 10 80 	movl   $0x8010bfa0,(%esp)
8010020b:	e8 60 43 00 00       	call   80104570 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 f0 06 11 80       	mov    0x801106f0,%eax
80100237:	c7 43 50 9c 06 11 80 	movl   $0x8011069c,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 f0 06 11 80       	mov    0x801106f0,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d f0 06 11 80    	mov    %ebx,0x801106f0
8010024f:	c7 45 08 a0 bf 10 80 	movl   $0x8010bfa0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 cf 43 00 00       	jmp    80104630 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 26 75 10 80       	push   $0x80107526
80100269:	e8 22 01 00 00       	call   80100390 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 1b 15 00 00       	call   801017a0 <iunlock>
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 df 42 00 00       	call   80104570 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e a1 00 00 00    	jle    80100342 <consoleread+0xd2>
801002a1:	8b 15 80 09 11 80    	mov    0x80110980,%edx
801002a7:	39 15 84 09 11 80    	cmp    %edx,0x80110984
801002ad:	74 2c                	je     801002db <consoleread+0x6b>
801002af:	eb 5f                	jmp    80100310 <consoleread+0xa0>
801002b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801002b8:	83 ec 08             	sub    $0x8,%esp
801002bb:	68 20 a5 10 80       	push   $0x8010a520
801002c0:	68 80 09 11 80       	push   $0x80110980
801002c5:	e8 f6 3b 00 00       	call   80103ec0 <sleep>
801002ca:	8b 15 80 09 11 80    	mov    0x80110980,%edx
801002d0:	83 c4 10             	add    $0x10,%esp
801002d3:	3b 15 84 09 11 80    	cmp    0x80110984,%edx
801002d9:	75 35                	jne    80100310 <consoleread+0xa0>
801002db:	e8 c0 35 00 00       	call   801038a0 <myproc>
801002e0:	8b 40 28             	mov    0x28(%eax),%eax
801002e3:	85 c0                	test   %eax,%eax
801002e5:	74 d1                	je     801002b8 <consoleread+0x48>
801002e7:	83 ec 0c             	sub    $0xc,%esp
801002ea:	68 20 a5 10 80       	push   $0x8010a520
801002ef:	e8 3c 43 00 00       	call   80104630 <release>
801002f4:	89 3c 24             	mov    %edi,(%esp)
801002f7:	e8 c4 13 00 00       	call   801016c0 <ilock>
801002fc:	83 c4 10             	add    $0x10,%esp
801002ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100302:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100307:	5b                   	pop    %ebx
80100308:	5e                   	pop    %esi
80100309:	5f                   	pop    %edi
8010030a:	5d                   	pop    %ebp
8010030b:	c3                   	ret    
8010030c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100310:	8d 42 01             	lea    0x1(%edx),%eax
80100313:	a3 80 09 11 80       	mov    %eax,0x80110980
80100318:	89 d0                	mov    %edx,%eax
8010031a:	83 e0 7f             	and    $0x7f,%eax
8010031d:	0f be 80 00 09 11 80 	movsbl -0x7feef700(%eax),%eax
80100324:	83 f8 04             	cmp    $0x4,%eax
80100327:	74 3f                	je     80100368 <consoleread+0xf8>
80100329:	83 c6 01             	add    $0x1,%esi
8010032c:	83 eb 01             	sub    $0x1,%ebx
8010032f:	83 f8 0a             	cmp    $0xa,%eax
80100332:	88 46 ff             	mov    %al,-0x1(%esi)
80100335:	74 43                	je     8010037a <consoleread+0x10a>
80100337:	85 db                	test   %ebx,%ebx
80100339:	0f 85 62 ff ff ff    	jne    801002a1 <consoleread+0x31>
8010033f:	8b 45 10             	mov    0x10(%ebp),%eax
80100342:	83 ec 0c             	sub    $0xc,%esp
80100345:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100348:	68 20 a5 10 80       	push   $0x8010a520
8010034d:	e8 de 42 00 00       	call   80104630 <release>
80100352:	89 3c 24             	mov    %edi,(%esp)
80100355:	e8 66 13 00 00       	call   801016c0 <ilock>
8010035a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010035d:	83 c4 10             	add    $0x10,%esp
80100360:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100363:	5b                   	pop    %ebx
80100364:	5e                   	pop    %esi
80100365:	5f                   	pop    %edi
80100366:	5d                   	pop    %ebp
80100367:	c3                   	ret    
80100368:	8b 45 10             	mov    0x10(%ebp),%eax
8010036b:	29 d8                	sub    %ebx,%eax
8010036d:	3b 5d 10             	cmp    0x10(%ebp),%ebx
80100370:	73 d0                	jae    80100342 <consoleread+0xd2>
80100372:	89 15 80 09 11 80    	mov    %edx,0x80110980
80100378:	eb c8                	jmp    80100342 <consoleread+0xd2>
8010037a:	8b 45 10             	mov    0x10(%ebp),%eax
8010037d:	29 d8                	sub    %ebx,%eax
8010037f:	eb c1                	jmp    80100342 <consoleread+0xd2>
80100381:	eb 0d                	jmp    80100390 <panic>
80100383:	90                   	nop
80100384:	90                   	nop
80100385:	90                   	nop
80100386:	90                   	nop
80100387:	90                   	nop
80100388:	90                   	nop
80100389:	90                   	nop
8010038a:	90                   	nop
8010038b:	90                   	nop
8010038c:	90                   	nop
8010038d:	90                   	nop
8010038e:	90                   	nop
8010038f:	90                   	nop

80100390 <panic>:
80100390:	55                   	push   %ebp
80100391:	89 e5                	mov    %esp,%ebp
80100393:	56                   	push   %esi
80100394:	53                   	push   %ebx
80100395:	83 ec 30             	sub    $0x30,%esp
80100398:	fa                   	cli    
80100399:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
801003a0:	00 00 00 
801003a3:	8d 5d d0             	lea    -0x30(%ebp),%ebx
801003a6:	8d 75 f8             	lea    -0x8(%ebp),%esi
801003a9:	e8 c2 23 00 00       	call   80102770 <lapicid>
801003ae:	83 ec 08             	sub    $0x8,%esp
801003b1:	50                   	push   %eax
801003b2:	68 2d 75 10 80       	push   $0x8010752d
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
801003c5:	c7 04 24 7f 7e 10 80 	movl   $0x80107e7f,(%esp)
801003cc:	e8 8f 02 00 00       	call   80100660 <cprintf>
801003d1:	5a                   	pop    %edx
801003d2:	8d 45 08             	lea    0x8(%ebp),%eax
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 73 40 00 00       	call   80104450 <getcallerpcs>
801003dd:	83 c4 10             	add    $0x10,%esp
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 41 75 10 80       	push   $0x80107541
801003ed:	e8 6e 02 00 00       	call   80100660 <cprintf>
801003f2:	83 c4 10             	add    $0x10,%esp
801003f5:	39 f3                	cmp    %esi,%ebx
801003f7:	75 e7                	jne    801003e0 <panic+0x50>
801003f9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
80100400:	00 00 00 
80100403:	eb fe                	jmp    80100403 <panic+0x73>
80100405:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100410 <consputc>:
80100410:	8b 0d 58 a5 10 80    	mov    0x8010a558,%ecx
80100416:	85 c9                	test   %ecx,%ecx
80100418:	74 06                	je     80100420 <consputc+0x10>
8010041a:	fa                   	cli    
8010041b:	eb fe                	jmp    8010041b <consputc+0xb>
8010041d:	8d 76 00             	lea    0x0(%esi),%esi
80100420:	55                   	push   %ebp
80100421:	89 e5                	mov    %esp,%ebp
80100423:	57                   	push   %edi
80100424:	56                   	push   %esi
80100425:	53                   	push   %ebx
80100426:	89 c6                	mov    %eax,%esi
80100428:	83 ec 0c             	sub    $0xc,%esp
8010042b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100430:	0f 84 b1 00 00 00    	je     801004e7 <consputc+0xd7>
80100436:	83 ec 0c             	sub    $0xc,%esp
80100439:	50                   	push   %eax
8010043a:	e8 41 59 00 00       	call   80105d80 <uartputc>
8010043f:	83 c4 10             	add    $0x10,%esp
80100442:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100447:	b8 0e 00 00 00       	mov    $0xe,%eax
8010044c:	89 da                	mov    %ebx,%edx
8010044e:	ee                   	out    %al,(%dx)
8010044f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100454:	89 ca                	mov    %ecx,%edx
80100456:	ec                   	in     (%dx),%al
80100457:	0f b6 c0             	movzbl %al,%eax
8010045a:	89 da                	mov    %ebx,%edx
8010045c:	c1 e0 08             	shl    $0x8,%eax
8010045f:	89 c7                	mov    %eax,%edi
80100461:	b8 0f 00 00 00       	mov    $0xf,%eax
80100466:	ee                   	out    %al,(%dx)
80100467:	89 ca                	mov    %ecx,%edx
80100469:	ec                   	in     (%dx),%al
8010046a:	0f b6 d8             	movzbl %al,%ebx
8010046d:	09 fb                	or     %edi,%ebx
8010046f:	83 fe 0a             	cmp    $0xa,%esi
80100472:	0f 84 f3 00 00 00    	je     8010056b <consputc+0x15b>
80100478:	81 fe 00 01 00 00    	cmp    $0x100,%esi
8010047e:	0f 84 d7 00 00 00    	je     8010055b <consputc+0x14b>
80100484:	89 f0                	mov    %esi,%eax
80100486:	0f b6 c0             	movzbl %al,%eax
80100489:	80 cc 07             	or     $0x7,%ah
8010048c:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
80100493:	80 
80100494:	83 c3 01             	add    $0x1,%ebx
80100497:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
8010049d:	0f 8f ab 00 00 00    	jg     8010054e <consputc+0x13e>
801004a3:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
801004a9:	7f 66                	jg     80100511 <consputc+0x101>
801004ab:	be d4 03 00 00       	mov    $0x3d4,%esi
801004b0:	b8 0e 00 00 00       	mov    $0xe,%eax
801004b5:	89 f2                	mov    %esi,%edx
801004b7:	ee                   	out    %al,(%dx)
801004b8:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801004bd:	89 d8                	mov    %ebx,%eax
801004bf:	c1 f8 08             	sar    $0x8,%eax
801004c2:	89 ca                	mov    %ecx,%edx
801004c4:	ee                   	out    %al,(%dx)
801004c5:	b8 0f 00 00 00       	mov    $0xf,%eax
801004ca:	89 f2                	mov    %esi,%edx
801004cc:	ee                   	out    %al,(%dx)
801004cd:	89 d8                	mov    %ebx,%eax
801004cf:	89 ca                	mov    %ecx,%edx
801004d1:	ee                   	out    %al,(%dx)
801004d2:	b8 20 07 00 00       	mov    $0x720,%eax
801004d7:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
801004de:	80 
801004df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004e2:	5b                   	pop    %ebx
801004e3:	5e                   	pop    %esi
801004e4:	5f                   	pop    %edi
801004e5:	5d                   	pop    %ebp
801004e6:	c3                   	ret    
801004e7:	83 ec 0c             	sub    $0xc,%esp
801004ea:	6a 08                	push   $0x8
801004ec:	e8 8f 58 00 00       	call   80105d80 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 83 58 00 00       	call   80105d80 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 77 58 00 00       	call   80105d80 <uartputc>
80100509:	83 c4 10             	add    $0x10,%esp
8010050c:	e9 31 ff ff ff       	jmp    80100442 <consputc+0x32>
80100511:	52                   	push   %edx
80100512:	68 60 0e 00 00       	push   $0xe60
80100517:	83 eb 50             	sub    $0x50,%ebx
8010051a:	68 a0 80 0b 80       	push   $0x800b80a0
8010051f:	68 00 80 0b 80       	push   $0x800b8000
80100524:	e8 07 42 00 00       	call   80104730 <memmove>
80100529:	b8 80 07 00 00       	mov    $0x780,%eax
8010052e:	83 c4 0c             	add    $0xc,%esp
80100531:	29 d8                	sub    %ebx,%eax
80100533:	01 c0                	add    %eax,%eax
80100535:	50                   	push   %eax
80100536:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
80100539:	6a 00                	push   $0x0
8010053b:	2d 00 80 f4 7f       	sub    $0x7ff48000,%eax
80100540:	50                   	push   %eax
80100541:	e8 3a 41 00 00       	call   80104680 <memset>
80100546:	83 c4 10             	add    $0x10,%esp
80100549:	e9 5d ff ff ff       	jmp    801004ab <consputc+0x9b>
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 45 75 10 80       	push   $0x80107545
80100556:	e8 35 fe ff ff       	call   80100390 <panic>
8010055b:	85 db                	test   %ebx,%ebx
8010055d:	0f 84 48 ff ff ff    	je     801004ab <consputc+0x9b>
80100563:	83 eb 01             	sub    $0x1,%ebx
80100566:	e9 2c ff ff ff       	jmp    80100497 <consputc+0x87>
8010056b:	89 d8                	mov    %ebx,%eax
8010056d:	b9 50 00 00 00       	mov    $0x50,%ecx
80100572:	99                   	cltd   
80100573:	f7 f9                	idiv   %ecx
80100575:	29 d1                	sub    %edx,%ecx
80100577:	01 cb                	add    %ecx,%ebx
80100579:	e9 19 ff ff ff       	jmp    80100497 <consputc+0x87>
8010057e:	66 90                	xchg   %ax,%ax

80100580 <printint>:
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d3                	mov    %edx,%ebx
80100588:	83 ec 2c             	sub    $0x2c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100590:	74 04                	je     80100596 <printint+0x16>
80100592:	85 c0                	test   %eax,%eax
80100594:	78 5a                	js     801005f0 <printint+0x70>
80100596:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
8010059d:	31 c9                	xor    %ecx,%ecx
8010059f:	8d 75 d7             	lea    -0x29(%ebp),%esi
801005a2:	eb 06                	jmp    801005aa <printint+0x2a>
801005a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801005a8:	89 f9                	mov    %edi,%ecx
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 79 01             	lea    0x1(%ecx),%edi
801005af:	f7 f3                	div    %ebx
801005b1:	0f b6 92 70 75 10 80 	movzbl -0x7fef8a90(%edx),%edx
801005b8:	85 c0                	test   %eax,%eax
801005ba:	88 14 3e             	mov    %dl,(%esi,%edi,1)
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
801005c6:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
801005cb:	8d 79 02             	lea    0x2(%ecx),%edi
801005ce:	8d 5c 3d d7          	lea    -0x29(%ebp,%edi,1),%ebx
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005d8:	0f be 03             	movsbl (%ebx),%eax
801005db:	83 eb 01             	sub    $0x1,%ebx
801005de:	e8 2d fe ff ff       	call   80100410 <consputc>
801005e3:	39 f3                	cmp    %esi,%ebx
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	90                   	nop
801005f0:	f7 d8                	neg    %eax
801005f2:	eb a9                	jmp    8010059d <printint+0x1d>
801005f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	8b 75 10             	mov    0x10(%ebp),%esi
8010060c:	ff 75 08             	pushl  0x8(%ebp)
8010060f:	e8 8c 11 00 00       	call   801017a0 <iunlock>
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 50 3f 00 00       	call   80104570 <acquire>
80100620:	83 c4 10             	add    $0x10,%esp
80100623:	85 f6                	test   %esi,%esi
80100625:	7e 18                	jle    8010063f <consolewrite+0x3f>
80100627:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010062a:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 d5 fd ff ff       	call   80100410 <consputc>
8010063b:	39 fb                	cmp    %edi,%ebx
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 e4 3f 00 00       	call   80104630 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 6b 10 00 00       	call   801016c0 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100673:	0f 85 af 01 00 00    	jne    80100828 <cprintf+0x1c8>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c7                	mov    %eax,%edi
80100680:	0f 84 b7 01 00 00    	je     8010083d <cprintf+0x1dd>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	8d 4d 0c             	lea    0xc(%ebp),%ecx
8010068c:	31 db                	xor    %ebx,%ebx
8010068e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80100691:	85 c0                	test   %eax,%eax
80100693:	75 52                	jne    801006e7 <cprintf+0x87>
80100695:	eb 79                	jmp    80100710 <cprintf+0xb0>
80100697:	89 f6                	mov    %esi,%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	0f b6 16             	movzbl (%esi),%edx
801006a3:	85 d2                	test   %edx,%edx
801006a5:	74 69                	je     80100710 <cprintf+0xb0>
801006a7:	83 c3 02             	add    $0x2,%ebx
801006aa:	83 fa 6c             	cmp    $0x6c,%edx
801006ad:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
801006b0:	0f 84 ca 00 00 00    	je     80100780 <cprintf+0x120>
801006b6:	7f 78                	jg     80100730 <cprintf+0xd0>
801006b8:	83 fa 25             	cmp    $0x25,%edx
801006bb:	0f 84 3f 01 00 00    	je     80100800 <cprintf+0x1a0>
801006c1:	83 fa 64             	cmp    $0x64,%edx
801006c4:	75 7d                	jne    80100743 <cprintf+0xe3>
801006c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006c9:	ba 0a 00 00 00       	mov    $0xa,%edx
801006ce:	8d 48 04             	lea    0x4(%eax),%ecx
801006d1:	8b 00                	mov    (%eax),%eax
801006d3:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801006d6:	b9 01 00 00 00       	mov    $0x1,%ecx
801006db:	e8 a0 fe ff ff       	call   80100580 <printint>
801006e0:	0f b6 06             	movzbl (%esi),%eax
801006e3:	85 c0                	test   %eax,%eax
801006e5:	74 29                	je     80100710 <cprintf+0xb0>
801006e7:	8d 53 01             	lea    0x1(%ebx),%edx
801006ea:	83 f8 25             	cmp    $0x25,%eax
801006ed:	8d 34 17             	lea    (%edi,%edx,1),%esi
801006f0:	74 ae                	je     801006a0 <cprintf+0x40>
801006f2:	89 55 e0             	mov    %edx,-0x20(%ebp)
801006f5:	e8 16 fd ff ff       	call   80100410 <consputc>
801006fa:	0f b6 06             	movzbl (%esi),%eax
801006fd:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100700:	89 d3                	mov    %edx,%ebx
80100702:	85 c0                	test   %eax,%eax
80100704:	75 e1                	jne    801006e7 <cprintf+0x87>
80100706:	8d 76 00             	lea    0x0(%esi),%esi
80100709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100710:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100713:	85 c0                	test   %eax,%eax
80100715:	74 10                	je     80100727 <cprintf+0xc7>
80100717:	83 ec 0c             	sub    $0xc,%esp
8010071a:	68 20 a5 10 80       	push   $0x8010a520
8010071f:	e8 0c 3f 00 00       	call   80104630 <release>
80100724:	83 c4 10             	add    $0x10,%esp
80100727:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010072a:	5b                   	pop    %ebx
8010072b:	5e                   	pop    %esi
8010072c:	5f                   	pop    %edi
8010072d:	5d                   	pop    %ebp
8010072e:	c3                   	ret    
8010072f:	90                   	nop
80100730:	83 fa 73             	cmp    $0x73,%edx
80100733:	0f 84 7f 00 00 00    	je     801007b8 <cprintf+0x158>
80100739:	83 fa 78             	cmp    $0x78,%edx
8010073c:	74 22                	je     80100760 <cprintf+0x100>
8010073e:	83 fa 70             	cmp    $0x70,%edx
80100741:	74 1d                	je     80100760 <cprintf+0x100>
80100743:	b8 25 00 00 00       	mov    $0x25,%eax
80100748:	89 55 e0             	mov    %edx,-0x20(%ebp)
8010074b:	e8 c0 fc ff ff       	call   80100410 <consputc>
80100750:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100753:	89 d0                	mov    %edx,%eax
80100755:	e8 b6 fc ff ff       	call   80100410 <consputc>
8010075a:	eb 84                	jmp    801006e0 <cprintf+0x80>
8010075c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100760:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100763:	ba 10 00 00 00       	mov    $0x10,%edx
80100768:	8d 48 04             	lea    0x4(%eax),%ecx
8010076b:	8b 00                	mov    (%eax),%eax
8010076d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80100770:	31 c9                	xor    %ecx,%ecx
80100772:	e8 09 fe ff ff       	call   80100580 <printint>
80100777:	e9 64 ff ff ff       	jmp    801006e0 <cprintf+0x80>
8010077c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100780:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100783:	8b 08                	mov    (%eax),%ecx
80100785:	8b 40 04             	mov    0x4(%eax),%eax
80100788:	85 c0                	test   %eax,%eax
8010078a:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010078d:	74 0c                	je     8010079b <cprintf+0x13b>
8010078f:	31 c9                	xor    %ecx,%ecx
80100791:	ba 10 00 00 00       	mov    $0x10,%edx
80100796:	e8 e5 fd ff ff       	call   80100580 <printint>
8010079b:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010079e:	31 c9                	xor    %ecx,%ecx
801007a0:	ba 10 00 00 00       	mov    $0x10,%edx
801007a5:	e8 d6 fd ff ff       	call   80100580 <printint>
801007aa:	83 45 e4 08          	addl   $0x8,-0x1c(%ebp)
801007ae:	e9 2d ff ff ff       	jmp    801006e0 <cprintf+0x80>
801007b3:	90                   	nop
801007b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801007b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801007bb:	8b 10                	mov    (%eax),%edx
801007bd:	8d 48 04             	lea    0x4(%eax),%ecx
801007c0:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801007c3:	85 d2                	test   %edx,%edx
801007c5:	74 49                	je     80100810 <cprintf+0x1b0>
801007c7:	0f be 02             	movsbl (%edx),%eax
801007ca:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801007cd:	84 c0                	test   %al,%al
801007cf:	0f 84 0b ff ff ff    	je     801006e0 <cprintf+0x80>
801007d5:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801007d8:	89 d3                	mov    %edx,%ebx
801007da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801007e0:	83 c3 01             	add    $0x1,%ebx
801007e3:	e8 28 fc ff ff       	call   80100410 <consputc>
801007e8:	0f be 03             	movsbl (%ebx),%eax
801007eb:	84 c0                	test   %al,%al
801007ed:	75 f1                	jne    801007e0 <cprintf+0x180>
801007ef:	8b 45 e0             	mov    -0x20(%ebp),%eax
801007f2:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801007f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801007f8:	e9 e3 fe ff ff       	jmp    801006e0 <cprintf+0x80>
801007fd:	8d 76 00             	lea    0x0(%esi),%esi
80100800:	b8 25 00 00 00       	mov    $0x25,%eax
80100805:	e8 06 fc ff ff       	call   80100410 <consputc>
8010080a:	e9 d1 fe ff ff       	jmp    801006e0 <cprintf+0x80>
8010080f:	90                   	nop
80100810:	ba 58 75 10 80       	mov    $0x80107558,%edx
80100815:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100818:	b8 28 00 00 00       	mov    $0x28,%eax
8010081d:	89 d3                	mov    %edx,%ebx
8010081f:	eb bf                	jmp    801007e0 <cprintf+0x180>
80100821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100828:	83 ec 0c             	sub    $0xc,%esp
8010082b:	68 20 a5 10 80       	push   $0x8010a520
80100830:	e8 3b 3d 00 00       	call   80104570 <acquire>
80100835:	83 c4 10             	add    $0x10,%esp
80100838:	e9 3c fe ff ff       	jmp    80100679 <cprintf+0x19>
8010083d:	83 ec 0c             	sub    $0xc,%esp
80100840:	68 5f 75 10 80       	push   $0x8010755f
80100845:	e8 46 fb ff ff       	call   80100390 <panic>
8010084a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100850 <consoleintr>:
80100850:	55                   	push   %ebp
80100851:	89 e5                	mov    %esp,%ebp
80100853:	57                   	push   %edi
80100854:	56                   	push   %esi
80100855:	53                   	push   %ebx
80100856:	31 f6                	xor    %esi,%esi
80100858:	83 ec 18             	sub    $0x18,%esp
8010085b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010085e:	68 20 a5 10 80       	push   $0x8010a520
80100863:	e8 08 3d 00 00       	call   80104570 <acquire>
80100868:	83 c4 10             	add    $0x10,%esp
8010086b:	90                   	nop
8010086c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100870:	ff d3                	call   *%ebx
80100872:	85 c0                	test   %eax,%eax
80100874:	89 c7                	mov    %eax,%edi
80100876:	78 48                	js     801008c0 <consoleintr+0x70>
80100878:	83 ff 10             	cmp    $0x10,%edi
8010087b:	0f 84 e7 00 00 00    	je     80100968 <consoleintr+0x118>
80100881:	7e 5d                	jle    801008e0 <consoleintr+0x90>
80100883:	83 ff 15             	cmp    $0x15,%edi
80100886:	0f 84 ec 00 00 00    	je     80100978 <consoleintr+0x128>
8010088c:	83 ff 7f             	cmp    $0x7f,%edi
8010088f:	75 54                	jne    801008e5 <consoleintr+0x95>
80100891:	a1 88 09 11 80       	mov    0x80110988,%eax
80100896:	3b 05 84 09 11 80    	cmp    0x80110984,%eax
8010089c:	74 d2                	je     80100870 <consoleintr+0x20>
8010089e:	83 e8 01             	sub    $0x1,%eax
801008a1:	a3 88 09 11 80       	mov    %eax,0x80110988
801008a6:	b8 00 01 00 00       	mov    $0x100,%eax
801008ab:	e8 60 fb ff ff       	call   80100410 <consputc>
801008b0:	ff d3                	call   *%ebx
801008b2:	85 c0                	test   %eax,%eax
801008b4:	89 c7                	mov    %eax,%edi
801008b6:	79 c0                	jns    80100878 <consoleintr+0x28>
801008b8:	90                   	nop
801008b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801008c0:	83 ec 0c             	sub    $0xc,%esp
801008c3:	68 20 a5 10 80       	push   $0x8010a520
801008c8:	e8 63 3d 00 00       	call   80104630 <release>
801008cd:	83 c4 10             	add    $0x10,%esp
801008d0:	85 f6                	test   %esi,%esi
801008d2:	0f 85 f8 00 00 00    	jne    801009d0 <consoleintr+0x180>
801008d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801008db:	5b                   	pop    %ebx
801008dc:	5e                   	pop    %esi
801008dd:	5f                   	pop    %edi
801008de:	5d                   	pop    %ebp
801008df:	c3                   	ret    
801008e0:	83 ff 08             	cmp    $0x8,%edi
801008e3:	74 ac                	je     80100891 <consoleintr+0x41>
801008e5:	85 ff                	test   %edi,%edi
801008e7:	74 87                	je     80100870 <consoleintr+0x20>
801008e9:	a1 88 09 11 80       	mov    0x80110988,%eax
801008ee:	89 c2                	mov    %eax,%edx
801008f0:	2b 15 80 09 11 80    	sub    0x80110980,%edx
801008f6:	83 fa 7f             	cmp    $0x7f,%edx
801008f9:	0f 87 71 ff ff ff    	ja     80100870 <consoleintr+0x20>
801008ff:	8d 50 01             	lea    0x1(%eax),%edx
80100902:	83 e0 7f             	and    $0x7f,%eax
80100905:	83 ff 0d             	cmp    $0xd,%edi
80100908:	89 15 88 09 11 80    	mov    %edx,0x80110988
8010090e:	0f 84 cc 00 00 00    	je     801009e0 <consoleintr+0x190>
80100914:	89 f9                	mov    %edi,%ecx
80100916:	88 88 00 09 11 80    	mov    %cl,-0x7feef700(%eax)
8010091c:	89 f8                	mov    %edi,%eax
8010091e:	e8 ed fa ff ff       	call   80100410 <consputc>
80100923:	83 ff 0a             	cmp    $0xa,%edi
80100926:	0f 84 c5 00 00 00    	je     801009f1 <consoleintr+0x1a1>
8010092c:	83 ff 04             	cmp    $0x4,%edi
8010092f:	0f 84 bc 00 00 00    	je     801009f1 <consoleintr+0x1a1>
80100935:	a1 80 09 11 80       	mov    0x80110980,%eax
8010093a:	83 e8 80             	sub    $0xffffff80,%eax
8010093d:	39 05 88 09 11 80    	cmp    %eax,0x80110988
80100943:	0f 85 27 ff ff ff    	jne    80100870 <consoleintr+0x20>
80100949:	83 ec 0c             	sub    $0xc,%esp
8010094c:	a3 84 09 11 80       	mov    %eax,0x80110984
80100951:	68 80 09 11 80       	push   $0x80110980
80100956:	e8 25 37 00 00       	call   80104080 <wakeup>
8010095b:	83 c4 10             	add    $0x10,%esp
8010095e:	e9 0d ff ff ff       	jmp    80100870 <consoleintr+0x20>
80100963:	90                   	nop
80100964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100968:	be 01 00 00 00       	mov    $0x1,%esi
8010096d:	e9 fe fe ff ff       	jmp    80100870 <consoleintr+0x20>
80100972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100978:	a1 88 09 11 80       	mov    0x80110988,%eax
8010097d:	39 05 84 09 11 80    	cmp    %eax,0x80110984
80100983:	75 2b                	jne    801009b0 <consoleintr+0x160>
80100985:	e9 e6 fe ff ff       	jmp    80100870 <consoleintr+0x20>
8010098a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100990:	a3 88 09 11 80       	mov    %eax,0x80110988
80100995:	b8 00 01 00 00       	mov    $0x100,%eax
8010099a:	e8 71 fa ff ff       	call   80100410 <consputc>
8010099f:	a1 88 09 11 80       	mov    0x80110988,%eax
801009a4:	3b 05 84 09 11 80    	cmp    0x80110984,%eax
801009aa:	0f 84 c0 fe ff ff    	je     80100870 <consoleintr+0x20>
801009b0:	83 e8 01             	sub    $0x1,%eax
801009b3:	89 c2                	mov    %eax,%edx
801009b5:	83 e2 7f             	and    $0x7f,%edx
801009b8:	80 ba 00 09 11 80 0a 	cmpb   $0xa,-0x7feef700(%edx)
801009bf:	75 cf                	jne    80100990 <consoleintr+0x140>
801009c1:	e9 aa fe ff ff       	jmp    80100870 <consoleintr+0x20>
801009c6:	8d 76 00             	lea    0x0(%esi),%esi
801009c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801009d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801009d3:	5b                   	pop    %ebx
801009d4:	5e                   	pop    %esi
801009d5:	5f                   	pop    %edi
801009d6:	5d                   	pop    %ebp
801009d7:	e9 44 38 00 00       	jmp    80104220 <procdump>
801009dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801009e0:	c6 80 00 09 11 80 0a 	movb   $0xa,-0x7feef700(%eax)
801009e7:	b8 0a 00 00 00       	mov    $0xa,%eax
801009ec:	e8 1f fa ff ff       	call   80100410 <consputc>
801009f1:	a1 88 09 11 80       	mov    0x80110988,%eax
801009f6:	e9 4e ff ff ff       	jmp    80100949 <consoleintr+0xf9>
801009fb:	90                   	nop
801009fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100a00 <consoleinit>:
80100a00:	55                   	push   %ebp
80100a01:	89 e5                	mov    %esp,%ebp
80100a03:	83 ec 10             	sub    $0x10,%esp
80100a06:	68 68 75 10 80       	push   $0x80107568
80100a0b:	68 20 a5 10 80       	push   $0x8010a520
80100a10:	e8 1b 3a 00 00       	call   80104430 <initlock>
80100a15:	58                   	pop    %eax
80100a16:	5a                   	pop    %edx
80100a17:	6a 00                	push   $0x0
80100a19:	6a 01                	push   $0x1
80100a1b:	c7 05 4c 13 11 80 00 	movl   $0x80100600,0x8011134c
80100a22:	06 10 80 
80100a25:	c7 05 48 13 11 80 70 	movl   $0x80100270,0x80111348
80100a2c:	02 10 80 
80100a2f:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
80100a36:	00 00 00 
80100a39:	e8 d2 18 00 00       	call   80102310 <ioapicenable>
80100a3e:	83 c4 10             	add    $0x10,%esp
80100a41:	c9                   	leave  
80100a42:	c3                   	ret    
80100a43:	66 90                	xchg   %ax,%ax
80100a45:	66 90                	xchg   %ax,%ax
80100a47:	66 90                	xchg   %ax,%ax
80100a49:	66 90                	xchg   %ax,%ax
80100a4b:	66 90                	xchg   %ax,%ax
80100a4d:	66 90                	xchg   %ax,%ax
80100a4f:	90                   	nop

80100a50 <exec>:
80100a50:	55                   	push   %ebp
80100a51:	89 e5                	mov    %esp,%ebp
80100a53:	57                   	push   %edi
80100a54:	56                   	push   %esi
80100a55:	53                   	push   %ebx
80100a56:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
80100a5c:	e8 3f 2e 00 00       	call   801038a0 <myproc>
80100a61:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a67:	e8 c4 21 00 00       	call   80102c30 <begin_op>
80100a6c:	83 ec 0c             	sub    $0xc,%esp
80100a6f:	ff 75 08             	pushl  0x8(%ebp)
80100a72:	e8 a9 14 00 00       	call   80101f20 <namei>
80100a77:	83 c4 10             	add    $0x10,%esp
80100a7a:	85 c0                	test   %eax,%eax
80100a7c:	0f 84 99 01 00 00    	je     80100c1b <exec+0x1cb>
80100a82:	83 ec 0c             	sub    $0xc,%esp
80100a85:	89 c3                	mov    %eax,%ebx
80100a87:	50                   	push   %eax
80100a88:	e8 33 0c 00 00       	call   801016c0 <ilock>
80100a8d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a93:	6a 34                	push   $0x34
80100a95:	6a 00                	push   $0x0
80100a97:	50                   	push   %eax
80100a98:	53                   	push   %ebx
80100a99:	e8 02 0f 00 00       	call   801019a0 <readi>
80100a9e:	83 c4 20             	add    $0x20,%esp
80100aa1:	83 f8 34             	cmp    $0x34,%eax
80100aa4:	74 22                	je     80100ac8 <exec+0x78>
80100aa6:	83 ec 0c             	sub    $0xc,%esp
80100aa9:	53                   	push   %ebx
80100aaa:	e8 a1 0e 00 00       	call   80101950 <iunlockput>
80100aaf:	e8 ec 21 00 00       	call   80102ca0 <end_op>
80100ab4:	83 c4 10             	add    $0x10,%esp
80100ab7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100abc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100abf:	5b                   	pop    %ebx
80100ac0:	5e                   	pop    %esi
80100ac1:	5f                   	pop    %edi
80100ac2:	5d                   	pop    %ebp
80100ac3:	c3                   	ret    
80100ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ac8:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100acf:	45 4c 46 
80100ad2:	75 d2                	jne    80100aa6 <exec+0x56>
80100ad4:	e8 f7 63 00 00       	call   80106ed0 <setupkvm>
80100ad9:	85 c0                	test   %eax,%eax
80100adb:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100ae1:	74 c3                	je     80100aa6 <exec+0x56>
80100ae3:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100aea:	00 
80100aeb:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
80100af1:	bf 00 10 00 00       	mov    $0x1000,%edi
80100af6:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100afc:	0f 84 91 02 00 00    	je     80100d93 <exec+0x343>
80100b02:	31 f6                	xor    %esi,%esi
80100b04:	e9 81 00 00 00       	jmp    80100b8a <exec+0x13a>
80100b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100b10:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100b17:	75 63                	jne    80100b7c <exec+0x12c>
80100b19:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b1f:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b25:	0f 82 86 00 00 00    	jb     80100bb1 <exec+0x161>
80100b2b:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b31:	72 7e                	jb     80100bb1 <exec+0x161>
80100b33:	83 ec 04             	sub    $0x4,%esp
80100b36:	50                   	push   %eax
80100b37:	57                   	push   %edi
80100b38:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b3e:	e8 ad 61 00 00       	call   80106cf0 <allocuvm>
80100b43:	83 c4 10             	add    $0x10,%esp
80100b46:	85 c0                	test   %eax,%eax
80100b48:	89 c7                	mov    %eax,%edi
80100b4a:	74 65                	je     80100bb1 <exec+0x161>
80100b4c:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b52:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b57:	75 58                	jne    80100bb1 <exec+0x161>
80100b59:	83 ec 0c             	sub    $0xc,%esp
80100b5c:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b62:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b68:	53                   	push   %ebx
80100b69:	50                   	push   %eax
80100b6a:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b70:	e8 bb 60 00 00       	call   80106c30 <loaduvm>
80100b75:	83 c4 20             	add    $0x20,%esp
80100b78:	85 c0                	test   %eax,%eax
80100b7a:	78 35                	js     80100bb1 <exec+0x161>
80100b7c:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100b83:	83 c6 01             	add    $0x1,%esi
80100b86:	39 f0                	cmp    %esi,%eax
80100b88:	7e 3d                	jle    80100bc7 <exec+0x177>
80100b8a:	89 f0                	mov    %esi,%eax
80100b8c:	6a 20                	push   $0x20
80100b8e:	c1 e0 05             	shl    $0x5,%eax
80100b91:	03 85 ec fe ff ff    	add    -0x114(%ebp),%eax
80100b97:	50                   	push   %eax
80100b98:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100b9e:	50                   	push   %eax
80100b9f:	53                   	push   %ebx
80100ba0:	e8 fb 0d 00 00       	call   801019a0 <readi>
80100ba5:	83 c4 10             	add    $0x10,%esp
80100ba8:	83 f8 20             	cmp    $0x20,%eax
80100bab:	0f 84 5f ff ff ff    	je     80100b10 <exec+0xc0>
80100bb1:	83 ec 0c             	sub    $0xc,%esp
80100bb4:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bba:	e8 91 62 00 00       	call   80106e50 <freevm>
80100bbf:	83 c4 10             	add    $0x10,%esp
80100bc2:	e9 df fe ff ff       	jmp    80100aa6 <exec+0x56>
80100bc7:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100bcd:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100bd3:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
80100bd9:	83 ec 0c             	sub    $0xc,%esp
80100bdc:	53                   	push   %ebx
80100bdd:	e8 6e 0d 00 00       	call   80101950 <iunlockput>
80100be2:	e8 b9 20 00 00       	call   80102ca0 <end_op>
80100be7:	83 c4 0c             	add    $0xc,%esp
80100bea:	56                   	push   %esi
80100beb:	57                   	push   %edi
80100bec:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bf2:	e8 f9 60 00 00       	call   80106cf0 <allocuvm>
80100bf7:	83 c4 10             	add    $0x10,%esp
80100bfa:	85 c0                	test   %eax,%eax
80100bfc:	89 c6                	mov    %eax,%esi
80100bfe:	75 3a                	jne    80100c3a <exec+0x1ea>
80100c00:	83 ec 0c             	sub    $0xc,%esp
80100c03:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c09:	e8 42 62 00 00       	call   80106e50 <freevm>
80100c0e:	83 c4 10             	add    $0x10,%esp
80100c11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c16:	e9 a1 fe ff ff       	jmp    80100abc <exec+0x6c>
80100c1b:	e8 80 20 00 00       	call   80102ca0 <end_op>
80100c20:	83 ec 0c             	sub    $0xc,%esp
80100c23:	68 81 75 10 80       	push   $0x80107581
80100c28:	e8 33 fa ff ff       	call   80100660 <cprintf>
80100c2d:	83 c4 10             	add    $0x10,%esp
80100c30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c35:	e9 82 fe ff ff       	jmp    80100abc <exec+0x6c>
80100c3a:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100c40:	83 ec 08             	sub    $0x8,%esp
80100c43:	31 ff                	xor    %edi,%edi
80100c45:	89 f3                	mov    %esi,%ebx
80100c47:	50                   	push   %eax
80100c48:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c4e:	e8 1d 63 00 00       	call   80106f70 <clearpteu>
80100c53:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c56:	83 c4 10             	add    $0x10,%esp
80100c59:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c5f:	8b 00                	mov    (%eax),%eax
80100c61:	85 c0                	test   %eax,%eax
80100c63:	74 70                	je     80100cd5 <exec+0x285>
80100c65:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c6b:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c71:	eb 0a                	jmp    80100c7d <exec+0x22d>
80100c73:	90                   	nop
80100c74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100c78:	83 ff 20             	cmp    $0x20,%edi
80100c7b:	74 83                	je     80100c00 <exec+0x1b0>
80100c7d:	83 ec 0c             	sub    $0xc,%esp
80100c80:	50                   	push   %eax
80100c81:	e8 1a 3c 00 00       	call   801048a0 <strlen>
80100c86:	f7 d0                	not    %eax
80100c88:	01 c3                	add    %eax,%ebx
80100c8a:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c8d:	5a                   	pop    %edx
80100c8e:	83 e3 fc             	and    $0xfffffffc,%ebx
80100c91:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c94:	e8 07 3c 00 00       	call   801048a0 <strlen>
80100c99:	83 c0 01             	add    $0x1,%eax
80100c9c:	50                   	push   %eax
80100c9d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100ca0:	ff 34 b8             	pushl  (%eax,%edi,4)
80100ca3:	53                   	push   %ebx
80100ca4:	56                   	push   %esi
80100ca5:	e8 26 64 00 00       	call   801070d0 <copyout>
80100caa:	83 c4 20             	add    $0x20,%esp
80100cad:	85 c0                	test   %eax,%eax
80100caf:	0f 88 4b ff ff ff    	js     80100c00 <exec+0x1b0>
80100cb5:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cb8:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100cbf:	83 c7 01             	add    $0x1,%edi
80100cc2:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100cc8:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100ccb:	85 c0                	test   %eax,%eax
80100ccd:	75 a9                	jne    80100c78 <exec+0x228>
80100ccf:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100cd5:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100cdc:	89 d9                	mov    %ebx,%ecx
80100cde:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100ce5:	00 00 00 00 
80100ce9:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100cf0:	ff ff ff 
80100cf3:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100cf9:	29 c1                	sub    %eax,%ecx
80100cfb:	83 c0 0c             	add    $0xc,%eax
80100cfe:	29 c3                	sub    %eax,%ebx
80100d00:	50                   	push   %eax
80100d01:	52                   	push   %edx
80100d02:	53                   	push   %ebx
80100d03:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100d09:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100d0f:	e8 bc 63 00 00       	call   801070d0 <copyout>
80100d14:	83 c4 10             	add    $0x10,%esp
80100d17:	85 c0                	test   %eax,%eax
80100d19:	0f 88 e1 fe ff ff    	js     80100c00 <exec+0x1b0>
80100d1f:	8b 45 08             	mov    0x8(%ebp),%eax
80100d22:	0f b6 00             	movzbl (%eax),%eax
80100d25:	84 c0                	test   %al,%al
80100d27:	74 17                	je     80100d40 <exec+0x2f0>
80100d29:	8b 55 08             	mov    0x8(%ebp),%edx
80100d2c:	89 d1                	mov    %edx,%ecx
80100d2e:	83 c1 01             	add    $0x1,%ecx
80100d31:	3c 2f                	cmp    $0x2f,%al
80100d33:	0f b6 01             	movzbl (%ecx),%eax
80100d36:	0f 44 d1             	cmove  %ecx,%edx
80100d39:	84 c0                	test   %al,%al
80100d3b:	75 f1                	jne    80100d2e <exec+0x2de>
80100d3d:	89 55 08             	mov    %edx,0x8(%ebp)
80100d40:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100d46:	50                   	push   %eax
80100d47:	6a 10                	push   $0x10
80100d49:	ff 75 08             	pushl  0x8(%ebp)
80100d4c:	89 f8                	mov    %edi,%eax
80100d4e:	83 c0 70             	add    $0x70,%eax
80100d51:	50                   	push   %eax
80100d52:	e8 09 3b 00 00       	call   80104860 <safestrcpy>
80100d57:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
80100d5d:	89 f9                	mov    %edi,%ecx
80100d5f:	8b 7f 04             	mov    0x4(%edi),%edi
80100d62:	8b 41 1c             	mov    0x1c(%ecx),%eax
80100d65:	89 31                	mov    %esi,(%ecx)
80100d67:	89 51 04             	mov    %edx,0x4(%ecx)
80100d6a:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d70:	89 50 38             	mov    %edx,0x38(%eax)
80100d73:	8b 41 1c             	mov    0x1c(%ecx),%eax
80100d76:	89 58 44             	mov    %ebx,0x44(%eax)
80100d79:	89 0c 24             	mov    %ecx,(%esp)
80100d7c:	e8 1f 5d 00 00       	call   80106aa0 <switchuvm>
80100d81:	89 3c 24             	mov    %edi,(%esp)
80100d84:	e8 c7 60 00 00       	call   80106e50 <freevm>
80100d89:	83 c4 10             	add    $0x10,%esp
80100d8c:	31 c0                	xor    %eax,%eax
80100d8e:	e9 29 fd ff ff       	jmp    80100abc <exec+0x6c>
80100d93:	be 00 30 00 00       	mov    $0x3000,%esi
80100d98:	e9 3c fe ff ff       	jmp    80100bd9 <exec+0x189>
80100d9d:	66 90                	xchg   %ax,%ax
80100d9f:	90                   	nop

80100da0 <fileinit>:
80100da0:	55                   	push   %ebp
80100da1:	89 e5                	mov    %esp,%ebp
80100da3:	83 ec 10             	sub    $0x10,%esp
80100da6:	68 8d 75 10 80       	push   $0x8010758d
80100dab:	68 a0 09 11 80       	push   $0x801109a0
80100db0:	e8 7b 36 00 00       	call   80104430 <initlock>
80100db5:	83 c4 10             	add    $0x10,%esp
80100db8:	c9                   	leave  
80100db9:	c3                   	ret    
80100dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100dc0 <filealloc>:
80100dc0:	55                   	push   %ebp
80100dc1:	89 e5                	mov    %esp,%ebp
80100dc3:	53                   	push   %ebx
80100dc4:	bb d4 09 11 80       	mov    $0x801109d4,%ebx
80100dc9:	83 ec 10             	sub    $0x10,%esp
80100dcc:	68 a0 09 11 80       	push   $0x801109a0
80100dd1:	e8 9a 37 00 00       	call   80104570 <acquire>
80100dd6:	83 c4 10             	add    $0x10,%esp
80100dd9:	eb 10                	jmp    80100deb <filealloc+0x2b>
80100ddb:	90                   	nop
80100ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100de0:	83 c3 18             	add    $0x18,%ebx
80100de3:	81 fb 34 13 11 80    	cmp    $0x80111334,%ebx
80100de9:	73 25                	jae    80100e10 <filealloc+0x50>
80100deb:	8b 43 04             	mov    0x4(%ebx),%eax
80100dee:	85 c0                	test   %eax,%eax
80100df0:	75 ee                	jne    80100de0 <filealloc+0x20>
80100df2:	83 ec 0c             	sub    $0xc,%esp
80100df5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100dfc:	68 a0 09 11 80       	push   $0x801109a0
80100e01:	e8 2a 38 00 00       	call   80104630 <release>
80100e06:	89 d8                	mov    %ebx,%eax
80100e08:	83 c4 10             	add    $0x10,%esp
80100e0b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e0e:	c9                   	leave  
80100e0f:	c3                   	ret    
80100e10:	83 ec 0c             	sub    $0xc,%esp
80100e13:	31 db                	xor    %ebx,%ebx
80100e15:	68 a0 09 11 80       	push   $0x801109a0
80100e1a:	e8 11 38 00 00       	call   80104630 <release>
80100e1f:	89 d8                	mov    %ebx,%eax
80100e21:	83 c4 10             	add    $0x10,%esp
80100e24:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e27:	c9                   	leave  
80100e28:	c3                   	ret    
80100e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100e30 <filedup>:
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	53                   	push   %ebx
80100e34:	83 ec 10             	sub    $0x10,%esp
80100e37:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e3a:	68 a0 09 11 80       	push   $0x801109a0
80100e3f:	e8 2c 37 00 00       	call   80104570 <acquire>
80100e44:	8b 43 04             	mov    0x4(%ebx),%eax
80100e47:	83 c4 10             	add    $0x10,%esp
80100e4a:	85 c0                	test   %eax,%eax
80100e4c:	7e 1a                	jle    80100e68 <filedup+0x38>
80100e4e:	83 c0 01             	add    $0x1,%eax
80100e51:	83 ec 0c             	sub    $0xc,%esp
80100e54:	89 43 04             	mov    %eax,0x4(%ebx)
80100e57:	68 a0 09 11 80       	push   $0x801109a0
80100e5c:	e8 cf 37 00 00       	call   80104630 <release>
80100e61:	89 d8                	mov    %ebx,%eax
80100e63:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e66:	c9                   	leave  
80100e67:	c3                   	ret    
80100e68:	83 ec 0c             	sub    $0xc,%esp
80100e6b:	68 94 75 10 80       	push   $0x80107594
80100e70:	e8 1b f5 ff ff       	call   80100390 <panic>
80100e75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e80 <fileclose>:
80100e80:	55                   	push   %ebp
80100e81:	89 e5                	mov    %esp,%ebp
80100e83:	57                   	push   %edi
80100e84:	56                   	push   %esi
80100e85:	53                   	push   %ebx
80100e86:	83 ec 28             	sub    $0x28,%esp
80100e89:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e8c:	68 a0 09 11 80       	push   $0x801109a0
80100e91:	e8 da 36 00 00       	call   80104570 <acquire>
80100e96:	8b 43 04             	mov    0x4(%ebx),%eax
80100e99:	83 c4 10             	add    $0x10,%esp
80100e9c:	85 c0                	test   %eax,%eax
80100e9e:	0f 8e 9b 00 00 00    	jle    80100f3f <fileclose+0xbf>
80100ea4:	83 e8 01             	sub    $0x1,%eax
80100ea7:	85 c0                	test   %eax,%eax
80100ea9:	89 43 04             	mov    %eax,0x4(%ebx)
80100eac:	74 1a                	je     80100ec8 <fileclose+0x48>
80100eae:	c7 45 08 a0 09 11 80 	movl   $0x801109a0,0x8(%ebp)
80100eb5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100eb8:	5b                   	pop    %ebx
80100eb9:	5e                   	pop    %esi
80100eba:	5f                   	pop    %edi
80100ebb:	5d                   	pop    %ebp
80100ebc:	e9 6f 37 00 00       	jmp    80104630 <release>
80100ec1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100ec8:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100ecc:	8b 3b                	mov    (%ebx),%edi
80100ece:	83 ec 0c             	sub    $0xc,%esp
80100ed1:	8b 73 0c             	mov    0xc(%ebx),%esi
80100ed4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100eda:	88 45 e7             	mov    %al,-0x19(%ebp)
80100edd:	8b 43 10             	mov    0x10(%ebx),%eax
80100ee0:	68 a0 09 11 80       	push   $0x801109a0
80100ee5:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100ee8:	e8 43 37 00 00       	call   80104630 <release>
80100eed:	83 c4 10             	add    $0x10,%esp
80100ef0:	83 ff 01             	cmp    $0x1,%edi
80100ef3:	74 13                	je     80100f08 <fileclose+0x88>
80100ef5:	83 ff 02             	cmp    $0x2,%edi
80100ef8:	74 26                	je     80100f20 <fileclose+0xa0>
80100efa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100efd:	5b                   	pop    %ebx
80100efe:	5e                   	pop    %esi
80100eff:	5f                   	pop    %edi
80100f00:	5d                   	pop    %ebp
80100f01:	c3                   	ret    
80100f02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f08:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100f0c:	83 ec 08             	sub    $0x8,%esp
80100f0f:	53                   	push   %ebx
80100f10:	56                   	push   %esi
80100f11:	e8 ca 24 00 00       	call   801033e0 <pipeclose>
80100f16:	83 c4 10             	add    $0x10,%esp
80100f19:	eb df                	jmp    80100efa <fileclose+0x7a>
80100f1b:	90                   	nop
80100f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100f20:	e8 0b 1d 00 00       	call   80102c30 <begin_op>
80100f25:	83 ec 0c             	sub    $0xc,%esp
80100f28:	ff 75 e0             	pushl  -0x20(%ebp)
80100f2b:	e8 c0 08 00 00       	call   801017f0 <iput>
80100f30:	83 c4 10             	add    $0x10,%esp
80100f33:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f36:	5b                   	pop    %ebx
80100f37:	5e                   	pop    %esi
80100f38:	5f                   	pop    %edi
80100f39:	5d                   	pop    %ebp
80100f3a:	e9 61 1d 00 00       	jmp    80102ca0 <end_op>
80100f3f:	83 ec 0c             	sub    $0xc,%esp
80100f42:	68 9c 75 10 80       	push   $0x8010759c
80100f47:	e8 44 f4 ff ff       	call   80100390 <panic>
80100f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f50 <filestat>:
80100f50:	55                   	push   %ebp
80100f51:	89 e5                	mov    %esp,%ebp
80100f53:	53                   	push   %ebx
80100f54:	83 ec 04             	sub    $0x4,%esp
80100f57:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f5a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f5d:	75 31                	jne    80100f90 <filestat+0x40>
80100f5f:	83 ec 0c             	sub    $0xc,%esp
80100f62:	ff 73 10             	pushl  0x10(%ebx)
80100f65:	e8 56 07 00 00       	call   801016c0 <ilock>
80100f6a:	58                   	pop    %eax
80100f6b:	5a                   	pop    %edx
80100f6c:	ff 75 0c             	pushl  0xc(%ebp)
80100f6f:	ff 73 10             	pushl  0x10(%ebx)
80100f72:	e8 f9 09 00 00       	call   80101970 <stati>
80100f77:	59                   	pop    %ecx
80100f78:	ff 73 10             	pushl  0x10(%ebx)
80100f7b:	e8 20 08 00 00       	call   801017a0 <iunlock>
80100f80:	83 c4 10             	add    $0x10,%esp
80100f83:	31 c0                	xor    %eax,%eax
80100f85:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f88:	c9                   	leave  
80100f89:	c3                   	ret    
80100f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f95:	eb ee                	jmp    80100f85 <filestat+0x35>
80100f97:	89 f6                	mov    %esi,%esi
80100f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100fa0 <fileread>:
80100fa0:	55                   	push   %ebp
80100fa1:	89 e5                	mov    %esp,%ebp
80100fa3:	57                   	push   %edi
80100fa4:	56                   	push   %esi
80100fa5:	53                   	push   %ebx
80100fa6:	83 ec 0c             	sub    $0xc,%esp
80100fa9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100fac:	8b 75 0c             	mov    0xc(%ebp),%esi
80100faf:	8b 7d 10             	mov    0x10(%ebp),%edi
80100fb2:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100fb6:	74 60                	je     80101018 <fileread+0x78>
80100fb8:	8b 03                	mov    (%ebx),%eax
80100fba:	83 f8 01             	cmp    $0x1,%eax
80100fbd:	74 41                	je     80101000 <fileread+0x60>
80100fbf:	83 f8 02             	cmp    $0x2,%eax
80100fc2:	75 5b                	jne    8010101f <fileread+0x7f>
80100fc4:	83 ec 0c             	sub    $0xc,%esp
80100fc7:	ff 73 10             	pushl  0x10(%ebx)
80100fca:	e8 f1 06 00 00       	call   801016c0 <ilock>
80100fcf:	57                   	push   %edi
80100fd0:	ff 73 14             	pushl  0x14(%ebx)
80100fd3:	56                   	push   %esi
80100fd4:	ff 73 10             	pushl  0x10(%ebx)
80100fd7:	e8 c4 09 00 00       	call   801019a0 <readi>
80100fdc:	83 c4 20             	add    $0x20,%esp
80100fdf:	85 c0                	test   %eax,%eax
80100fe1:	89 c6                	mov    %eax,%esi
80100fe3:	7e 03                	jle    80100fe8 <fileread+0x48>
80100fe5:	01 43 14             	add    %eax,0x14(%ebx)
80100fe8:	83 ec 0c             	sub    $0xc,%esp
80100feb:	ff 73 10             	pushl  0x10(%ebx)
80100fee:	e8 ad 07 00 00       	call   801017a0 <iunlock>
80100ff3:	83 c4 10             	add    $0x10,%esp
80100ff6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ff9:	89 f0                	mov    %esi,%eax
80100ffb:	5b                   	pop    %ebx
80100ffc:	5e                   	pop    %esi
80100ffd:	5f                   	pop    %edi
80100ffe:	5d                   	pop    %ebp
80100fff:	c3                   	ret    
80101000:	8b 43 0c             	mov    0xc(%ebx),%eax
80101003:	89 45 08             	mov    %eax,0x8(%ebp)
80101006:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101009:	5b                   	pop    %ebx
8010100a:	5e                   	pop    %esi
8010100b:	5f                   	pop    %edi
8010100c:	5d                   	pop    %ebp
8010100d:	e9 7e 25 00 00       	jmp    80103590 <piperead>
80101012:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101018:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010101d:	eb d7                	jmp    80100ff6 <fileread+0x56>
8010101f:	83 ec 0c             	sub    $0xc,%esp
80101022:	68 a6 75 10 80       	push   $0x801075a6
80101027:	e8 64 f3 ff ff       	call   80100390 <panic>
8010102c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101030 <filewrite>:
80101030:	55                   	push   %ebp
80101031:	89 e5                	mov    %esp,%ebp
80101033:	57                   	push   %edi
80101034:	56                   	push   %esi
80101035:	53                   	push   %ebx
80101036:	83 ec 1c             	sub    $0x1c,%esp
80101039:	8b 75 08             	mov    0x8(%ebp),%esi
8010103c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010103f:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80101043:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101046:	8b 45 10             	mov    0x10(%ebp),%eax
80101049:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010104c:	0f 84 aa 00 00 00    	je     801010fc <filewrite+0xcc>
80101052:	8b 06                	mov    (%esi),%eax
80101054:	83 f8 01             	cmp    $0x1,%eax
80101057:	0f 84 c3 00 00 00    	je     80101120 <filewrite+0xf0>
8010105d:	83 f8 02             	cmp    $0x2,%eax
80101060:	0f 85 d9 00 00 00    	jne    8010113f <filewrite+0x10f>
80101066:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101069:	31 ff                	xor    %edi,%edi
8010106b:	85 c0                	test   %eax,%eax
8010106d:	7f 34                	jg     801010a3 <filewrite+0x73>
8010106f:	e9 9c 00 00 00       	jmp    80101110 <filewrite+0xe0>
80101074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101078:	01 46 14             	add    %eax,0x14(%esi)
8010107b:	83 ec 0c             	sub    $0xc,%esp
8010107e:	ff 76 10             	pushl  0x10(%esi)
80101081:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101084:	e8 17 07 00 00       	call   801017a0 <iunlock>
80101089:	e8 12 1c 00 00       	call   80102ca0 <end_op>
8010108e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101091:	83 c4 10             	add    $0x10,%esp
80101094:	39 c3                	cmp    %eax,%ebx
80101096:	0f 85 96 00 00 00    	jne    80101132 <filewrite+0x102>
8010109c:	01 df                	add    %ebx,%edi
8010109e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801010a1:	7e 6d                	jle    80101110 <filewrite+0xe0>
801010a3:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801010a6:	b8 00 06 00 00       	mov    $0x600,%eax
801010ab:	29 fb                	sub    %edi,%ebx
801010ad:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
801010b3:	0f 4f d8             	cmovg  %eax,%ebx
801010b6:	e8 75 1b 00 00       	call   80102c30 <begin_op>
801010bb:	83 ec 0c             	sub    $0xc,%esp
801010be:	ff 76 10             	pushl  0x10(%esi)
801010c1:	e8 fa 05 00 00       	call   801016c0 <ilock>
801010c6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801010c9:	53                   	push   %ebx
801010ca:	ff 76 14             	pushl  0x14(%esi)
801010cd:	01 f8                	add    %edi,%eax
801010cf:	50                   	push   %eax
801010d0:	ff 76 10             	pushl  0x10(%esi)
801010d3:	e8 c8 09 00 00       	call   80101aa0 <writei>
801010d8:	83 c4 20             	add    $0x20,%esp
801010db:	85 c0                	test   %eax,%eax
801010dd:	7f 99                	jg     80101078 <filewrite+0x48>
801010df:	83 ec 0c             	sub    $0xc,%esp
801010e2:	ff 76 10             	pushl  0x10(%esi)
801010e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010e8:	e8 b3 06 00 00       	call   801017a0 <iunlock>
801010ed:	e8 ae 1b 00 00       	call   80102ca0 <end_op>
801010f2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010f5:	83 c4 10             	add    $0x10,%esp
801010f8:	85 c0                	test   %eax,%eax
801010fa:	74 98                	je     80101094 <filewrite+0x64>
801010fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010ff:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80101104:	89 f8                	mov    %edi,%eax
80101106:	5b                   	pop    %ebx
80101107:	5e                   	pop    %esi
80101108:	5f                   	pop    %edi
80101109:	5d                   	pop    %ebp
8010110a:	c3                   	ret    
8010110b:	90                   	nop
8010110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101110:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101113:	75 e7                	jne    801010fc <filewrite+0xcc>
80101115:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101118:	89 f8                	mov    %edi,%eax
8010111a:	5b                   	pop    %ebx
8010111b:	5e                   	pop    %esi
8010111c:	5f                   	pop    %edi
8010111d:	5d                   	pop    %ebp
8010111e:	c3                   	ret    
8010111f:	90                   	nop
80101120:	8b 46 0c             	mov    0xc(%esi),%eax
80101123:	89 45 08             	mov    %eax,0x8(%ebp)
80101126:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101129:	5b                   	pop    %ebx
8010112a:	5e                   	pop    %esi
8010112b:	5f                   	pop    %edi
8010112c:	5d                   	pop    %ebp
8010112d:	e9 4e 23 00 00       	jmp    80103480 <pipewrite>
80101132:	83 ec 0c             	sub    $0xc,%esp
80101135:	68 af 75 10 80       	push   $0x801075af
8010113a:	e8 51 f2 ff ff       	call   80100390 <panic>
8010113f:	83 ec 0c             	sub    $0xc,%esp
80101142:	68 b5 75 10 80       	push   $0x801075b5
80101147:	e8 44 f2 ff ff       	call   80100390 <panic>
8010114c:	66 90                	xchg   %ax,%ax
8010114e:	66 90                	xchg   %ax,%ax

80101150 <bfree>:
80101150:	55                   	push   %ebp
80101151:	89 e5                	mov    %esp,%ebp
80101153:	56                   	push   %esi
80101154:	53                   	push   %ebx
80101155:	89 d3                	mov    %edx,%ebx
80101157:	c1 ea 0c             	shr    $0xc,%edx
8010115a:	03 15 b8 13 11 80    	add    0x801113b8,%edx
80101160:	83 ec 08             	sub    $0x8,%esp
80101163:	52                   	push   %edx
80101164:	50                   	push   %eax
80101165:	e8 66 ef ff ff       	call   801000d0 <bread>
8010116a:	89 d9                	mov    %ebx,%ecx
8010116c:	c1 fb 03             	sar    $0x3,%ebx
8010116f:	ba 01 00 00 00       	mov    $0x1,%edx
80101174:	83 e1 07             	and    $0x7,%ecx
80101177:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010117d:	83 c4 10             	add    $0x10,%esp
80101180:	d3 e2                	shl    %cl,%edx
80101182:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101187:	85 d1                	test   %edx,%ecx
80101189:	74 25                	je     801011b0 <bfree+0x60>
8010118b:	f7 d2                	not    %edx
8010118d:	89 c6                	mov    %eax,%esi
8010118f:	83 ec 0c             	sub    $0xc,%esp
80101192:	21 ca                	and    %ecx,%edx
80101194:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
80101198:	56                   	push   %esi
80101199:	e8 62 1c 00 00       	call   80102e00 <log_write>
8010119e:	89 34 24             	mov    %esi,(%esp)
801011a1:	e8 3a f0 ff ff       	call   801001e0 <brelse>
801011a6:	83 c4 10             	add    $0x10,%esp
801011a9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801011ac:	5b                   	pop    %ebx
801011ad:	5e                   	pop    %esi
801011ae:	5d                   	pop    %ebp
801011af:	c3                   	ret    
801011b0:	83 ec 0c             	sub    $0xc,%esp
801011b3:	68 bf 75 10 80       	push   $0x801075bf
801011b8:	e8 d3 f1 ff ff       	call   80100390 <panic>
801011bd:	8d 76 00             	lea    0x0(%esi),%esi

801011c0 <balloc>:
801011c0:	55                   	push   %ebp
801011c1:	89 e5                	mov    %esp,%ebp
801011c3:	57                   	push   %edi
801011c4:	56                   	push   %esi
801011c5:	53                   	push   %ebx
801011c6:	83 ec 1c             	sub    $0x1c,%esp
801011c9:	8b 0d a0 13 11 80    	mov    0x801113a0,%ecx
801011cf:	89 45 d8             	mov    %eax,-0x28(%ebp)
801011d2:	85 c9                	test   %ecx,%ecx
801011d4:	0f 84 87 00 00 00    	je     80101261 <balloc+0xa1>
801011da:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
801011e1:	8b 75 dc             	mov    -0x24(%ebp),%esi
801011e4:	83 ec 08             	sub    $0x8,%esp
801011e7:	89 f0                	mov    %esi,%eax
801011e9:	c1 f8 0c             	sar    $0xc,%eax
801011ec:	03 05 b8 13 11 80    	add    0x801113b8,%eax
801011f2:	50                   	push   %eax
801011f3:	ff 75 d8             	pushl  -0x28(%ebp)
801011f6:	e8 d5 ee ff ff       	call   801000d0 <bread>
801011fb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801011fe:	a1 a0 13 11 80       	mov    0x801113a0,%eax
80101203:	83 c4 10             	add    $0x10,%esp
80101206:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101209:	31 c0                	xor    %eax,%eax
8010120b:	eb 2f                	jmp    8010123c <balloc+0x7c>
8010120d:	8d 76 00             	lea    0x0(%esi),%esi
80101210:	89 c1                	mov    %eax,%ecx
80101212:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101215:	bb 01 00 00 00       	mov    $0x1,%ebx
8010121a:	83 e1 07             	and    $0x7,%ecx
8010121d:	d3 e3                	shl    %cl,%ebx
8010121f:	89 c1                	mov    %eax,%ecx
80101221:	c1 f9 03             	sar    $0x3,%ecx
80101224:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101229:	85 df                	test   %ebx,%edi
8010122b:	89 fa                	mov    %edi,%edx
8010122d:	74 41                	je     80101270 <balloc+0xb0>
8010122f:	83 c0 01             	add    $0x1,%eax
80101232:	83 c6 01             	add    $0x1,%esi
80101235:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010123a:	74 05                	je     80101241 <balloc+0x81>
8010123c:	39 75 e0             	cmp    %esi,-0x20(%ebp)
8010123f:	77 cf                	ja     80101210 <balloc+0x50>
80101241:	83 ec 0c             	sub    $0xc,%esp
80101244:	ff 75 e4             	pushl  -0x1c(%ebp)
80101247:	e8 94 ef ff ff       	call   801001e0 <brelse>
8010124c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101253:	83 c4 10             	add    $0x10,%esp
80101256:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101259:	39 05 a0 13 11 80    	cmp    %eax,0x801113a0
8010125f:	77 80                	ja     801011e1 <balloc+0x21>
80101261:	83 ec 0c             	sub    $0xc,%esp
80101264:	68 d2 75 10 80       	push   $0x801075d2
80101269:	e8 22 f1 ff ff       	call   80100390 <panic>
8010126e:	66 90                	xchg   %ax,%ax
80101270:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101273:	83 ec 0c             	sub    $0xc,%esp
80101276:	09 da                	or     %ebx,%edx
80101278:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
8010127c:	57                   	push   %edi
8010127d:	e8 7e 1b 00 00       	call   80102e00 <log_write>
80101282:	89 3c 24             	mov    %edi,(%esp)
80101285:	e8 56 ef ff ff       	call   801001e0 <brelse>
8010128a:	58                   	pop    %eax
8010128b:	5a                   	pop    %edx
8010128c:	56                   	push   %esi
8010128d:	ff 75 d8             	pushl  -0x28(%ebp)
80101290:	e8 3b ee ff ff       	call   801000d0 <bread>
80101295:	89 c3                	mov    %eax,%ebx
80101297:	8d 40 5c             	lea    0x5c(%eax),%eax
8010129a:	83 c4 0c             	add    $0xc,%esp
8010129d:	68 00 02 00 00       	push   $0x200
801012a2:	6a 00                	push   $0x0
801012a4:	50                   	push   %eax
801012a5:	e8 d6 33 00 00       	call   80104680 <memset>
801012aa:	89 1c 24             	mov    %ebx,(%esp)
801012ad:	e8 4e 1b 00 00       	call   80102e00 <log_write>
801012b2:	89 1c 24             	mov    %ebx,(%esp)
801012b5:	e8 26 ef ff ff       	call   801001e0 <brelse>
801012ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012bd:	89 f0                	mov    %esi,%eax
801012bf:	5b                   	pop    %ebx
801012c0:	5e                   	pop    %esi
801012c1:	5f                   	pop    %edi
801012c2:	5d                   	pop    %ebp
801012c3:	c3                   	ret    
801012c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801012ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801012d0 <iget>:
801012d0:	55                   	push   %ebp
801012d1:	89 e5                	mov    %esp,%ebp
801012d3:	57                   	push   %edi
801012d4:	56                   	push   %esi
801012d5:	53                   	push   %ebx
801012d6:	89 c7                	mov    %eax,%edi
801012d8:	31 f6                	xor    %esi,%esi
801012da:	bb f4 13 11 80       	mov    $0x801113f4,%ebx
801012df:	83 ec 28             	sub    $0x28,%esp
801012e2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801012e5:	68 c0 13 11 80       	push   $0x801113c0
801012ea:	e8 81 32 00 00       	call   80104570 <acquire>
801012ef:	83 c4 10             	add    $0x10,%esp
801012f2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801012f5:	eb 17                	jmp    8010130e <iget+0x3e>
801012f7:	89 f6                	mov    %esi,%esi
801012f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101300:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101306:	81 fb 14 30 11 80    	cmp    $0x80113014,%ebx
8010130c:	73 22                	jae    80101330 <iget+0x60>
8010130e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101311:	85 c9                	test   %ecx,%ecx
80101313:	7e 04                	jle    80101319 <iget+0x49>
80101315:	39 3b                	cmp    %edi,(%ebx)
80101317:	74 4f                	je     80101368 <iget+0x98>
80101319:	85 f6                	test   %esi,%esi
8010131b:	75 e3                	jne    80101300 <iget+0x30>
8010131d:	85 c9                	test   %ecx,%ecx
8010131f:	0f 44 f3             	cmove  %ebx,%esi
80101322:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101328:	81 fb 14 30 11 80    	cmp    $0x80113014,%ebx
8010132e:	72 de                	jb     8010130e <iget+0x3e>
80101330:	85 f6                	test   %esi,%esi
80101332:	74 5b                	je     8010138f <iget+0xbf>
80101334:	83 ec 0c             	sub    $0xc,%esp
80101337:	89 3e                	mov    %edi,(%esi)
80101339:	89 56 04             	mov    %edx,0x4(%esi)
8010133c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
80101343:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010134a:	68 c0 13 11 80       	push   $0x801113c0
8010134f:	e8 dc 32 00 00       	call   80104630 <release>
80101354:	83 c4 10             	add    $0x10,%esp
80101357:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010135a:	89 f0                	mov    %esi,%eax
8010135c:	5b                   	pop    %ebx
8010135d:	5e                   	pop    %esi
8010135e:	5f                   	pop    %edi
8010135f:	5d                   	pop    %ebp
80101360:	c3                   	ret    
80101361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101368:	39 53 04             	cmp    %edx,0x4(%ebx)
8010136b:	75 ac                	jne    80101319 <iget+0x49>
8010136d:	83 ec 0c             	sub    $0xc,%esp
80101370:	83 c1 01             	add    $0x1,%ecx
80101373:	89 de                	mov    %ebx,%esi
80101375:	68 c0 13 11 80       	push   $0x801113c0
8010137a:	89 4b 08             	mov    %ecx,0x8(%ebx)
8010137d:	e8 ae 32 00 00       	call   80104630 <release>
80101382:	83 c4 10             	add    $0x10,%esp
80101385:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101388:	89 f0                	mov    %esi,%eax
8010138a:	5b                   	pop    %ebx
8010138b:	5e                   	pop    %esi
8010138c:	5f                   	pop    %edi
8010138d:	5d                   	pop    %ebp
8010138e:	c3                   	ret    
8010138f:	83 ec 0c             	sub    $0xc,%esp
80101392:	68 e8 75 10 80       	push   $0x801075e8
80101397:	e8 f4 ef ff ff       	call   80100390 <panic>
8010139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801013a0 <bmap>:
801013a0:	55                   	push   %ebp
801013a1:	89 e5                	mov    %esp,%ebp
801013a3:	57                   	push   %edi
801013a4:	56                   	push   %esi
801013a5:	53                   	push   %ebx
801013a6:	89 c6                	mov    %eax,%esi
801013a8:	83 ec 1c             	sub    $0x1c,%esp
801013ab:	83 fa 0b             	cmp    $0xb,%edx
801013ae:	77 18                	ja     801013c8 <bmap+0x28>
801013b0:	8d 3c 90             	lea    (%eax,%edx,4),%edi
801013b3:	8b 5f 5c             	mov    0x5c(%edi),%ebx
801013b6:	85 db                	test   %ebx,%ebx
801013b8:	74 76                	je     80101430 <bmap+0x90>
801013ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013bd:	89 d8                	mov    %ebx,%eax
801013bf:	5b                   	pop    %ebx
801013c0:	5e                   	pop    %esi
801013c1:	5f                   	pop    %edi
801013c2:	5d                   	pop    %ebp
801013c3:	c3                   	ret    
801013c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801013c8:	8d 5a f4             	lea    -0xc(%edx),%ebx
801013cb:	83 fb 7f             	cmp    $0x7f,%ebx
801013ce:	0f 87 90 00 00 00    	ja     80101464 <bmap+0xc4>
801013d4:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
801013da:	8b 00                	mov    (%eax),%eax
801013dc:	85 d2                	test   %edx,%edx
801013de:	74 70                	je     80101450 <bmap+0xb0>
801013e0:	83 ec 08             	sub    $0x8,%esp
801013e3:	52                   	push   %edx
801013e4:	50                   	push   %eax
801013e5:	e8 e6 ec ff ff       	call   801000d0 <bread>
801013ea:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
801013ee:	83 c4 10             	add    $0x10,%esp
801013f1:	89 c7                	mov    %eax,%edi
801013f3:	8b 1a                	mov    (%edx),%ebx
801013f5:	85 db                	test   %ebx,%ebx
801013f7:	75 1d                	jne    80101416 <bmap+0x76>
801013f9:	8b 06                	mov    (%esi),%eax
801013fb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801013fe:	e8 bd fd ff ff       	call   801011c0 <balloc>
80101403:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101406:	83 ec 0c             	sub    $0xc,%esp
80101409:	89 c3                	mov    %eax,%ebx
8010140b:	89 02                	mov    %eax,(%edx)
8010140d:	57                   	push   %edi
8010140e:	e8 ed 19 00 00       	call   80102e00 <log_write>
80101413:	83 c4 10             	add    $0x10,%esp
80101416:	83 ec 0c             	sub    $0xc,%esp
80101419:	57                   	push   %edi
8010141a:	e8 c1 ed ff ff       	call   801001e0 <brelse>
8010141f:	83 c4 10             	add    $0x10,%esp
80101422:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101425:	89 d8                	mov    %ebx,%eax
80101427:	5b                   	pop    %ebx
80101428:	5e                   	pop    %esi
80101429:	5f                   	pop    %edi
8010142a:	5d                   	pop    %ebp
8010142b:	c3                   	ret    
8010142c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101430:	8b 00                	mov    (%eax),%eax
80101432:	e8 89 fd ff ff       	call   801011c0 <balloc>
80101437:	89 47 5c             	mov    %eax,0x5c(%edi)
8010143a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010143d:	89 c3                	mov    %eax,%ebx
8010143f:	89 d8                	mov    %ebx,%eax
80101441:	5b                   	pop    %ebx
80101442:	5e                   	pop    %esi
80101443:	5f                   	pop    %edi
80101444:	5d                   	pop    %ebp
80101445:	c3                   	ret    
80101446:	8d 76 00             	lea    0x0(%esi),%esi
80101449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101450:	e8 6b fd ff ff       	call   801011c0 <balloc>
80101455:	89 c2                	mov    %eax,%edx
80101457:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
8010145d:	8b 06                	mov    (%esi),%eax
8010145f:	e9 7c ff ff ff       	jmp    801013e0 <bmap+0x40>
80101464:	83 ec 0c             	sub    $0xc,%esp
80101467:	68 f8 75 10 80       	push   $0x801075f8
8010146c:	e8 1f ef ff ff       	call   80100390 <panic>
80101471:	eb 0d                	jmp    80101480 <readsb>
80101473:	90                   	nop
80101474:	90                   	nop
80101475:	90                   	nop
80101476:	90                   	nop
80101477:	90                   	nop
80101478:	90                   	nop
80101479:	90                   	nop
8010147a:	90                   	nop
8010147b:	90                   	nop
8010147c:	90                   	nop
8010147d:	90                   	nop
8010147e:	90                   	nop
8010147f:	90                   	nop

80101480 <readsb>:
80101480:	55                   	push   %ebp
80101481:	89 e5                	mov    %esp,%ebp
80101483:	56                   	push   %esi
80101484:	53                   	push   %ebx
80101485:	8b 75 0c             	mov    0xc(%ebp),%esi
80101488:	83 ec 08             	sub    $0x8,%esp
8010148b:	6a 01                	push   $0x1
8010148d:	ff 75 08             	pushl  0x8(%ebp)
80101490:	e8 3b ec ff ff       	call   801000d0 <bread>
80101495:	89 c3                	mov    %eax,%ebx
80101497:	8d 40 5c             	lea    0x5c(%eax),%eax
8010149a:	83 c4 0c             	add    $0xc,%esp
8010149d:	6a 1c                	push   $0x1c
8010149f:	50                   	push   %eax
801014a0:	56                   	push   %esi
801014a1:	e8 8a 32 00 00       	call   80104730 <memmove>
801014a6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801014a9:	83 c4 10             	add    $0x10,%esp
801014ac:	8d 65 f8             	lea    -0x8(%ebp),%esp
801014af:	5b                   	pop    %ebx
801014b0:	5e                   	pop    %esi
801014b1:	5d                   	pop    %ebp
801014b2:	e9 29 ed ff ff       	jmp    801001e0 <brelse>
801014b7:	89 f6                	mov    %esi,%esi
801014b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801014c0 <iinit>:
801014c0:	55                   	push   %ebp
801014c1:	89 e5                	mov    %esp,%ebp
801014c3:	53                   	push   %ebx
801014c4:	bb 00 14 11 80       	mov    $0x80111400,%ebx
801014c9:	83 ec 0c             	sub    $0xc,%esp
801014cc:	68 0b 76 10 80       	push   $0x8010760b
801014d1:	68 c0 13 11 80       	push   $0x801113c0
801014d6:	e8 55 2f 00 00       	call   80104430 <initlock>
801014db:	83 c4 10             	add    $0x10,%esp
801014de:	66 90                	xchg   %ax,%ax
801014e0:	83 ec 08             	sub    $0x8,%esp
801014e3:	68 12 76 10 80       	push   $0x80107612
801014e8:	53                   	push   %ebx
801014e9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014ef:	e8 0c 2e 00 00       	call   80104300 <initsleeplock>
801014f4:	83 c4 10             	add    $0x10,%esp
801014f7:	81 fb 20 30 11 80    	cmp    $0x80113020,%ebx
801014fd:	75 e1                	jne    801014e0 <iinit+0x20>
801014ff:	83 ec 08             	sub    $0x8,%esp
80101502:	68 a0 13 11 80       	push   $0x801113a0
80101507:	ff 75 08             	pushl  0x8(%ebp)
8010150a:	e8 71 ff ff ff       	call   80101480 <readsb>
8010150f:	ff 35 b8 13 11 80    	pushl  0x801113b8
80101515:	ff 35 b4 13 11 80    	pushl  0x801113b4
8010151b:	ff 35 b0 13 11 80    	pushl  0x801113b0
80101521:	ff 35 ac 13 11 80    	pushl  0x801113ac
80101527:	ff 35 a8 13 11 80    	pushl  0x801113a8
8010152d:	ff 35 a4 13 11 80    	pushl  0x801113a4
80101533:	ff 35 a0 13 11 80    	pushl  0x801113a0
80101539:	68 78 76 10 80       	push   $0x80107678
8010153e:	e8 1d f1 ff ff       	call   80100660 <cprintf>
80101543:	83 c4 30             	add    $0x30,%esp
80101546:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101549:	c9                   	leave  
8010154a:	c3                   	ret    
8010154b:	90                   	nop
8010154c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101550 <ialloc>:
80101550:	55                   	push   %ebp
80101551:	89 e5                	mov    %esp,%ebp
80101553:	57                   	push   %edi
80101554:	56                   	push   %esi
80101555:	53                   	push   %ebx
80101556:	83 ec 1c             	sub    $0x1c,%esp
80101559:	83 3d a8 13 11 80 01 	cmpl   $0x1,0x801113a8
80101560:	8b 45 0c             	mov    0xc(%ebp),%eax
80101563:	8b 75 08             	mov    0x8(%ebp),%esi
80101566:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101569:	0f 86 91 00 00 00    	jbe    80101600 <ialloc+0xb0>
8010156f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101574:	eb 21                	jmp    80101597 <ialloc+0x47>
80101576:	8d 76 00             	lea    0x0(%esi),%esi
80101579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101580:	83 ec 0c             	sub    $0xc,%esp
80101583:	83 c3 01             	add    $0x1,%ebx
80101586:	57                   	push   %edi
80101587:	e8 54 ec ff ff       	call   801001e0 <brelse>
8010158c:	83 c4 10             	add    $0x10,%esp
8010158f:	39 1d a8 13 11 80    	cmp    %ebx,0x801113a8
80101595:	76 69                	jbe    80101600 <ialloc+0xb0>
80101597:	89 d8                	mov    %ebx,%eax
80101599:	83 ec 08             	sub    $0x8,%esp
8010159c:	c1 e8 03             	shr    $0x3,%eax
8010159f:	03 05 b4 13 11 80    	add    0x801113b4,%eax
801015a5:	50                   	push   %eax
801015a6:	56                   	push   %esi
801015a7:	e8 24 eb ff ff       	call   801000d0 <bread>
801015ac:	89 c7                	mov    %eax,%edi
801015ae:	89 d8                	mov    %ebx,%eax
801015b0:	83 c4 10             	add    $0x10,%esp
801015b3:	83 e0 07             	and    $0x7,%eax
801015b6:	c1 e0 06             	shl    $0x6,%eax
801015b9:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
801015bd:	66 83 39 00          	cmpw   $0x0,(%ecx)
801015c1:	75 bd                	jne    80101580 <ialloc+0x30>
801015c3:	83 ec 04             	sub    $0x4,%esp
801015c6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801015c9:	6a 40                	push   $0x40
801015cb:	6a 00                	push   $0x0
801015cd:	51                   	push   %ecx
801015ce:	e8 ad 30 00 00       	call   80104680 <memset>
801015d3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801015d7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801015da:	66 89 01             	mov    %ax,(%ecx)
801015dd:	89 3c 24             	mov    %edi,(%esp)
801015e0:	e8 1b 18 00 00       	call   80102e00 <log_write>
801015e5:	89 3c 24             	mov    %edi,(%esp)
801015e8:	e8 f3 eb ff ff       	call   801001e0 <brelse>
801015ed:	83 c4 10             	add    $0x10,%esp
801015f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801015f3:	89 da                	mov    %ebx,%edx
801015f5:	89 f0                	mov    %esi,%eax
801015f7:	5b                   	pop    %ebx
801015f8:	5e                   	pop    %esi
801015f9:	5f                   	pop    %edi
801015fa:	5d                   	pop    %ebp
801015fb:	e9 d0 fc ff ff       	jmp    801012d0 <iget>
80101600:	83 ec 0c             	sub    $0xc,%esp
80101603:	68 18 76 10 80       	push   $0x80107618
80101608:	e8 83 ed ff ff       	call   80100390 <panic>
8010160d:	8d 76 00             	lea    0x0(%esi),%esi

80101610 <iupdate>:
80101610:	55                   	push   %ebp
80101611:	89 e5                	mov    %esp,%ebp
80101613:	56                   	push   %esi
80101614:	53                   	push   %ebx
80101615:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101618:	83 ec 08             	sub    $0x8,%esp
8010161b:	8b 43 04             	mov    0x4(%ebx),%eax
8010161e:	83 c3 5c             	add    $0x5c,%ebx
80101621:	c1 e8 03             	shr    $0x3,%eax
80101624:	03 05 b4 13 11 80    	add    0x801113b4,%eax
8010162a:	50                   	push   %eax
8010162b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010162e:	e8 9d ea ff ff       	call   801000d0 <bread>
80101633:	89 c6                	mov    %eax,%esi
80101635:	8b 43 a8             	mov    -0x58(%ebx),%eax
80101638:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
8010163c:	83 c4 0c             	add    $0xc,%esp
8010163f:	83 e0 07             	and    $0x7,%eax
80101642:	c1 e0 06             	shl    $0x6,%eax
80101645:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101649:	66 89 10             	mov    %dx,(%eax)
8010164c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
80101650:	83 c0 0c             	add    $0xc,%eax
80101653:	66 89 50 f6          	mov    %dx,-0xa(%eax)
80101657:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010165b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
8010165f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101663:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101667:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010166a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010166d:	6a 34                	push   $0x34
8010166f:	53                   	push   %ebx
80101670:	50                   	push   %eax
80101671:	e8 ba 30 00 00       	call   80104730 <memmove>
80101676:	89 34 24             	mov    %esi,(%esp)
80101679:	e8 82 17 00 00       	call   80102e00 <log_write>
8010167e:	89 75 08             	mov    %esi,0x8(%ebp)
80101681:	83 c4 10             	add    $0x10,%esp
80101684:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101687:	5b                   	pop    %ebx
80101688:	5e                   	pop    %esi
80101689:	5d                   	pop    %ebp
8010168a:	e9 51 eb ff ff       	jmp    801001e0 <brelse>
8010168f:	90                   	nop

80101690 <idup>:
80101690:	55                   	push   %ebp
80101691:	89 e5                	mov    %esp,%ebp
80101693:	53                   	push   %ebx
80101694:	83 ec 10             	sub    $0x10,%esp
80101697:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010169a:	68 c0 13 11 80       	push   $0x801113c0
8010169f:	e8 cc 2e 00 00       	call   80104570 <acquire>
801016a4:	83 43 08 01          	addl   $0x1,0x8(%ebx)
801016a8:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
801016af:	e8 7c 2f 00 00       	call   80104630 <release>
801016b4:	89 d8                	mov    %ebx,%eax
801016b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801016b9:	c9                   	leave  
801016ba:	c3                   	ret    
801016bb:	90                   	nop
801016bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801016c0 <ilock>:
801016c0:	55                   	push   %ebp
801016c1:	89 e5                	mov    %esp,%ebp
801016c3:	56                   	push   %esi
801016c4:	53                   	push   %ebx
801016c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801016c8:	85 db                	test   %ebx,%ebx
801016ca:	0f 84 b7 00 00 00    	je     80101787 <ilock+0xc7>
801016d0:	8b 53 08             	mov    0x8(%ebx),%edx
801016d3:	85 d2                	test   %edx,%edx
801016d5:	0f 8e ac 00 00 00    	jle    80101787 <ilock+0xc7>
801016db:	8d 43 0c             	lea    0xc(%ebx),%eax
801016de:	83 ec 0c             	sub    $0xc,%esp
801016e1:	50                   	push   %eax
801016e2:	e8 59 2c 00 00       	call   80104340 <acquiresleep>
801016e7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801016ea:	83 c4 10             	add    $0x10,%esp
801016ed:	85 c0                	test   %eax,%eax
801016ef:	74 0f                	je     80101700 <ilock+0x40>
801016f1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016f4:	5b                   	pop    %ebx
801016f5:	5e                   	pop    %esi
801016f6:	5d                   	pop    %ebp
801016f7:	c3                   	ret    
801016f8:	90                   	nop
801016f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101700:	8b 43 04             	mov    0x4(%ebx),%eax
80101703:	83 ec 08             	sub    $0x8,%esp
80101706:	c1 e8 03             	shr    $0x3,%eax
80101709:	03 05 b4 13 11 80    	add    0x801113b4,%eax
8010170f:	50                   	push   %eax
80101710:	ff 33                	pushl  (%ebx)
80101712:	e8 b9 e9 ff ff       	call   801000d0 <bread>
80101717:	89 c6                	mov    %eax,%esi
80101719:	8b 43 04             	mov    0x4(%ebx),%eax
8010171c:	83 c4 0c             	add    $0xc,%esp
8010171f:	83 e0 07             	and    $0x7,%eax
80101722:	c1 e0 06             	shl    $0x6,%eax
80101725:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101729:	0f b7 10             	movzwl (%eax),%edx
8010172c:	83 c0 0c             	add    $0xc,%eax
8010172f:	66 89 53 50          	mov    %dx,0x50(%ebx)
80101733:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101737:	66 89 53 52          	mov    %dx,0x52(%ebx)
8010173b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010173f:	66 89 53 54          	mov    %dx,0x54(%ebx)
80101743:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101747:	66 89 53 56          	mov    %dx,0x56(%ebx)
8010174b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010174e:	89 53 58             	mov    %edx,0x58(%ebx)
80101751:	6a 34                	push   $0x34
80101753:	50                   	push   %eax
80101754:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101757:	50                   	push   %eax
80101758:	e8 d3 2f 00 00       	call   80104730 <memmove>
8010175d:	89 34 24             	mov    %esi,(%esp)
80101760:	e8 7b ea ff ff       	call   801001e0 <brelse>
80101765:	83 c4 10             	add    $0x10,%esp
80101768:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010176d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101774:	0f 85 77 ff ff ff    	jne    801016f1 <ilock+0x31>
8010177a:	83 ec 0c             	sub    $0xc,%esp
8010177d:	68 30 76 10 80       	push   $0x80107630
80101782:	e8 09 ec ff ff       	call   80100390 <panic>
80101787:	83 ec 0c             	sub    $0xc,%esp
8010178a:	68 2a 76 10 80       	push   $0x8010762a
8010178f:	e8 fc eb ff ff       	call   80100390 <panic>
80101794:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010179a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801017a0 <iunlock>:
801017a0:	55                   	push   %ebp
801017a1:	89 e5                	mov    %esp,%ebp
801017a3:	56                   	push   %esi
801017a4:	53                   	push   %ebx
801017a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801017a8:	85 db                	test   %ebx,%ebx
801017aa:	74 28                	je     801017d4 <iunlock+0x34>
801017ac:	8d 73 0c             	lea    0xc(%ebx),%esi
801017af:	83 ec 0c             	sub    $0xc,%esp
801017b2:	56                   	push   %esi
801017b3:	e8 28 2c 00 00       	call   801043e0 <holdingsleep>
801017b8:	83 c4 10             	add    $0x10,%esp
801017bb:	85 c0                	test   %eax,%eax
801017bd:	74 15                	je     801017d4 <iunlock+0x34>
801017bf:	8b 43 08             	mov    0x8(%ebx),%eax
801017c2:	85 c0                	test   %eax,%eax
801017c4:	7e 0e                	jle    801017d4 <iunlock+0x34>
801017c6:	89 75 08             	mov    %esi,0x8(%ebp)
801017c9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801017cc:	5b                   	pop    %ebx
801017cd:	5e                   	pop    %esi
801017ce:	5d                   	pop    %ebp
801017cf:	e9 cc 2b 00 00       	jmp    801043a0 <releasesleep>
801017d4:	83 ec 0c             	sub    $0xc,%esp
801017d7:	68 3f 76 10 80       	push   $0x8010763f
801017dc:	e8 af eb ff ff       	call   80100390 <panic>
801017e1:	eb 0d                	jmp    801017f0 <iput>
801017e3:	90                   	nop
801017e4:	90                   	nop
801017e5:	90                   	nop
801017e6:	90                   	nop
801017e7:	90                   	nop
801017e8:	90                   	nop
801017e9:	90                   	nop
801017ea:	90                   	nop
801017eb:	90                   	nop
801017ec:	90                   	nop
801017ed:	90                   	nop
801017ee:	90                   	nop
801017ef:	90                   	nop

801017f0 <iput>:
801017f0:	55                   	push   %ebp
801017f1:	89 e5                	mov    %esp,%ebp
801017f3:	57                   	push   %edi
801017f4:	56                   	push   %esi
801017f5:	53                   	push   %ebx
801017f6:	83 ec 28             	sub    $0x28,%esp
801017f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801017fc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801017ff:	57                   	push   %edi
80101800:	e8 3b 2b 00 00       	call   80104340 <acquiresleep>
80101805:	8b 53 4c             	mov    0x4c(%ebx),%edx
80101808:	83 c4 10             	add    $0x10,%esp
8010180b:	85 d2                	test   %edx,%edx
8010180d:	74 07                	je     80101816 <iput+0x26>
8010180f:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80101814:	74 32                	je     80101848 <iput+0x58>
80101816:	83 ec 0c             	sub    $0xc,%esp
80101819:	57                   	push   %edi
8010181a:	e8 81 2b 00 00       	call   801043a0 <releasesleep>
8010181f:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
80101826:	e8 45 2d 00 00       	call   80104570 <acquire>
8010182b:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
8010182f:	83 c4 10             	add    $0x10,%esp
80101832:	c7 45 08 c0 13 11 80 	movl   $0x801113c0,0x8(%ebp)
80101839:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010183c:	5b                   	pop    %ebx
8010183d:	5e                   	pop    %esi
8010183e:	5f                   	pop    %edi
8010183f:	5d                   	pop    %ebp
80101840:	e9 eb 2d 00 00       	jmp    80104630 <release>
80101845:	8d 76 00             	lea    0x0(%esi),%esi
80101848:	83 ec 0c             	sub    $0xc,%esp
8010184b:	68 c0 13 11 80       	push   $0x801113c0
80101850:	e8 1b 2d 00 00       	call   80104570 <acquire>
80101855:	8b 73 08             	mov    0x8(%ebx),%esi
80101858:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
8010185f:	e8 cc 2d 00 00       	call   80104630 <release>
80101864:	83 c4 10             	add    $0x10,%esp
80101867:	83 fe 01             	cmp    $0x1,%esi
8010186a:	75 aa                	jne    80101816 <iput+0x26>
8010186c:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
80101872:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101875:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101878:	89 cf                	mov    %ecx,%edi
8010187a:	eb 0b                	jmp    80101887 <iput+0x97>
8010187c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101880:	83 c6 04             	add    $0x4,%esi
80101883:	39 fe                	cmp    %edi,%esi
80101885:	74 19                	je     801018a0 <iput+0xb0>
80101887:	8b 16                	mov    (%esi),%edx
80101889:	85 d2                	test   %edx,%edx
8010188b:	74 f3                	je     80101880 <iput+0x90>
8010188d:	8b 03                	mov    (%ebx),%eax
8010188f:	e8 bc f8 ff ff       	call   80101150 <bfree>
80101894:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010189a:	eb e4                	jmp    80101880 <iput+0x90>
8010189c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801018a0:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
801018a6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801018a9:	85 c0                	test   %eax,%eax
801018ab:	75 33                	jne    801018e0 <iput+0xf0>
801018ad:	83 ec 0c             	sub    $0xc,%esp
801018b0:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
801018b7:	53                   	push   %ebx
801018b8:	e8 53 fd ff ff       	call   80101610 <iupdate>
801018bd:	31 c0                	xor    %eax,%eax
801018bf:	66 89 43 50          	mov    %ax,0x50(%ebx)
801018c3:	89 1c 24             	mov    %ebx,(%esp)
801018c6:	e8 45 fd ff ff       	call   80101610 <iupdate>
801018cb:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
801018d2:	83 c4 10             	add    $0x10,%esp
801018d5:	e9 3c ff ff ff       	jmp    80101816 <iput+0x26>
801018da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801018e0:	83 ec 08             	sub    $0x8,%esp
801018e3:	50                   	push   %eax
801018e4:	ff 33                	pushl  (%ebx)
801018e6:	e8 e5 e7 ff ff       	call   801000d0 <bread>
801018eb:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018f1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801018f7:	8d 70 5c             	lea    0x5c(%eax),%esi
801018fa:	83 c4 10             	add    $0x10,%esp
801018fd:	89 cf                	mov    %ecx,%edi
801018ff:	eb 0e                	jmp    8010190f <iput+0x11f>
80101901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101908:	83 c6 04             	add    $0x4,%esi
8010190b:	39 fe                	cmp    %edi,%esi
8010190d:	74 0f                	je     8010191e <iput+0x12e>
8010190f:	8b 16                	mov    (%esi),%edx
80101911:	85 d2                	test   %edx,%edx
80101913:	74 f3                	je     80101908 <iput+0x118>
80101915:	8b 03                	mov    (%ebx),%eax
80101917:	e8 34 f8 ff ff       	call   80101150 <bfree>
8010191c:	eb ea                	jmp    80101908 <iput+0x118>
8010191e:	83 ec 0c             	sub    $0xc,%esp
80101921:	ff 75 e4             	pushl  -0x1c(%ebp)
80101924:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101927:	e8 b4 e8 ff ff       	call   801001e0 <brelse>
8010192c:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
80101932:	8b 03                	mov    (%ebx),%eax
80101934:	e8 17 f8 ff ff       	call   80101150 <bfree>
80101939:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80101940:	00 00 00 
80101943:	83 c4 10             	add    $0x10,%esp
80101946:	e9 62 ff ff ff       	jmp    801018ad <iput+0xbd>
8010194b:	90                   	nop
8010194c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101950 <iunlockput>:
80101950:	55                   	push   %ebp
80101951:	89 e5                	mov    %esp,%ebp
80101953:	53                   	push   %ebx
80101954:	83 ec 10             	sub    $0x10,%esp
80101957:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010195a:	53                   	push   %ebx
8010195b:	e8 40 fe ff ff       	call   801017a0 <iunlock>
80101960:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101963:	83 c4 10             	add    $0x10,%esp
80101966:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101969:	c9                   	leave  
8010196a:	e9 81 fe ff ff       	jmp    801017f0 <iput>
8010196f:	90                   	nop

80101970 <stati>:
80101970:	55                   	push   %ebp
80101971:	89 e5                	mov    %esp,%ebp
80101973:	8b 55 08             	mov    0x8(%ebp),%edx
80101976:	8b 45 0c             	mov    0xc(%ebp),%eax
80101979:	8b 0a                	mov    (%edx),%ecx
8010197b:	89 48 04             	mov    %ecx,0x4(%eax)
8010197e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101981:	89 48 08             	mov    %ecx,0x8(%eax)
80101984:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101988:	66 89 08             	mov    %cx,(%eax)
8010198b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010198f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101993:	8b 52 58             	mov    0x58(%edx),%edx
80101996:	89 50 10             	mov    %edx,0x10(%eax)
80101999:	5d                   	pop    %ebp
8010199a:	c3                   	ret    
8010199b:	90                   	nop
8010199c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801019a0 <readi>:
801019a0:	55                   	push   %ebp
801019a1:	89 e5                	mov    %esp,%ebp
801019a3:	57                   	push   %edi
801019a4:	56                   	push   %esi
801019a5:	53                   	push   %ebx
801019a6:	83 ec 1c             	sub    $0x1c,%esp
801019a9:	8b 45 08             	mov    0x8(%ebp),%eax
801019ac:	8b 75 0c             	mov    0xc(%ebp),%esi
801019af:	8b 7d 14             	mov    0x14(%ebp),%edi
801019b2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
801019b7:	89 75 e0             	mov    %esi,-0x20(%ebp)
801019ba:	89 45 d8             	mov    %eax,-0x28(%ebp)
801019bd:	8b 75 10             	mov    0x10(%ebp),%esi
801019c0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801019c3:	0f 84 a7 00 00 00    	je     80101a70 <readi+0xd0>
801019c9:	8b 45 d8             	mov    -0x28(%ebp),%eax
801019cc:	8b 40 58             	mov    0x58(%eax),%eax
801019cf:	39 c6                	cmp    %eax,%esi
801019d1:	0f 87 ba 00 00 00    	ja     80101a91 <readi+0xf1>
801019d7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801019da:	89 f9                	mov    %edi,%ecx
801019dc:	01 f1                	add    %esi,%ecx
801019de:	0f 82 ad 00 00 00    	jb     80101a91 <readi+0xf1>
801019e4:	89 c2                	mov    %eax,%edx
801019e6:	29 f2                	sub    %esi,%edx
801019e8:	39 c8                	cmp    %ecx,%eax
801019ea:	0f 43 d7             	cmovae %edi,%edx
801019ed:	31 ff                	xor    %edi,%edi
801019ef:	85 d2                	test   %edx,%edx
801019f1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801019f4:	74 6c                	je     80101a62 <readi+0xc2>
801019f6:	8d 76 00             	lea    0x0(%esi),%esi
801019f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101a00:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101a03:	89 f2                	mov    %esi,%edx
80101a05:	c1 ea 09             	shr    $0x9,%edx
80101a08:	89 d8                	mov    %ebx,%eax
80101a0a:	e8 91 f9 ff ff       	call   801013a0 <bmap>
80101a0f:	83 ec 08             	sub    $0x8,%esp
80101a12:	50                   	push   %eax
80101a13:	ff 33                	pushl  (%ebx)
80101a15:	e8 b6 e6 ff ff       	call   801000d0 <bread>
80101a1a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101a1d:	89 c2                	mov    %eax,%edx
80101a1f:	89 f0                	mov    %esi,%eax
80101a21:	25 ff 01 00 00       	and    $0x1ff,%eax
80101a26:	b9 00 02 00 00       	mov    $0x200,%ecx
80101a2b:	83 c4 0c             	add    $0xc,%esp
80101a2e:	29 c1                	sub    %eax,%ecx
80101a30:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
80101a34:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101a37:	29 fb                	sub    %edi,%ebx
80101a39:	39 d9                	cmp    %ebx,%ecx
80101a3b:	0f 46 d9             	cmovbe %ecx,%ebx
80101a3e:	53                   	push   %ebx
80101a3f:	50                   	push   %eax
80101a40:	01 df                	add    %ebx,%edi
80101a42:	ff 75 e0             	pushl  -0x20(%ebp)
80101a45:	01 de                	add    %ebx,%esi
80101a47:	e8 e4 2c 00 00       	call   80104730 <memmove>
80101a4c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a4f:	89 14 24             	mov    %edx,(%esp)
80101a52:	e8 89 e7 ff ff       	call   801001e0 <brelse>
80101a57:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a5a:	83 c4 10             	add    $0x10,%esp
80101a5d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a60:	77 9e                	ja     80101a00 <readi+0x60>
80101a62:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101a65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a68:	5b                   	pop    %ebx
80101a69:	5e                   	pop    %esi
80101a6a:	5f                   	pop    %edi
80101a6b:	5d                   	pop    %ebp
80101a6c:	c3                   	ret    
80101a6d:	8d 76 00             	lea    0x0(%esi),%esi
80101a70:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a74:	66 83 f8 09          	cmp    $0x9,%ax
80101a78:	77 17                	ja     80101a91 <readi+0xf1>
80101a7a:	8b 04 c5 40 13 11 80 	mov    -0x7feeecc0(,%eax,8),%eax
80101a81:	85 c0                	test   %eax,%eax
80101a83:	74 0c                	je     80101a91 <readi+0xf1>
80101a85:	89 7d 10             	mov    %edi,0x10(%ebp)
80101a88:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a8b:	5b                   	pop    %ebx
80101a8c:	5e                   	pop    %esi
80101a8d:	5f                   	pop    %edi
80101a8e:	5d                   	pop    %ebp
80101a8f:	ff e0                	jmp    *%eax
80101a91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a96:	eb cd                	jmp    80101a65 <readi+0xc5>
80101a98:	90                   	nop
80101a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101aa0 <writei>:
80101aa0:	55                   	push   %ebp
80101aa1:	89 e5                	mov    %esp,%ebp
80101aa3:	57                   	push   %edi
80101aa4:	56                   	push   %esi
80101aa5:	53                   	push   %ebx
80101aa6:	83 ec 1c             	sub    $0x1c,%esp
80101aa9:	8b 45 08             	mov    0x8(%ebp),%eax
80101aac:	8b 75 0c             	mov    0xc(%ebp),%esi
80101aaf:	8b 7d 14             	mov    0x14(%ebp),%edi
80101ab2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101ab7:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101aba:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101abd:	8b 75 10             	mov    0x10(%ebp),%esi
80101ac0:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101ac3:	0f 84 b7 00 00 00    	je     80101b80 <writei+0xe0>
80101ac9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101acc:	39 70 58             	cmp    %esi,0x58(%eax)
80101acf:	0f 82 eb 00 00 00    	jb     80101bc0 <writei+0x120>
80101ad5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101ad8:	31 d2                	xor    %edx,%edx
80101ada:	89 f8                	mov    %edi,%eax
80101adc:	01 f0                	add    %esi,%eax
80101ade:	0f 92 c2             	setb   %dl
80101ae1:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101ae6:	0f 87 d4 00 00 00    	ja     80101bc0 <writei+0x120>
80101aec:	85 d2                	test   %edx,%edx
80101aee:	0f 85 cc 00 00 00    	jne    80101bc0 <writei+0x120>
80101af4:	85 ff                	test   %edi,%edi
80101af6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101afd:	74 72                	je     80101b71 <writei+0xd1>
80101aff:	90                   	nop
80101b00:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101b03:	89 f2                	mov    %esi,%edx
80101b05:	c1 ea 09             	shr    $0x9,%edx
80101b08:	89 f8                	mov    %edi,%eax
80101b0a:	e8 91 f8 ff ff       	call   801013a0 <bmap>
80101b0f:	83 ec 08             	sub    $0x8,%esp
80101b12:	50                   	push   %eax
80101b13:	ff 37                	pushl  (%edi)
80101b15:	e8 b6 e5 ff ff       	call   801000d0 <bread>
80101b1a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101b1d:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
80101b20:	89 c7                	mov    %eax,%edi
80101b22:	89 f0                	mov    %esi,%eax
80101b24:	b9 00 02 00 00       	mov    $0x200,%ecx
80101b29:	83 c4 0c             	add    $0xc,%esp
80101b2c:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b31:	29 c1                	sub    %eax,%ecx
80101b33:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
80101b37:	39 d9                	cmp    %ebx,%ecx
80101b39:	0f 46 d9             	cmovbe %ecx,%ebx
80101b3c:	53                   	push   %ebx
80101b3d:	ff 75 dc             	pushl  -0x24(%ebp)
80101b40:	01 de                	add    %ebx,%esi
80101b42:	50                   	push   %eax
80101b43:	e8 e8 2b 00 00       	call   80104730 <memmove>
80101b48:	89 3c 24             	mov    %edi,(%esp)
80101b4b:	e8 b0 12 00 00       	call   80102e00 <log_write>
80101b50:	89 3c 24             	mov    %edi,(%esp)
80101b53:	e8 88 e6 ff ff       	call   801001e0 <brelse>
80101b58:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b5b:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b5e:	83 c4 10             	add    $0x10,%esp
80101b61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b64:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b67:	77 97                	ja     80101b00 <writei+0x60>
80101b69:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b6c:	3b 70 58             	cmp    0x58(%eax),%esi
80101b6f:	77 37                	ja     80101ba8 <writei+0x108>
80101b71:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b74:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b77:	5b                   	pop    %ebx
80101b78:	5e                   	pop    %esi
80101b79:	5f                   	pop    %edi
80101b7a:	5d                   	pop    %ebp
80101b7b:	c3                   	ret    
80101b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b80:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b84:	66 83 f8 09          	cmp    $0x9,%ax
80101b88:	77 36                	ja     80101bc0 <writei+0x120>
80101b8a:	8b 04 c5 44 13 11 80 	mov    -0x7feeecbc(,%eax,8),%eax
80101b91:	85 c0                	test   %eax,%eax
80101b93:	74 2b                	je     80101bc0 <writei+0x120>
80101b95:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b98:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b9b:	5b                   	pop    %ebx
80101b9c:	5e                   	pop    %esi
80101b9d:	5f                   	pop    %edi
80101b9e:	5d                   	pop    %ebp
80101b9f:	ff e0                	jmp    *%eax
80101ba1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ba8:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101bab:	83 ec 0c             	sub    $0xc,%esp
80101bae:	89 70 58             	mov    %esi,0x58(%eax)
80101bb1:	50                   	push   %eax
80101bb2:	e8 59 fa ff ff       	call   80101610 <iupdate>
80101bb7:	83 c4 10             	add    $0x10,%esp
80101bba:	eb b5                	jmp    80101b71 <writei+0xd1>
80101bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101bc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101bc5:	eb ad                	jmp    80101b74 <writei+0xd4>
80101bc7:	89 f6                	mov    %esi,%esi
80101bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bd0 <namecmp>:
80101bd0:	55                   	push   %ebp
80101bd1:	89 e5                	mov    %esp,%ebp
80101bd3:	83 ec 0c             	sub    $0xc,%esp
80101bd6:	6a 0e                	push   $0xe
80101bd8:	ff 75 0c             	pushl  0xc(%ebp)
80101bdb:	ff 75 08             	pushl  0x8(%ebp)
80101bde:	e8 bd 2b 00 00       	call   801047a0 <strncmp>
80101be3:	c9                   	leave  
80101be4:	c3                   	ret    
80101be5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bf0 <dirlookup>:
80101bf0:	55                   	push   %ebp
80101bf1:	89 e5                	mov    %esp,%ebp
80101bf3:	57                   	push   %edi
80101bf4:	56                   	push   %esi
80101bf5:	53                   	push   %ebx
80101bf6:	83 ec 1c             	sub    $0x1c,%esp
80101bf9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101bfc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101c01:	0f 85 85 00 00 00    	jne    80101c8c <dirlookup+0x9c>
80101c07:	8b 53 58             	mov    0x58(%ebx),%edx
80101c0a:	31 ff                	xor    %edi,%edi
80101c0c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101c0f:	85 d2                	test   %edx,%edx
80101c11:	74 3e                	je     80101c51 <dirlookup+0x61>
80101c13:	90                   	nop
80101c14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c18:	6a 10                	push   $0x10
80101c1a:	57                   	push   %edi
80101c1b:	56                   	push   %esi
80101c1c:	53                   	push   %ebx
80101c1d:	e8 7e fd ff ff       	call   801019a0 <readi>
80101c22:	83 c4 10             	add    $0x10,%esp
80101c25:	83 f8 10             	cmp    $0x10,%eax
80101c28:	75 55                	jne    80101c7f <dirlookup+0x8f>
80101c2a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101c2f:	74 18                	je     80101c49 <dirlookup+0x59>
80101c31:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c34:	83 ec 04             	sub    $0x4,%esp
80101c37:	6a 0e                	push   $0xe
80101c39:	50                   	push   %eax
80101c3a:	ff 75 0c             	pushl  0xc(%ebp)
80101c3d:	e8 5e 2b 00 00       	call   801047a0 <strncmp>
80101c42:	83 c4 10             	add    $0x10,%esp
80101c45:	85 c0                	test   %eax,%eax
80101c47:	74 17                	je     80101c60 <dirlookup+0x70>
80101c49:	83 c7 10             	add    $0x10,%edi
80101c4c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101c4f:	72 c7                	jb     80101c18 <dirlookup+0x28>
80101c51:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c54:	31 c0                	xor    %eax,%eax
80101c56:	5b                   	pop    %ebx
80101c57:	5e                   	pop    %esi
80101c58:	5f                   	pop    %edi
80101c59:	5d                   	pop    %ebp
80101c5a:	c3                   	ret    
80101c5b:	90                   	nop
80101c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c60:	8b 45 10             	mov    0x10(%ebp),%eax
80101c63:	85 c0                	test   %eax,%eax
80101c65:	74 05                	je     80101c6c <dirlookup+0x7c>
80101c67:	8b 45 10             	mov    0x10(%ebp),%eax
80101c6a:	89 38                	mov    %edi,(%eax)
80101c6c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c70:	8b 03                	mov    (%ebx),%eax
80101c72:	e8 59 f6 ff ff       	call   801012d0 <iget>
80101c77:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c7a:	5b                   	pop    %ebx
80101c7b:	5e                   	pop    %esi
80101c7c:	5f                   	pop    %edi
80101c7d:	5d                   	pop    %ebp
80101c7e:	c3                   	ret    
80101c7f:	83 ec 0c             	sub    $0xc,%esp
80101c82:	68 59 76 10 80       	push   $0x80107659
80101c87:	e8 04 e7 ff ff       	call   80100390 <panic>
80101c8c:	83 ec 0c             	sub    $0xc,%esp
80101c8f:	68 47 76 10 80       	push   $0x80107647
80101c94:	e8 f7 e6 ff ff       	call   80100390 <panic>
80101c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101ca0 <namex>:
80101ca0:	55                   	push   %ebp
80101ca1:	89 e5                	mov    %esp,%ebp
80101ca3:	57                   	push   %edi
80101ca4:	56                   	push   %esi
80101ca5:	53                   	push   %ebx
80101ca6:	89 cf                	mov    %ecx,%edi
80101ca8:	89 c3                	mov    %eax,%ebx
80101caa:	83 ec 1c             	sub    $0x1c,%esp
80101cad:	80 38 2f             	cmpb   $0x2f,(%eax)
80101cb0:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101cb3:	0f 84 67 01 00 00    	je     80101e20 <namex+0x180>
80101cb9:	e8 e2 1b 00 00       	call   801038a0 <myproc>
80101cbe:	83 ec 0c             	sub    $0xc,%esp
80101cc1:	8b 70 6c             	mov    0x6c(%eax),%esi
80101cc4:	68 c0 13 11 80       	push   $0x801113c0
80101cc9:	e8 a2 28 00 00       	call   80104570 <acquire>
80101cce:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101cd2:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
80101cd9:	e8 52 29 00 00       	call   80104630 <release>
80101cde:	83 c4 10             	add    $0x10,%esp
80101ce1:	eb 08                	jmp    80101ceb <namex+0x4b>
80101ce3:	90                   	nop
80101ce4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ce8:	83 c3 01             	add    $0x1,%ebx
80101ceb:	0f b6 03             	movzbl (%ebx),%eax
80101cee:	3c 2f                	cmp    $0x2f,%al
80101cf0:	74 f6                	je     80101ce8 <namex+0x48>
80101cf2:	84 c0                	test   %al,%al
80101cf4:	0f 84 ee 00 00 00    	je     80101de8 <namex+0x148>
80101cfa:	0f b6 03             	movzbl (%ebx),%eax
80101cfd:	3c 2f                	cmp    $0x2f,%al
80101cff:	0f 84 b3 00 00 00    	je     80101db8 <namex+0x118>
80101d05:	84 c0                	test   %al,%al
80101d07:	89 da                	mov    %ebx,%edx
80101d09:	75 09                	jne    80101d14 <namex+0x74>
80101d0b:	e9 a8 00 00 00       	jmp    80101db8 <namex+0x118>
80101d10:	84 c0                	test   %al,%al
80101d12:	74 0a                	je     80101d1e <namex+0x7e>
80101d14:	83 c2 01             	add    $0x1,%edx
80101d17:	0f b6 02             	movzbl (%edx),%eax
80101d1a:	3c 2f                	cmp    $0x2f,%al
80101d1c:	75 f2                	jne    80101d10 <namex+0x70>
80101d1e:	89 d1                	mov    %edx,%ecx
80101d20:	29 d9                	sub    %ebx,%ecx
80101d22:	83 f9 0d             	cmp    $0xd,%ecx
80101d25:	0f 8e 91 00 00 00    	jle    80101dbc <namex+0x11c>
80101d2b:	83 ec 04             	sub    $0x4,%esp
80101d2e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d31:	6a 0e                	push   $0xe
80101d33:	53                   	push   %ebx
80101d34:	57                   	push   %edi
80101d35:	e8 f6 29 00 00       	call   80104730 <memmove>
80101d3a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d3d:	83 c4 10             	add    $0x10,%esp
80101d40:	89 d3                	mov    %edx,%ebx
80101d42:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d45:	75 11                	jne    80101d58 <namex+0xb8>
80101d47:	89 f6                	mov    %esi,%esi
80101d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101d50:	83 c3 01             	add    $0x1,%ebx
80101d53:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d56:	74 f8                	je     80101d50 <namex+0xb0>
80101d58:	83 ec 0c             	sub    $0xc,%esp
80101d5b:	56                   	push   %esi
80101d5c:	e8 5f f9 ff ff       	call   801016c0 <ilock>
80101d61:	83 c4 10             	add    $0x10,%esp
80101d64:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d69:	0f 85 91 00 00 00    	jne    80101e00 <namex+0x160>
80101d6f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d72:	85 d2                	test   %edx,%edx
80101d74:	74 09                	je     80101d7f <namex+0xdf>
80101d76:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d79:	0f 84 b7 00 00 00    	je     80101e36 <namex+0x196>
80101d7f:	83 ec 04             	sub    $0x4,%esp
80101d82:	6a 00                	push   $0x0
80101d84:	57                   	push   %edi
80101d85:	56                   	push   %esi
80101d86:	e8 65 fe ff ff       	call   80101bf0 <dirlookup>
80101d8b:	83 c4 10             	add    $0x10,%esp
80101d8e:	85 c0                	test   %eax,%eax
80101d90:	74 6e                	je     80101e00 <namex+0x160>
80101d92:	83 ec 0c             	sub    $0xc,%esp
80101d95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d98:	56                   	push   %esi
80101d99:	e8 02 fa ff ff       	call   801017a0 <iunlock>
80101d9e:	89 34 24             	mov    %esi,(%esp)
80101da1:	e8 4a fa ff ff       	call   801017f0 <iput>
80101da6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101da9:	83 c4 10             	add    $0x10,%esp
80101dac:	89 c6                	mov    %eax,%esi
80101dae:	e9 38 ff ff ff       	jmp    80101ceb <namex+0x4b>
80101db3:	90                   	nop
80101db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101db8:	89 da                	mov    %ebx,%edx
80101dba:	31 c9                	xor    %ecx,%ecx
80101dbc:	83 ec 04             	sub    $0x4,%esp
80101dbf:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101dc2:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101dc5:	51                   	push   %ecx
80101dc6:	53                   	push   %ebx
80101dc7:	57                   	push   %edi
80101dc8:	e8 63 29 00 00       	call   80104730 <memmove>
80101dcd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101dd0:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101dd3:	83 c4 10             	add    $0x10,%esp
80101dd6:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101dda:	89 d3                	mov    %edx,%ebx
80101ddc:	e9 61 ff ff ff       	jmp    80101d42 <namex+0xa2>
80101de1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101de8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101deb:	85 c0                	test   %eax,%eax
80101ded:	75 5d                	jne    80101e4c <namex+0x1ac>
80101def:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101df2:	89 f0                	mov    %esi,%eax
80101df4:	5b                   	pop    %ebx
80101df5:	5e                   	pop    %esi
80101df6:	5f                   	pop    %edi
80101df7:	5d                   	pop    %ebp
80101df8:	c3                   	ret    
80101df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e00:	83 ec 0c             	sub    $0xc,%esp
80101e03:	56                   	push   %esi
80101e04:	e8 97 f9 ff ff       	call   801017a0 <iunlock>
80101e09:	89 34 24             	mov    %esi,(%esp)
80101e0c:	31 f6                	xor    %esi,%esi
80101e0e:	e8 dd f9 ff ff       	call   801017f0 <iput>
80101e13:	83 c4 10             	add    $0x10,%esp
80101e16:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e19:	89 f0                	mov    %esi,%eax
80101e1b:	5b                   	pop    %ebx
80101e1c:	5e                   	pop    %esi
80101e1d:	5f                   	pop    %edi
80101e1e:	5d                   	pop    %ebp
80101e1f:	c3                   	ret    
80101e20:	ba 01 00 00 00       	mov    $0x1,%edx
80101e25:	b8 01 00 00 00       	mov    $0x1,%eax
80101e2a:	e8 a1 f4 ff ff       	call   801012d0 <iget>
80101e2f:	89 c6                	mov    %eax,%esi
80101e31:	e9 b5 fe ff ff       	jmp    80101ceb <namex+0x4b>
80101e36:	83 ec 0c             	sub    $0xc,%esp
80101e39:	56                   	push   %esi
80101e3a:	e8 61 f9 ff ff       	call   801017a0 <iunlock>
80101e3f:	83 c4 10             	add    $0x10,%esp
80101e42:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e45:	89 f0                	mov    %esi,%eax
80101e47:	5b                   	pop    %ebx
80101e48:	5e                   	pop    %esi
80101e49:	5f                   	pop    %edi
80101e4a:	5d                   	pop    %ebp
80101e4b:	c3                   	ret    
80101e4c:	83 ec 0c             	sub    $0xc,%esp
80101e4f:	56                   	push   %esi
80101e50:	31 f6                	xor    %esi,%esi
80101e52:	e8 99 f9 ff ff       	call   801017f0 <iput>
80101e57:	83 c4 10             	add    $0x10,%esp
80101e5a:	eb 93                	jmp    80101def <namex+0x14f>
80101e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101e60 <dirlink>:
80101e60:	55                   	push   %ebp
80101e61:	89 e5                	mov    %esp,%ebp
80101e63:	57                   	push   %edi
80101e64:	56                   	push   %esi
80101e65:	53                   	push   %ebx
80101e66:	83 ec 20             	sub    $0x20,%esp
80101e69:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101e6c:	6a 00                	push   $0x0
80101e6e:	ff 75 0c             	pushl  0xc(%ebp)
80101e71:	53                   	push   %ebx
80101e72:	e8 79 fd ff ff       	call   80101bf0 <dirlookup>
80101e77:	83 c4 10             	add    $0x10,%esp
80101e7a:	85 c0                	test   %eax,%eax
80101e7c:	75 67                	jne    80101ee5 <dirlink+0x85>
80101e7e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e81:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e84:	85 ff                	test   %edi,%edi
80101e86:	74 29                	je     80101eb1 <dirlink+0x51>
80101e88:	31 ff                	xor    %edi,%edi
80101e8a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e8d:	eb 09                	jmp    80101e98 <dirlink+0x38>
80101e8f:	90                   	nop
80101e90:	83 c7 10             	add    $0x10,%edi
80101e93:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101e96:	73 19                	jae    80101eb1 <dirlink+0x51>
80101e98:	6a 10                	push   $0x10
80101e9a:	57                   	push   %edi
80101e9b:	56                   	push   %esi
80101e9c:	53                   	push   %ebx
80101e9d:	e8 fe fa ff ff       	call   801019a0 <readi>
80101ea2:	83 c4 10             	add    $0x10,%esp
80101ea5:	83 f8 10             	cmp    $0x10,%eax
80101ea8:	75 4e                	jne    80101ef8 <dirlink+0x98>
80101eaa:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101eaf:	75 df                	jne    80101e90 <dirlink+0x30>
80101eb1:	8d 45 da             	lea    -0x26(%ebp),%eax
80101eb4:	83 ec 04             	sub    $0x4,%esp
80101eb7:	6a 0e                	push   $0xe
80101eb9:	ff 75 0c             	pushl  0xc(%ebp)
80101ebc:	50                   	push   %eax
80101ebd:	e8 3e 29 00 00       	call   80104800 <strncpy>
80101ec2:	8b 45 10             	mov    0x10(%ebp),%eax
80101ec5:	6a 10                	push   $0x10
80101ec7:	57                   	push   %edi
80101ec8:	56                   	push   %esi
80101ec9:	53                   	push   %ebx
80101eca:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101ece:	e8 cd fb ff ff       	call   80101aa0 <writei>
80101ed3:	83 c4 20             	add    $0x20,%esp
80101ed6:	83 f8 10             	cmp    $0x10,%eax
80101ed9:	75 2a                	jne    80101f05 <dirlink+0xa5>
80101edb:	31 c0                	xor    %eax,%eax
80101edd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ee0:	5b                   	pop    %ebx
80101ee1:	5e                   	pop    %esi
80101ee2:	5f                   	pop    %edi
80101ee3:	5d                   	pop    %ebp
80101ee4:	c3                   	ret    
80101ee5:	83 ec 0c             	sub    $0xc,%esp
80101ee8:	50                   	push   %eax
80101ee9:	e8 02 f9 ff ff       	call   801017f0 <iput>
80101eee:	83 c4 10             	add    $0x10,%esp
80101ef1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ef6:	eb e5                	jmp    80101edd <dirlink+0x7d>
80101ef8:	83 ec 0c             	sub    $0xc,%esp
80101efb:	68 68 76 10 80       	push   $0x80107668
80101f00:	e8 8b e4 ff ff       	call   80100390 <panic>
80101f05:	83 ec 0c             	sub    $0xc,%esp
80101f08:	68 66 7c 10 80       	push   $0x80107c66
80101f0d:	e8 7e e4 ff ff       	call   80100390 <panic>
80101f12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f20 <namei>:
80101f20:	55                   	push   %ebp
80101f21:	31 d2                	xor    %edx,%edx
80101f23:	89 e5                	mov    %esp,%ebp
80101f25:	83 ec 18             	sub    $0x18,%esp
80101f28:	8b 45 08             	mov    0x8(%ebp),%eax
80101f2b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101f2e:	e8 6d fd ff ff       	call   80101ca0 <namex>
80101f33:	c9                   	leave  
80101f34:	c3                   	ret    
80101f35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f40 <nameiparent>:
80101f40:	55                   	push   %ebp
80101f41:	ba 01 00 00 00       	mov    $0x1,%edx
80101f46:	89 e5                	mov    %esp,%ebp
80101f48:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f4b:	8b 45 08             	mov    0x8(%ebp),%eax
80101f4e:	5d                   	pop    %ebp
80101f4f:	e9 4c fd ff ff       	jmp    80101ca0 <namex>
80101f54:	66 90                	xchg   %ax,%ax
80101f56:	66 90                	xchg   %ax,%ax
80101f58:	66 90                	xchg   %ax,%ax
80101f5a:	66 90                	xchg   %ax,%ax
80101f5c:	66 90                	xchg   %ax,%ax
80101f5e:	66 90                	xchg   %ax,%ax

80101f60 <idestart>:
80101f60:	55                   	push   %ebp
80101f61:	89 e5                	mov    %esp,%ebp
80101f63:	57                   	push   %edi
80101f64:	56                   	push   %esi
80101f65:	53                   	push   %ebx
80101f66:	83 ec 0c             	sub    $0xc,%esp
80101f69:	85 c0                	test   %eax,%eax
80101f6b:	0f 84 b4 00 00 00    	je     80102025 <idestart+0xc5>
80101f71:	8b 58 08             	mov    0x8(%eax),%ebx
80101f74:	89 c6                	mov    %eax,%esi
80101f76:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f7c:	0f 87 96 00 00 00    	ja     80102018 <idestart+0xb8>
80101f82:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101f87:	89 f6                	mov    %esi,%esi
80101f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101f90:	89 ca                	mov    %ecx,%edx
80101f92:	ec                   	in     (%dx),%al
80101f93:	83 e0 c0             	and    $0xffffffc0,%eax
80101f96:	3c 40                	cmp    $0x40,%al
80101f98:	75 f6                	jne    80101f90 <idestart+0x30>
80101f9a:	31 ff                	xor    %edi,%edi
80101f9c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101fa1:	89 f8                	mov    %edi,%eax
80101fa3:	ee                   	out    %al,(%dx)
80101fa4:	b8 01 00 00 00       	mov    $0x1,%eax
80101fa9:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101fae:	ee                   	out    %al,(%dx)
80101faf:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101fb4:	89 d8                	mov    %ebx,%eax
80101fb6:	ee                   	out    %al,(%dx)
80101fb7:	89 d8                	mov    %ebx,%eax
80101fb9:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101fbe:	c1 f8 08             	sar    $0x8,%eax
80101fc1:	ee                   	out    %al,(%dx)
80101fc2:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101fc7:	89 f8                	mov    %edi,%eax
80101fc9:	ee                   	out    %al,(%dx)
80101fca:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101fce:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fd3:	c1 e0 04             	shl    $0x4,%eax
80101fd6:	83 e0 10             	and    $0x10,%eax
80101fd9:	83 c8 e0             	or     $0xffffffe0,%eax
80101fdc:	ee                   	out    %al,(%dx)
80101fdd:	f6 06 04             	testb  $0x4,(%esi)
80101fe0:	75 16                	jne    80101ff8 <idestart+0x98>
80101fe2:	b8 20 00 00 00       	mov    $0x20,%eax
80101fe7:	89 ca                	mov    %ecx,%edx
80101fe9:	ee                   	out    %al,(%dx)
80101fea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fed:	5b                   	pop    %ebx
80101fee:	5e                   	pop    %esi
80101fef:	5f                   	pop    %edi
80101ff0:	5d                   	pop    %ebp
80101ff1:	c3                   	ret    
80101ff2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101ff8:	b8 30 00 00 00       	mov    $0x30,%eax
80101ffd:	89 ca                	mov    %ecx,%edx
80101fff:	ee                   	out    %al,(%dx)
80102000:	b9 80 00 00 00       	mov    $0x80,%ecx
80102005:	83 c6 5c             	add    $0x5c,%esi
80102008:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010200d:	fc                   	cld    
8010200e:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80102010:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102013:	5b                   	pop    %ebx
80102014:	5e                   	pop    %esi
80102015:	5f                   	pop    %edi
80102016:	5d                   	pop    %ebp
80102017:	c3                   	ret    
80102018:	83 ec 0c             	sub    $0xc,%esp
8010201b:	68 d4 76 10 80       	push   $0x801076d4
80102020:	e8 6b e3 ff ff       	call   80100390 <panic>
80102025:	83 ec 0c             	sub    $0xc,%esp
80102028:	68 cb 76 10 80       	push   $0x801076cb
8010202d:	e8 5e e3 ff ff       	call   80100390 <panic>
80102032:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102040 <ideinit>:
80102040:	55                   	push   %ebp
80102041:	89 e5                	mov    %esp,%ebp
80102043:	83 ec 10             	sub    $0x10,%esp
80102046:	68 e6 76 10 80       	push   $0x801076e6
8010204b:	68 80 a5 10 80       	push   $0x8010a580
80102050:	e8 db 23 00 00       	call   80104430 <initlock>
80102055:	58                   	pop    %eax
80102056:	a1 e0 36 11 80       	mov    0x801136e0,%eax
8010205b:	5a                   	pop    %edx
8010205c:	83 e8 01             	sub    $0x1,%eax
8010205f:	50                   	push   %eax
80102060:	6a 0e                	push   $0xe
80102062:	e8 a9 02 00 00       	call   80102310 <ioapicenable>
80102067:	83 c4 10             	add    $0x10,%esp
8010206a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010206f:	90                   	nop
80102070:	ec                   	in     (%dx),%al
80102071:	83 e0 c0             	and    $0xffffffc0,%eax
80102074:	3c 40                	cmp    $0x40,%al
80102076:	75 f8                	jne    80102070 <ideinit+0x30>
80102078:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010207d:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102082:	ee                   	out    %al,(%dx)
80102083:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102088:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010208d:	eb 06                	jmp    80102095 <ideinit+0x55>
8010208f:	90                   	nop
80102090:	83 e9 01             	sub    $0x1,%ecx
80102093:	74 0f                	je     801020a4 <ideinit+0x64>
80102095:	ec                   	in     (%dx),%al
80102096:	84 c0                	test   %al,%al
80102098:	74 f6                	je     80102090 <ideinit+0x50>
8010209a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
801020a1:	00 00 00 
801020a4:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
801020a9:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020ae:	ee                   	out    %al,(%dx)
801020af:	c9                   	leave  
801020b0:	c3                   	ret    
801020b1:	eb 0d                	jmp    801020c0 <ideintr>
801020b3:	90                   	nop
801020b4:	90                   	nop
801020b5:	90                   	nop
801020b6:	90                   	nop
801020b7:	90                   	nop
801020b8:	90                   	nop
801020b9:	90                   	nop
801020ba:	90                   	nop
801020bb:	90                   	nop
801020bc:	90                   	nop
801020bd:	90                   	nop
801020be:	90                   	nop
801020bf:	90                   	nop

801020c0 <ideintr>:
801020c0:	55                   	push   %ebp
801020c1:	89 e5                	mov    %esp,%ebp
801020c3:	57                   	push   %edi
801020c4:	56                   	push   %esi
801020c5:	53                   	push   %ebx
801020c6:	83 ec 18             	sub    $0x18,%esp
801020c9:	68 80 a5 10 80       	push   $0x8010a580
801020ce:	e8 9d 24 00 00       	call   80104570 <acquire>
801020d3:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
801020d9:	83 c4 10             	add    $0x10,%esp
801020dc:	85 db                	test   %ebx,%ebx
801020de:	74 67                	je     80102147 <ideintr+0x87>
801020e0:	8b 43 58             	mov    0x58(%ebx),%eax
801020e3:	a3 64 a5 10 80       	mov    %eax,0x8010a564
801020e8:	8b 3b                	mov    (%ebx),%edi
801020ea:	f7 c7 04 00 00 00    	test   $0x4,%edi
801020f0:	75 31                	jne    80102123 <ideintr+0x63>
801020f2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020f7:	89 f6                	mov    %esi,%esi
801020f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102100:	ec                   	in     (%dx),%al
80102101:	89 c6                	mov    %eax,%esi
80102103:	83 e6 c0             	and    $0xffffffc0,%esi
80102106:	89 f1                	mov    %esi,%ecx
80102108:	80 f9 40             	cmp    $0x40,%cl
8010210b:	75 f3                	jne    80102100 <ideintr+0x40>
8010210d:	a8 21                	test   $0x21,%al
8010210f:	75 12                	jne    80102123 <ideintr+0x63>
80102111:	8d 7b 5c             	lea    0x5c(%ebx),%edi
80102114:	b9 80 00 00 00       	mov    $0x80,%ecx
80102119:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010211e:	fc                   	cld    
8010211f:	f3 6d                	rep insl (%dx),%es:(%edi)
80102121:	8b 3b                	mov    (%ebx),%edi
80102123:	83 e7 fb             	and    $0xfffffffb,%edi
80102126:	83 ec 0c             	sub    $0xc,%esp
80102129:	89 f9                	mov    %edi,%ecx
8010212b:	83 c9 02             	or     $0x2,%ecx
8010212e:	89 0b                	mov    %ecx,(%ebx)
80102130:	53                   	push   %ebx
80102131:	e8 4a 1f 00 00       	call   80104080 <wakeup>
80102136:	a1 64 a5 10 80       	mov    0x8010a564,%eax
8010213b:	83 c4 10             	add    $0x10,%esp
8010213e:	85 c0                	test   %eax,%eax
80102140:	74 05                	je     80102147 <ideintr+0x87>
80102142:	e8 19 fe ff ff       	call   80101f60 <idestart>
80102147:	83 ec 0c             	sub    $0xc,%esp
8010214a:	68 80 a5 10 80       	push   $0x8010a580
8010214f:	e8 dc 24 00 00       	call   80104630 <release>
80102154:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102157:	5b                   	pop    %ebx
80102158:	5e                   	pop    %esi
80102159:	5f                   	pop    %edi
8010215a:	5d                   	pop    %ebp
8010215b:	c3                   	ret    
8010215c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102160 <iderw>:
80102160:	55                   	push   %ebp
80102161:	89 e5                	mov    %esp,%ebp
80102163:	53                   	push   %ebx
80102164:	83 ec 10             	sub    $0x10,%esp
80102167:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010216a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010216d:	50                   	push   %eax
8010216e:	e8 6d 22 00 00       	call   801043e0 <holdingsleep>
80102173:	83 c4 10             	add    $0x10,%esp
80102176:	85 c0                	test   %eax,%eax
80102178:	0f 84 c6 00 00 00    	je     80102244 <iderw+0xe4>
8010217e:	8b 03                	mov    (%ebx),%eax
80102180:	83 e0 06             	and    $0x6,%eax
80102183:	83 f8 02             	cmp    $0x2,%eax
80102186:	0f 84 ab 00 00 00    	je     80102237 <iderw+0xd7>
8010218c:	8b 53 04             	mov    0x4(%ebx),%edx
8010218f:	85 d2                	test   %edx,%edx
80102191:	74 0d                	je     801021a0 <iderw+0x40>
80102193:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102198:	85 c0                	test   %eax,%eax
8010219a:	0f 84 b1 00 00 00    	je     80102251 <iderw+0xf1>
801021a0:	83 ec 0c             	sub    $0xc,%esp
801021a3:	68 80 a5 10 80       	push   $0x8010a580
801021a8:	e8 c3 23 00 00       	call   80104570 <acquire>
801021ad:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
801021b3:	83 c4 10             	add    $0x10,%esp
801021b6:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
801021bd:	85 d2                	test   %edx,%edx
801021bf:	75 09                	jne    801021ca <iderw+0x6a>
801021c1:	eb 6d                	jmp    80102230 <iderw+0xd0>
801021c3:	90                   	nop
801021c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801021c8:	89 c2                	mov    %eax,%edx
801021ca:	8b 42 58             	mov    0x58(%edx),%eax
801021cd:	85 c0                	test   %eax,%eax
801021cf:	75 f7                	jne    801021c8 <iderw+0x68>
801021d1:	83 c2 58             	add    $0x58,%edx
801021d4:	89 1a                	mov    %ebx,(%edx)
801021d6:	39 1d 64 a5 10 80    	cmp    %ebx,0x8010a564
801021dc:	74 42                	je     80102220 <iderw+0xc0>
801021de:	8b 03                	mov    (%ebx),%eax
801021e0:	83 e0 06             	and    $0x6,%eax
801021e3:	83 f8 02             	cmp    $0x2,%eax
801021e6:	74 23                	je     8010220b <iderw+0xab>
801021e8:	90                   	nop
801021e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021f0:	83 ec 08             	sub    $0x8,%esp
801021f3:	68 80 a5 10 80       	push   $0x8010a580
801021f8:	53                   	push   %ebx
801021f9:	e8 c2 1c 00 00       	call   80103ec0 <sleep>
801021fe:	8b 03                	mov    (%ebx),%eax
80102200:	83 c4 10             	add    $0x10,%esp
80102203:	83 e0 06             	and    $0x6,%eax
80102206:	83 f8 02             	cmp    $0x2,%eax
80102209:	75 e5                	jne    801021f0 <iderw+0x90>
8010220b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
80102212:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102215:	c9                   	leave  
80102216:	e9 15 24 00 00       	jmp    80104630 <release>
8010221b:	90                   	nop
8010221c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102220:	89 d8                	mov    %ebx,%eax
80102222:	e8 39 fd ff ff       	call   80101f60 <idestart>
80102227:	eb b5                	jmp    801021de <iderw+0x7e>
80102229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102230:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102235:	eb 9d                	jmp    801021d4 <iderw+0x74>
80102237:	83 ec 0c             	sub    $0xc,%esp
8010223a:	68 00 77 10 80       	push   $0x80107700
8010223f:	e8 4c e1 ff ff       	call   80100390 <panic>
80102244:	83 ec 0c             	sub    $0xc,%esp
80102247:	68 ea 76 10 80       	push   $0x801076ea
8010224c:	e8 3f e1 ff ff       	call   80100390 <panic>
80102251:	83 ec 0c             	sub    $0xc,%esp
80102254:	68 15 77 10 80       	push   $0x80107715
80102259:	e8 32 e1 ff ff       	call   80100390 <panic>
8010225e:	66 90                	xchg   %ax,%ax

80102260 <ioapicinit>:
80102260:	55                   	push   %ebp
80102261:	c7 05 14 30 11 80 00 	movl   $0xfec00000,0x80113014
80102268:	00 c0 fe 
8010226b:	89 e5                	mov    %esp,%ebp
8010226d:	56                   	push   %esi
8010226e:	53                   	push   %ebx
8010226f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102276:	00 00 00 
80102279:	a1 14 30 11 80       	mov    0x80113014,%eax
8010227e:	8b 58 10             	mov    0x10(%eax),%ebx
80102281:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80102287:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
8010228d:	0f b6 15 40 31 11 80 	movzbl 0x80113140,%edx
80102294:	c1 eb 10             	shr    $0x10,%ebx
80102297:	8b 41 10             	mov    0x10(%ecx),%eax
8010229a:	0f b6 db             	movzbl %bl,%ebx
8010229d:	c1 e8 18             	shr    $0x18,%eax
801022a0:	39 c2                	cmp    %eax,%edx
801022a2:	74 16                	je     801022ba <ioapicinit+0x5a>
801022a4:	83 ec 0c             	sub    $0xc,%esp
801022a7:	68 34 77 10 80       	push   $0x80107734
801022ac:	e8 af e3 ff ff       	call   80100660 <cprintf>
801022b1:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
801022b7:	83 c4 10             	add    $0x10,%esp
801022ba:	83 c3 21             	add    $0x21,%ebx
801022bd:	ba 10 00 00 00       	mov    $0x10,%edx
801022c2:	b8 20 00 00 00       	mov    $0x20,%eax
801022c7:	89 f6                	mov    %esi,%esi
801022c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801022d0:	89 11                	mov    %edx,(%ecx)
801022d2:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
801022d8:	89 c6                	mov    %eax,%esi
801022da:	81 ce 00 00 01 00    	or     $0x10000,%esi
801022e0:	83 c0 01             	add    $0x1,%eax
801022e3:	89 71 10             	mov    %esi,0x10(%ecx)
801022e6:	8d 72 01             	lea    0x1(%edx),%esi
801022e9:	83 c2 02             	add    $0x2,%edx
801022ec:	39 d8                	cmp    %ebx,%eax
801022ee:	89 31                	mov    %esi,(%ecx)
801022f0:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
801022f6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
801022fd:	75 d1                	jne    801022d0 <ioapicinit+0x70>
801022ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102302:	5b                   	pop    %ebx
80102303:	5e                   	pop    %esi
80102304:	5d                   	pop    %ebp
80102305:	c3                   	ret    
80102306:	8d 76 00             	lea    0x0(%esi),%esi
80102309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102310 <ioapicenable>:
80102310:	55                   	push   %ebp
80102311:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
80102317:	89 e5                	mov    %esp,%ebp
80102319:	8b 45 08             	mov    0x8(%ebp),%eax
8010231c:	8d 50 20             	lea    0x20(%eax),%edx
8010231f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
80102323:	89 01                	mov    %eax,(%ecx)
80102325:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
8010232b:	83 c0 01             	add    $0x1,%eax
8010232e:	89 51 10             	mov    %edx,0x10(%ecx)
80102331:	8b 55 0c             	mov    0xc(%ebp),%edx
80102334:	89 01                	mov    %eax,(%ecx)
80102336:	a1 14 30 11 80       	mov    0x80113014,%eax
8010233b:	c1 e2 18             	shl    $0x18,%edx
8010233e:	89 50 10             	mov    %edx,0x10(%eax)
80102341:	5d                   	pop    %ebp
80102342:	c3                   	ret    
80102343:	66 90                	xchg   %ax,%ax
80102345:	66 90                	xchg   %ax,%ax
80102347:	66 90                	xchg   %ax,%ax
80102349:	66 90                	xchg   %ax,%ax
8010234b:	66 90                	xchg   %ax,%ax
8010234d:	66 90                	xchg   %ax,%ax
8010234f:	90                   	nop

80102350 <kfree>:
80102350:	55                   	push   %ebp
80102351:	89 e5                	mov    %esp,%ebp
80102353:	53                   	push   %ebx
80102354:	83 ec 04             	sub    $0x4,%esp
80102357:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010235a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102360:	75 70                	jne    801023d2 <kfree+0x82>
80102362:	81 fb 88 61 11 80    	cmp    $0x80116188,%ebx
80102368:	72 68                	jb     801023d2 <kfree+0x82>
8010236a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102370:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102375:	77 5b                	ja     801023d2 <kfree+0x82>
80102377:	83 ec 04             	sub    $0x4,%esp
8010237a:	68 00 10 00 00       	push   $0x1000
8010237f:	6a 01                	push   $0x1
80102381:	53                   	push   %ebx
80102382:	e8 f9 22 00 00       	call   80104680 <memset>
80102387:	8b 15 54 30 11 80    	mov    0x80113054,%edx
8010238d:	83 c4 10             	add    $0x10,%esp
80102390:	85 d2                	test   %edx,%edx
80102392:	75 2c                	jne    801023c0 <kfree+0x70>
80102394:	a1 58 30 11 80       	mov    0x80113058,%eax
80102399:	89 03                	mov    %eax,(%ebx)
8010239b:	a1 54 30 11 80       	mov    0x80113054,%eax
801023a0:	89 1d 58 30 11 80    	mov    %ebx,0x80113058
801023a6:	85 c0                	test   %eax,%eax
801023a8:	75 06                	jne    801023b0 <kfree+0x60>
801023aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801023ad:	c9                   	leave  
801023ae:	c3                   	ret    
801023af:	90                   	nop
801023b0:	c7 45 08 20 30 11 80 	movl   $0x80113020,0x8(%ebp)
801023b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801023ba:	c9                   	leave  
801023bb:	e9 70 22 00 00       	jmp    80104630 <release>
801023c0:	83 ec 0c             	sub    $0xc,%esp
801023c3:	68 20 30 11 80       	push   $0x80113020
801023c8:	e8 a3 21 00 00       	call   80104570 <acquire>
801023cd:	83 c4 10             	add    $0x10,%esp
801023d0:	eb c2                	jmp    80102394 <kfree+0x44>
801023d2:	83 ec 0c             	sub    $0xc,%esp
801023d5:	68 66 77 10 80       	push   $0x80107766
801023da:	e8 b1 df ff ff       	call   80100390 <panic>
801023df:	90                   	nop

801023e0 <freerange>:
801023e0:	55                   	push   %ebp
801023e1:	89 e5                	mov    %esp,%ebp
801023e3:	56                   	push   %esi
801023e4:	53                   	push   %ebx
801023e5:	8b 45 08             	mov    0x8(%ebp),%eax
801023e8:	8b 75 0c             	mov    0xc(%ebp),%esi
801023eb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023f1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023f7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023fd:	39 de                	cmp    %ebx,%esi
801023ff:	72 23                	jb     80102424 <freerange+0x44>
80102401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102408:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010240e:	83 ec 0c             	sub    $0xc,%esp
80102411:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102417:	50                   	push   %eax
80102418:	e8 33 ff ff ff       	call   80102350 <kfree>
8010241d:	83 c4 10             	add    $0x10,%esp
80102420:	39 f3                	cmp    %esi,%ebx
80102422:	76 e4                	jbe    80102408 <freerange+0x28>
80102424:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102427:	5b                   	pop    %ebx
80102428:	5e                   	pop    %esi
80102429:	5d                   	pop    %ebp
8010242a:	c3                   	ret    
8010242b:	90                   	nop
8010242c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102430 <kinit1>:
80102430:	55                   	push   %ebp
80102431:	89 e5                	mov    %esp,%ebp
80102433:	56                   	push   %esi
80102434:	53                   	push   %ebx
80102435:	8b 75 0c             	mov    0xc(%ebp),%esi
80102438:	83 ec 08             	sub    $0x8,%esp
8010243b:	68 6c 77 10 80       	push   $0x8010776c
80102440:	68 20 30 11 80       	push   $0x80113020
80102445:	e8 e6 1f 00 00       	call   80104430 <initlock>
8010244a:	8b 45 08             	mov    0x8(%ebp),%eax
8010244d:	83 c4 10             	add    $0x10,%esp
80102450:	c7 05 54 30 11 80 00 	movl   $0x0,0x80113054
80102457:	00 00 00 
8010245a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102460:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102466:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010246c:	39 de                	cmp    %ebx,%esi
8010246e:	72 1c                	jb     8010248c <kinit1+0x5c>
80102470:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102476:	83 ec 0c             	sub    $0xc,%esp
80102479:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010247f:	50                   	push   %eax
80102480:	e8 cb fe ff ff       	call   80102350 <kfree>
80102485:	83 c4 10             	add    $0x10,%esp
80102488:	39 de                	cmp    %ebx,%esi
8010248a:	73 e4                	jae    80102470 <kinit1+0x40>
8010248c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010248f:	5b                   	pop    %ebx
80102490:	5e                   	pop    %esi
80102491:	5d                   	pop    %ebp
80102492:	c3                   	ret    
80102493:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024a0 <kinit2>:
801024a0:	55                   	push   %ebp
801024a1:	89 e5                	mov    %esp,%ebp
801024a3:	56                   	push   %esi
801024a4:	53                   	push   %ebx
801024a5:	8b 45 08             	mov    0x8(%ebp),%eax
801024a8:	8b 75 0c             	mov    0xc(%ebp),%esi
801024ab:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801024b1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801024b7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024bd:	39 de                	cmp    %ebx,%esi
801024bf:	72 23                	jb     801024e4 <kinit2+0x44>
801024c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801024c8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801024ce:	83 ec 0c             	sub    $0xc,%esp
801024d1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024d7:	50                   	push   %eax
801024d8:	e8 73 fe ff ff       	call   80102350 <kfree>
801024dd:	83 c4 10             	add    $0x10,%esp
801024e0:	39 de                	cmp    %ebx,%esi
801024e2:	73 e4                	jae    801024c8 <kinit2+0x28>
801024e4:	c7 05 54 30 11 80 01 	movl   $0x1,0x80113054
801024eb:	00 00 00 
801024ee:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024f1:	5b                   	pop    %ebx
801024f2:	5e                   	pop    %esi
801024f3:	5d                   	pop    %ebp
801024f4:	c3                   	ret    
801024f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102500 <kalloc>:
80102500:	a1 54 30 11 80       	mov    0x80113054,%eax
80102505:	85 c0                	test   %eax,%eax
80102507:	75 1f                	jne    80102528 <kalloc+0x28>
80102509:	a1 58 30 11 80       	mov    0x80113058,%eax
8010250e:	85 c0                	test   %eax,%eax
80102510:	74 0e                	je     80102520 <kalloc+0x20>
80102512:	8b 10                	mov    (%eax),%edx
80102514:	89 15 58 30 11 80    	mov    %edx,0x80113058
8010251a:	c3                   	ret    
8010251b:	90                   	nop
8010251c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102520:	f3 c3                	repz ret 
80102522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102528:	55                   	push   %ebp
80102529:	89 e5                	mov    %esp,%ebp
8010252b:	83 ec 24             	sub    $0x24,%esp
8010252e:	68 20 30 11 80       	push   $0x80113020
80102533:	e8 38 20 00 00       	call   80104570 <acquire>
80102538:	a1 58 30 11 80       	mov    0x80113058,%eax
8010253d:	83 c4 10             	add    $0x10,%esp
80102540:	8b 15 54 30 11 80    	mov    0x80113054,%edx
80102546:	85 c0                	test   %eax,%eax
80102548:	74 08                	je     80102552 <kalloc+0x52>
8010254a:	8b 08                	mov    (%eax),%ecx
8010254c:	89 0d 58 30 11 80    	mov    %ecx,0x80113058
80102552:	85 d2                	test   %edx,%edx
80102554:	74 16                	je     8010256c <kalloc+0x6c>
80102556:	83 ec 0c             	sub    $0xc,%esp
80102559:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010255c:	68 20 30 11 80       	push   $0x80113020
80102561:	e8 ca 20 00 00       	call   80104630 <release>
80102566:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102569:	83 c4 10             	add    $0x10,%esp
8010256c:	c9                   	leave  
8010256d:	c3                   	ret    
8010256e:	66 90                	xchg   %ax,%ax

80102570 <kbdgetc>:
80102570:	ba 64 00 00 00       	mov    $0x64,%edx
80102575:	ec                   	in     (%dx),%al
80102576:	a8 01                	test   $0x1,%al
80102578:	0f 84 c2 00 00 00    	je     80102640 <kbdgetc+0xd0>
8010257e:	ba 60 00 00 00       	mov    $0x60,%edx
80102583:	ec                   	in     (%dx),%al
80102584:	0f b6 d0             	movzbl %al,%edx
80102587:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
8010258d:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102593:	0f 84 7f 00 00 00    	je     80102618 <kbdgetc+0xa8>
80102599:	55                   	push   %ebp
8010259a:	89 e5                	mov    %esp,%ebp
8010259c:	53                   	push   %ebx
8010259d:	89 cb                	mov    %ecx,%ebx
8010259f:	83 e3 40             	and    $0x40,%ebx
801025a2:	84 c0                	test   %al,%al
801025a4:	78 4a                	js     801025f0 <kbdgetc+0x80>
801025a6:	85 db                	test   %ebx,%ebx
801025a8:	74 09                	je     801025b3 <kbdgetc+0x43>
801025aa:	83 c8 80             	or     $0xffffff80,%eax
801025ad:	83 e1 bf             	and    $0xffffffbf,%ecx
801025b0:	0f b6 d0             	movzbl %al,%edx
801025b3:	0f b6 82 a0 78 10 80 	movzbl -0x7fef8760(%edx),%eax
801025ba:	09 c1                	or     %eax,%ecx
801025bc:	0f b6 82 a0 77 10 80 	movzbl -0x7fef8860(%edx),%eax
801025c3:	31 c1                	xor    %eax,%ecx
801025c5:	89 c8                	mov    %ecx,%eax
801025c7:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
801025cd:	83 e0 03             	and    $0x3,%eax
801025d0:	83 e1 08             	and    $0x8,%ecx
801025d3:	8b 04 85 80 77 10 80 	mov    -0x7fef8880(,%eax,4),%eax
801025da:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
801025de:	74 31                	je     80102611 <kbdgetc+0xa1>
801025e0:	8d 50 9f             	lea    -0x61(%eax),%edx
801025e3:	83 fa 19             	cmp    $0x19,%edx
801025e6:	77 40                	ja     80102628 <kbdgetc+0xb8>
801025e8:	83 e8 20             	sub    $0x20,%eax
801025eb:	5b                   	pop    %ebx
801025ec:	5d                   	pop    %ebp
801025ed:	c3                   	ret    
801025ee:	66 90                	xchg   %ax,%ax
801025f0:	83 e0 7f             	and    $0x7f,%eax
801025f3:	85 db                	test   %ebx,%ebx
801025f5:	0f 44 d0             	cmove  %eax,%edx
801025f8:	0f b6 82 a0 78 10 80 	movzbl -0x7fef8760(%edx),%eax
801025ff:	83 c8 40             	or     $0x40,%eax
80102602:	0f b6 c0             	movzbl %al,%eax
80102605:	f7 d0                	not    %eax
80102607:	21 c1                	and    %eax,%ecx
80102609:	31 c0                	xor    %eax,%eax
8010260b:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102611:	5b                   	pop    %ebx
80102612:	5d                   	pop    %ebp
80102613:	c3                   	ret    
80102614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102618:	83 c9 40             	or     $0x40,%ecx
8010261b:	31 c0                	xor    %eax,%eax
8010261d:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102623:	c3                   	ret    
80102624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102628:	8d 48 bf             	lea    -0x41(%eax),%ecx
8010262b:	8d 50 20             	lea    0x20(%eax),%edx
8010262e:	5b                   	pop    %ebx
8010262f:	83 f9 1a             	cmp    $0x1a,%ecx
80102632:	0f 42 c2             	cmovb  %edx,%eax
80102635:	5d                   	pop    %ebp
80102636:	c3                   	ret    
80102637:	89 f6                	mov    %esi,%esi
80102639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102640:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102645:	c3                   	ret    
80102646:	8d 76 00             	lea    0x0(%esi),%esi
80102649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102650 <kbdintr>:
80102650:	55                   	push   %ebp
80102651:	89 e5                	mov    %esp,%ebp
80102653:	83 ec 14             	sub    $0x14,%esp
80102656:	68 70 25 10 80       	push   $0x80102570
8010265b:	e8 f0 e1 ff ff       	call   80100850 <consoleintr>
80102660:	83 c4 10             	add    $0x10,%esp
80102663:	c9                   	leave  
80102664:	c3                   	ret    
80102665:	66 90                	xchg   %ax,%ax
80102667:	66 90                	xchg   %ax,%ax
80102669:	66 90                	xchg   %ax,%ax
8010266b:	66 90                	xchg   %ax,%ax
8010266d:	66 90                	xchg   %ax,%ax
8010266f:	90                   	nop

80102670 <lapicinit>:
80102670:	a1 5c 30 11 80       	mov    0x8011305c,%eax
80102675:	55                   	push   %ebp
80102676:	89 e5                	mov    %esp,%ebp
80102678:	85 c0                	test   %eax,%eax
8010267a:	0f 84 c8 00 00 00    	je     80102748 <lapicinit+0xd8>
80102680:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102687:	01 00 00 
8010268a:	8b 50 20             	mov    0x20(%eax),%edx
8010268d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102694:	00 00 00 
80102697:	8b 50 20             	mov    0x20(%eax),%edx
8010269a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801026a1:	00 02 00 
801026a4:	8b 50 20             	mov    0x20(%eax),%edx
801026a7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801026ae:	96 98 00 
801026b1:	8b 50 20             	mov    0x20(%eax),%edx
801026b4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801026bb:	00 01 00 
801026be:	8b 50 20             	mov    0x20(%eax),%edx
801026c1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801026c8:	00 01 00 
801026cb:	8b 50 20             	mov    0x20(%eax),%edx
801026ce:	8b 50 30             	mov    0x30(%eax),%edx
801026d1:	c1 ea 10             	shr    $0x10,%edx
801026d4:	80 fa 03             	cmp    $0x3,%dl
801026d7:	77 77                	ja     80102750 <lapicinit+0xe0>
801026d9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801026e0:	00 00 00 
801026e3:	8b 50 20             	mov    0x20(%eax),%edx
801026e6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ed:	00 00 00 
801026f0:	8b 50 20             	mov    0x20(%eax),%edx
801026f3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026fa:	00 00 00 
801026fd:	8b 50 20             	mov    0x20(%eax),%edx
80102700:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102707:	00 00 00 
8010270a:	8b 50 20             	mov    0x20(%eax),%edx
8010270d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102714:	00 00 00 
80102717:	8b 50 20             	mov    0x20(%eax),%edx
8010271a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102721:	85 08 00 
80102724:	8b 50 20             	mov    0x20(%eax),%edx
80102727:	89 f6                	mov    %esi,%esi
80102729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102730:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102736:	80 e6 10             	and    $0x10,%dh
80102739:	75 f5                	jne    80102730 <lapicinit+0xc0>
8010273b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102742:	00 00 00 
80102745:	8b 40 20             	mov    0x20(%eax),%eax
80102748:	5d                   	pop    %ebp
80102749:	c3                   	ret    
8010274a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102750:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102757:	00 01 00 
8010275a:	8b 50 20             	mov    0x20(%eax),%edx
8010275d:	e9 77 ff ff ff       	jmp    801026d9 <lapicinit+0x69>
80102762:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102770 <lapicid>:
80102770:	8b 15 5c 30 11 80    	mov    0x8011305c,%edx
80102776:	55                   	push   %ebp
80102777:	31 c0                	xor    %eax,%eax
80102779:	89 e5                	mov    %esp,%ebp
8010277b:	85 d2                	test   %edx,%edx
8010277d:	74 06                	je     80102785 <lapicid+0x15>
8010277f:	8b 42 20             	mov    0x20(%edx),%eax
80102782:	c1 e8 18             	shr    $0x18,%eax
80102785:	5d                   	pop    %ebp
80102786:	c3                   	ret    
80102787:	89 f6                	mov    %esi,%esi
80102789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102790 <lapiceoi>:
80102790:	a1 5c 30 11 80       	mov    0x8011305c,%eax
80102795:	55                   	push   %ebp
80102796:	89 e5                	mov    %esp,%ebp
80102798:	85 c0                	test   %eax,%eax
8010279a:	74 0d                	je     801027a9 <lapiceoi+0x19>
8010279c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027a3:	00 00 00 
801027a6:	8b 40 20             	mov    0x20(%eax),%eax
801027a9:	5d                   	pop    %ebp
801027aa:	c3                   	ret    
801027ab:	90                   	nop
801027ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027b0 <microdelay>:
801027b0:	55                   	push   %ebp
801027b1:	89 e5                	mov    %esp,%ebp
801027b3:	5d                   	pop    %ebp
801027b4:	c3                   	ret    
801027b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027c0 <lapicstartap>:
801027c0:	55                   	push   %ebp
801027c1:	b8 0f 00 00 00       	mov    $0xf,%eax
801027c6:	ba 70 00 00 00       	mov    $0x70,%edx
801027cb:	89 e5                	mov    %esp,%ebp
801027cd:	53                   	push   %ebx
801027ce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801027d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801027d4:	ee                   	out    %al,(%dx)
801027d5:	b8 0a 00 00 00       	mov    $0xa,%eax
801027da:	ba 71 00 00 00       	mov    $0x71,%edx
801027df:	ee                   	out    %al,(%dx)
801027e0:	31 c0                	xor    %eax,%eax
801027e2:	c1 e3 18             	shl    $0x18,%ebx
801027e5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
801027eb:	89 c8                	mov    %ecx,%eax
801027ed:	c1 e9 0c             	shr    $0xc,%ecx
801027f0:	c1 e8 04             	shr    $0x4,%eax
801027f3:	89 da                	mov    %ebx,%edx
801027f5:	80 cd 06             	or     $0x6,%ch
801027f8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
801027fe:	a1 5c 30 11 80       	mov    0x8011305c,%eax
80102803:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102809:	8b 58 20             	mov    0x20(%eax),%ebx
8010280c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102813:	c5 00 00 
80102816:	8b 58 20             	mov    0x20(%eax),%ebx
80102819:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102820:	85 00 00 
80102823:	8b 58 20             	mov    0x20(%eax),%ebx
80102826:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010282c:	8b 58 20             	mov    0x20(%eax),%ebx
8010282f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102835:	8b 58 20             	mov    0x20(%eax),%ebx
80102838:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010283e:	8b 50 20             	mov    0x20(%eax),%edx
80102841:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102847:	8b 40 20             	mov    0x20(%eax),%eax
8010284a:	5b                   	pop    %ebx
8010284b:	5d                   	pop    %ebp
8010284c:	c3                   	ret    
8010284d:	8d 76 00             	lea    0x0(%esi),%esi

80102850 <cmostime>:
80102850:	55                   	push   %ebp
80102851:	b8 0b 00 00 00       	mov    $0xb,%eax
80102856:	ba 70 00 00 00       	mov    $0x70,%edx
8010285b:	89 e5                	mov    %esp,%ebp
8010285d:	57                   	push   %edi
8010285e:	56                   	push   %esi
8010285f:	53                   	push   %ebx
80102860:	83 ec 4c             	sub    $0x4c,%esp
80102863:	ee                   	out    %al,(%dx)
80102864:	ba 71 00 00 00       	mov    $0x71,%edx
80102869:	ec                   	in     (%dx),%al
8010286a:	83 e0 04             	and    $0x4,%eax
8010286d:	bb 70 00 00 00       	mov    $0x70,%ebx
80102872:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102875:	8d 76 00             	lea    0x0(%esi),%esi
80102878:	31 c0                	xor    %eax,%eax
8010287a:	89 da                	mov    %ebx,%edx
8010287c:	ee                   	out    %al,(%dx)
8010287d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102882:	89 ca                	mov    %ecx,%edx
80102884:	ec                   	in     (%dx),%al
80102885:	88 45 b7             	mov    %al,-0x49(%ebp)
80102888:	89 da                	mov    %ebx,%edx
8010288a:	b8 02 00 00 00       	mov    $0x2,%eax
8010288f:	ee                   	out    %al,(%dx)
80102890:	89 ca                	mov    %ecx,%edx
80102892:	ec                   	in     (%dx),%al
80102893:	88 45 b6             	mov    %al,-0x4a(%ebp)
80102896:	89 da                	mov    %ebx,%edx
80102898:	b8 04 00 00 00       	mov    $0x4,%eax
8010289d:	ee                   	out    %al,(%dx)
8010289e:	89 ca                	mov    %ecx,%edx
801028a0:	ec                   	in     (%dx),%al
801028a1:	88 45 b5             	mov    %al,-0x4b(%ebp)
801028a4:	89 da                	mov    %ebx,%edx
801028a6:	b8 07 00 00 00       	mov    $0x7,%eax
801028ab:	ee                   	out    %al,(%dx)
801028ac:	89 ca                	mov    %ecx,%edx
801028ae:	ec                   	in     (%dx),%al
801028af:	88 45 b4             	mov    %al,-0x4c(%ebp)
801028b2:	89 da                	mov    %ebx,%edx
801028b4:	b8 08 00 00 00       	mov    $0x8,%eax
801028b9:	ee                   	out    %al,(%dx)
801028ba:	89 ca                	mov    %ecx,%edx
801028bc:	ec                   	in     (%dx),%al
801028bd:	89 c7                	mov    %eax,%edi
801028bf:	89 da                	mov    %ebx,%edx
801028c1:	b8 09 00 00 00       	mov    $0x9,%eax
801028c6:	ee                   	out    %al,(%dx)
801028c7:	89 ca                	mov    %ecx,%edx
801028c9:	ec                   	in     (%dx),%al
801028ca:	89 c6                	mov    %eax,%esi
801028cc:	89 da                	mov    %ebx,%edx
801028ce:	b8 0a 00 00 00       	mov    $0xa,%eax
801028d3:	ee                   	out    %al,(%dx)
801028d4:	89 ca                	mov    %ecx,%edx
801028d6:	ec                   	in     (%dx),%al
801028d7:	84 c0                	test   %al,%al
801028d9:	78 9d                	js     80102878 <cmostime+0x28>
801028db:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
801028df:	89 fa                	mov    %edi,%edx
801028e1:	0f b6 fa             	movzbl %dl,%edi
801028e4:	89 f2                	mov    %esi,%edx
801028e6:	0f b6 f2             	movzbl %dl,%esi
801028e9:	89 7d c8             	mov    %edi,-0x38(%ebp)
801028ec:	89 da                	mov    %ebx,%edx
801028ee:	89 75 cc             	mov    %esi,-0x34(%ebp)
801028f1:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028f4:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
801028f8:	89 45 bc             	mov    %eax,-0x44(%ebp)
801028fb:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
801028ff:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102902:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
80102906:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102909:	31 c0                	xor    %eax,%eax
8010290b:	ee                   	out    %al,(%dx)
8010290c:	89 ca                	mov    %ecx,%edx
8010290e:	ec                   	in     (%dx),%al
8010290f:	0f b6 c0             	movzbl %al,%eax
80102912:	89 da                	mov    %ebx,%edx
80102914:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102917:	b8 02 00 00 00       	mov    $0x2,%eax
8010291c:	ee                   	out    %al,(%dx)
8010291d:	89 ca                	mov    %ecx,%edx
8010291f:	ec                   	in     (%dx),%al
80102920:	0f b6 c0             	movzbl %al,%eax
80102923:	89 da                	mov    %ebx,%edx
80102925:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102928:	b8 04 00 00 00       	mov    $0x4,%eax
8010292d:	ee                   	out    %al,(%dx)
8010292e:	89 ca                	mov    %ecx,%edx
80102930:	ec                   	in     (%dx),%al
80102931:	0f b6 c0             	movzbl %al,%eax
80102934:	89 da                	mov    %ebx,%edx
80102936:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102939:	b8 07 00 00 00       	mov    $0x7,%eax
8010293e:	ee                   	out    %al,(%dx)
8010293f:	89 ca                	mov    %ecx,%edx
80102941:	ec                   	in     (%dx),%al
80102942:	0f b6 c0             	movzbl %al,%eax
80102945:	89 da                	mov    %ebx,%edx
80102947:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010294a:	b8 08 00 00 00       	mov    $0x8,%eax
8010294f:	ee                   	out    %al,(%dx)
80102950:	89 ca                	mov    %ecx,%edx
80102952:	ec                   	in     (%dx),%al
80102953:	0f b6 c0             	movzbl %al,%eax
80102956:	89 da                	mov    %ebx,%edx
80102958:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010295b:	b8 09 00 00 00       	mov    $0x9,%eax
80102960:	ee                   	out    %al,(%dx)
80102961:	89 ca                	mov    %ecx,%edx
80102963:	ec                   	in     (%dx),%al
80102964:	0f b6 c0             	movzbl %al,%eax
80102967:	83 ec 04             	sub    $0x4,%esp
8010296a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010296d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102970:	6a 18                	push   $0x18
80102972:	50                   	push   %eax
80102973:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102976:	50                   	push   %eax
80102977:	e8 54 1d 00 00       	call   801046d0 <memcmp>
8010297c:	83 c4 10             	add    $0x10,%esp
8010297f:	85 c0                	test   %eax,%eax
80102981:	0f 85 f1 fe ff ff    	jne    80102878 <cmostime+0x28>
80102987:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
8010298b:	75 78                	jne    80102a05 <cmostime+0x1b5>
8010298d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102990:	89 c2                	mov    %eax,%edx
80102992:	83 e0 0f             	and    $0xf,%eax
80102995:	c1 ea 04             	shr    $0x4,%edx
80102998:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010299b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010299e:	89 45 b8             	mov    %eax,-0x48(%ebp)
801029a1:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029a4:	89 c2                	mov    %eax,%edx
801029a6:	83 e0 0f             	and    $0xf,%eax
801029a9:	c1 ea 04             	shr    $0x4,%edx
801029ac:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029af:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029b2:	89 45 bc             	mov    %eax,-0x44(%ebp)
801029b5:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029b8:	89 c2                	mov    %eax,%edx
801029ba:	83 e0 0f             	and    $0xf,%eax
801029bd:	c1 ea 04             	shr    $0x4,%edx
801029c0:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029c3:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029c6:	89 45 c0             	mov    %eax,-0x40(%ebp)
801029c9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029cc:	89 c2                	mov    %eax,%edx
801029ce:	83 e0 0f             	and    $0xf,%eax
801029d1:	c1 ea 04             	shr    $0x4,%edx
801029d4:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029d7:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029da:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801029dd:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029e0:	89 c2                	mov    %eax,%edx
801029e2:	83 e0 0f             	and    $0xf,%eax
801029e5:	c1 ea 04             	shr    $0x4,%edx
801029e8:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029eb:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029ee:	89 45 c8             	mov    %eax,-0x38(%ebp)
801029f1:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029f4:	89 c2                	mov    %eax,%edx
801029f6:	83 e0 0f             	and    $0xf,%eax
801029f9:	c1 ea 04             	shr    $0x4,%edx
801029fc:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029ff:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a02:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102a05:	8b 75 08             	mov    0x8(%ebp),%esi
80102a08:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102a0b:	89 06                	mov    %eax,(%esi)
80102a0d:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102a10:	89 46 04             	mov    %eax,0x4(%esi)
80102a13:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102a16:	89 46 08             	mov    %eax,0x8(%esi)
80102a19:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102a1c:	89 46 0c             	mov    %eax,0xc(%esi)
80102a1f:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102a22:	89 46 10             	mov    %eax,0x10(%esi)
80102a25:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102a28:	89 46 14             	mov    %eax,0x14(%esi)
80102a2b:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
80102a32:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a35:	5b                   	pop    %ebx
80102a36:	5e                   	pop    %esi
80102a37:	5f                   	pop    %edi
80102a38:	5d                   	pop    %ebp
80102a39:	c3                   	ret    
80102a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102a40 <unixtime>:
80102a40:	55                   	push   %ebp
80102a41:	89 e5                	mov    %esp,%ebp
80102a43:	83 ec 34             	sub    $0x34,%esp
80102a46:	8d 45 e0             	lea    -0x20(%ebp),%eax
80102a49:	50                   	push   %eax
80102a4a:	e8 01 fe ff ff       	call   80102850 <cmostime>
80102a4f:	69 55 f4 80 33 e1 01 	imul   $0x1e13380,-0xc(%ebp),%edx
80102a56:	8b 45 e0             	mov    -0x20(%ebp),%eax
80102a59:	8d 84 02 00 b1 01 89 	lea    -0x76fe4f00(%edx,%eax,1),%eax
80102a60:	69 55 f0 00 8d 27 00 	imul   $0x278d00,-0x10(%ebp),%edx
80102a67:	01 d0                	add    %edx,%eax
80102a69:	69 55 ec 80 51 01 00 	imul   $0x15180,-0x14(%ebp),%edx
80102a70:	01 d0                	add    %edx,%eax
80102a72:	69 55 e8 10 0e 00 00 	imul   $0xe10,-0x18(%ebp),%edx
80102a79:	01 d0                	add    %edx,%eax
80102a7b:	6b 55 e4 3c          	imul   $0x3c,-0x1c(%ebp),%edx
80102a7f:	c9                   	leave  
80102a80:	01 d0                	add    %edx,%eax
80102a82:	c3                   	ret    
80102a83:	66 90                	xchg   %ax,%ax
80102a85:	66 90                	xchg   %ax,%ax
80102a87:	66 90                	xchg   %ax,%ax
80102a89:	66 90                	xchg   %ax,%ax
80102a8b:	66 90                	xchg   %ax,%ax
80102a8d:	66 90                	xchg   %ax,%ax
80102a8f:	90                   	nop

80102a90 <install_trans>:
80102a90:	8b 0d a8 30 11 80    	mov    0x801130a8,%ecx
80102a96:	85 c9                	test   %ecx,%ecx
80102a98:	0f 8e 8a 00 00 00    	jle    80102b28 <install_trans+0x98>
80102a9e:	55                   	push   %ebp
80102a9f:	89 e5                	mov    %esp,%ebp
80102aa1:	57                   	push   %edi
80102aa2:	56                   	push   %esi
80102aa3:	53                   	push   %ebx
80102aa4:	31 db                	xor    %ebx,%ebx
80102aa6:	83 ec 0c             	sub    $0xc,%esp
80102aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ab0:	a1 94 30 11 80       	mov    0x80113094,%eax
80102ab5:	83 ec 08             	sub    $0x8,%esp
80102ab8:	01 d8                	add    %ebx,%eax
80102aba:	83 c0 01             	add    $0x1,%eax
80102abd:	50                   	push   %eax
80102abe:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102ac4:	e8 07 d6 ff ff       	call   801000d0 <bread>
80102ac9:	89 c7                	mov    %eax,%edi
80102acb:	58                   	pop    %eax
80102acc:	5a                   	pop    %edx
80102acd:	ff 34 9d ac 30 11 80 	pushl  -0x7feecf54(,%ebx,4)
80102ad4:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102ada:	83 c3 01             	add    $0x1,%ebx
80102add:	e8 ee d5 ff ff       	call   801000d0 <bread>
80102ae2:	89 c6                	mov    %eax,%esi
80102ae4:	8d 47 5c             	lea    0x5c(%edi),%eax
80102ae7:	83 c4 0c             	add    $0xc,%esp
80102aea:	68 00 02 00 00       	push   $0x200
80102aef:	50                   	push   %eax
80102af0:	8d 46 5c             	lea    0x5c(%esi),%eax
80102af3:	50                   	push   %eax
80102af4:	e8 37 1c 00 00       	call   80104730 <memmove>
80102af9:	89 34 24             	mov    %esi,(%esp)
80102afc:	e8 9f d6 ff ff       	call   801001a0 <bwrite>
80102b01:	89 3c 24             	mov    %edi,(%esp)
80102b04:	e8 d7 d6 ff ff       	call   801001e0 <brelse>
80102b09:	89 34 24             	mov    %esi,(%esp)
80102b0c:	e8 cf d6 ff ff       	call   801001e0 <brelse>
80102b11:	83 c4 10             	add    $0x10,%esp
80102b14:	39 1d a8 30 11 80    	cmp    %ebx,0x801130a8
80102b1a:	7f 94                	jg     80102ab0 <install_trans+0x20>
80102b1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102b1f:	5b                   	pop    %ebx
80102b20:	5e                   	pop    %esi
80102b21:	5f                   	pop    %edi
80102b22:	5d                   	pop    %ebp
80102b23:	c3                   	ret    
80102b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102b28:	f3 c3                	repz ret 
80102b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102b30 <write_head>:
80102b30:	55                   	push   %ebp
80102b31:	89 e5                	mov    %esp,%ebp
80102b33:	56                   	push   %esi
80102b34:	53                   	push   %ebx
80102b35:	83 ec 08             	sub    $0x8,%esp
80102b38:	ff 35 94 30 11 80    	pushl  0x80113094
80102b3e:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102b44:	e8 87 d5 ff ff       	call   801000d0 <bread>
80102b49:	8b 1d a8 30 11 80    	mov    0x801130a8,%ebx
80102b4f:	83 c4 10             	add    $0x10,%esp
80102b52:	89 c6                	mov    %eax,%esi
80102b54:	85 db                	test   %ebx,%ebx
80102b56:	89 58 5c             	mov    %ebx,0x5c(%eax)
80102b59:	7e 16                	jle    80102b71 <write_head+0x41>
80102b5b:	c1 e3 02             	shl    $0x2,%ebx
80102b5e:	31 d2                	xor    %edx,%edx
80102b60:	8b 8a ac 30 11 80    	mov    -0x7feecf54(%edx),%ecx
80102b66:	89 4c 16 60          	mov    %ecx,0x60(%esi,%edx,1)
80102b6a:	83 c2 04             	add    $0x4,%edx
80102b6d:	39 da                	cmp    %ebx,%edx
80102b6f:	75 ef                	jne    80102b60 <write_head+0x30>
80102b71:	83 ec 0c             	sub    $0xc,%esp
80102b74:	56                   	push   %esi
80102b75:	e8 26 d6 ff ff       	call   801001a0 <bwrite>
80102b7a:	89 34 24             	mov    %esi,(%esp)
80102b7d:	e8 5e d6 ff ff       	call   801001e0 <brelse>
80102b82:	83 c4 10             	add    $0x10,%esp
80102b85:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102b88:	5b                   	pop    %ebx
80102b89:	5e                   	pop    %esi
80102b8a:	5d                   	pop    %ebp
80102b8b:	c3                   	ret    
80102b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102b90 <initlog>:
80102b90:	55                   	push   %ebp
80102b91:	89 e5                	mov    %esp,%ebp
80102b93:	53                   	push   %ebx
80102b94:	83 ec 2c             	sub    $0x2c,%esp
80102b97:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102b9a:	68 a0 79 10 80       	push   $0x801079a0
80102b9f:	68 60 30 11 80       	push   $0x80113060
80102ba4:	e8 87 18 00 00       	call   80104430 <initlock>
80102ba9:	58                   	pop    %eax
80102baa:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102bad:	5a                   	pop    %edx
80102bae:	50                   	push   %eax
80102baf:	53                   	push   %ebx
80102bb0:	e8 cb e8 ff ff       	call   80101480 <readsb>
80102bb5:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102bb8:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102bbb:	59                   	pop    %ecx
80102bbc:	89 1d a4 30 11 80    	mov    %ebx,0x801130a4
80102bc2:	89 15 98 30 11 80    	mov    %edx,0x80113098
80102bc8:	a3 94 30 11 80       	mov    %eax,0x80113094
80102bcd:	5a                   	pop    %edx
80102bce:	50                   	push   %eax
80102bcf:	53                   	push   %ebx
80102bd0:	e8 fb d4 ff ff       	call   801000d0 <bread>
80102bd5:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102bd8:	83 c4 10             	add    $0x10,%esp
80102bdb:	85 db                	test   %ebx,%ebx
80102bdd:	89 1d a8 30 11 80    	mov    %ebx,0x801130a8
80102be3:	7e 1c                	jle    80102c01 <initlog+0x71>
80102be5:	c1 e3 02             	shl    $0x2,%ebx
80102be8:	31 d2                	xor    %edx,%edx
80102bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102bf0:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102bf4:	83 c2 04             	add    $0x4,%edx
80102bf7:	89 8a a8 30 11 80    	mov    %ecx,-0x7feecf58(%edx)
80102bfd:	39 d3                	cmp    %edx,%ebx
80102bff:	75 ef                	jne    80102bf0 <initlog+0x60>
80102c01:	83 ec 0c             	sub    $0xc,%esp
80102c04:	50                   	push   %eax
80102c05:	e8 d6 d5 ff ff       	call   801001e0 <brelse>
80102c0a:	e8 81 fe ff ff       	call   80102a90 <install_trans>
80102c0f:	c7 05 a8 30 11 80 00 	movl   $0x0,0x801130a8
80102c16:	00 00 00 
80102c19:	e8 12 ff ff ff       	call   80102b30 <write_head>
80102c1e:	83 c4 10             	add    $0x10,%esp
80102c21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102c24:	c9                   	leave  
80102c25:	c3                   	ret    
80102c26:	8d 76 00             	lea    0x0(%esi),%esi
80102c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c30 <begin_op>:
80102c30:	55                   	push   %ebp
80102c31:	89 e5                	mov    %esp,%ebp
80102c33:	83 ec 14             	sub    $0x14,%esp
80102c36:	68 60 30 11 80       	push   $0x80113060
80102c3b:	e8 30 19 00 00       	call   80104570 <acquire>
80102c40:	83 c4 10             	add    $0x10,%esp
80102c43:	eb 18                	jmp    80102c5d <begin_op+0x2d>
80102c45:	8d 76 00             	lea    0x0(%esi),%esi
80102c48:	83 ec 08             	sub    $0x8,%esp
80102c4b:	68 60 30 11 80       	push   $0x80113060
80102c50:	68 60 30 11 80       	push   $0x80113060
80102c55:	e8 66 12 00 00       	call   80103ec0 <sleep>
80102c5a:	83 c4 10             	add    $0x10,%esp
80102c5d:	a1 a0 30 11 80       	mov    0x801130a0,%eax
80102c62:	85 c0                	test   %eax,%eax
80102c64:	75 e2                	jne    80102c48 <begin_op+0x18>
80102c66:	a1 9c 30 11 80       	mov    0x8011309c,%eax
80102c6b:	8b 15 a8 30 11 80    	mov    0x801130a8,%edx
80102c71:	83 c0 01             	add    $0x1,%eax
80102c74:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102c77:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102c7a:	83 fa 1e             	cmp    $0x1e,%edx
80102c7d:	7f c9                	jg     80102c48 <begin_op+0x18>
80102c7f:	83 ec 0c             	sub    $0xc,%esp
80102c82:	a3 9c 30 11 80       	mov    %eax,0x8011309c
80102c87:	68 60 30 11 80       	push   $0x80113060
80102c8c:	e8 9f 19 00 00       	call   80104630 <release>
80102c91:	83 c4 10             	add    $0x10,%esp
80102c94:	c9                   	leave  
80102c95:	c3                   	ret    
80102c96:	8d 76 00             	lea    0x0(%esi),%esi
80102c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ca0 <end_op>:
80102ca0:	55                   	push   %ebp
80102ca1:	89 e5                	mov    %esp,%ebp
80102ca3:	57                   	push   %edi
80102ca4:	56                   	push   %esi
80102ca5:	53                   	push   %ebx
80102ca6:	83 ec 18             	sub    $0x18,%esp
80102ca9:	68 60 30 11 80       	push   $0x80113060
80102cae:	e8 bd 18 00 00       	call   80104570 <acquire>
80102cb3:	a1 9c 30 11 80       	mov    0x8011309c,%eax
80102cb8:	8b 35 a0 30 11 80    	mov    0x801130a0,%esi
80102cbe:	83 c4 10             	add    $0x10,%esp
80102cc1:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102cc4:	85 f6                	test   %esi,%esi
80102cc6:	89 1d 9c 30 11 80    	mov    %ebx,0x8011309c
80102ccc:	0f 85 1a 01 00 00    	jne    80102dec <end_op+0x14c>
80102cd2:	85 db                	test   %ebx,%ebx
80102cd4:	0f 85 ee 00 00 00    	jne    80102dc8 <end_op+0x128>
80102cda:	83 ec 0c             	sub    $0xc,%esp
80102cdd:	c7 05 a0 30 11 80 01 	movl   $0x1,0x801130a0
80102ce4:	00 00 00 
80102ce7:	68 60 30 11 80       	push   $0x80113060
80102cec:	e8 3f 19 00 00       	call   80104630 <release>
80102cf1:	8b 0d a8 30 11 80    	mov    0x801130a8,%ecx
80102cf7:	83 c4 10             	add    $0x10,%esp
80102cfa:	85 c9                	test   %ecx,%ecx
80102cfc:	0f 8e 85 00 00 00    	jle    80102d87 <end_op+0xe7>
80102d02:	a1 94 30 11 80       	mov    0x80113094,%eax
80102d07:	83 ec 08             	sub    $0x8,%esp
80102d0a:	01 d8                	add    %ebx,%eax
80102d0c:	83 c0 01             	add    $0x1,%eax
80102d0f:	50                   	push   %eax
80102d10:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102d16:	e8 b5 d3 ff ff       	call   801000d0 <bread>
80102d1b:	89 c6                	mov    %eax,%esi
80102d1d:	58                   	pop    %eax
80102d1e:	5a                   	pop    %edx
80102d1f:	ff 34 9d ac 30 11 80 	pushl  -0x7feecf54(,%ebx,4)
80102d26:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102d2c:	83 c3 01             	add    $0x1,%ebx
80102d2f:	e8 9c d3 ff ff       	call   801000d0 <bread>
80102d34:	89 c7                	mov    %eax,%edi
80102d36:	8d 40 5c             	lea    0x5c(%eax),%eax
80102d39:	83 c4 0c             	add    $0xc,%esp
80102d3c:	68 00 02 00 00       	push   $0x200
80102d41:	50                   	push   %eax
80102d42:	8d 46 5c             	lea    0x5c(%esi),%eax
80102d45:	50                   	push   %eax
80102d46:	e8 e5 19 00 00       	call   80104730 <memmove>
80102d4b:	89 34 24             	mov    %esi,(%esp)
80102d4e:	e8 4d d4 ff ff       	call   801001a0 <bwrite>
80102d53:	89 3c 24             	mov    %edi,(%esp)
80102d56:	e8 85 d4 ff ff       	call   801001e0 <brelse>
80102d5b:	89 34 24             	mov    %esi,(%esp)
80102d5e:	e8 7d d4 ff ff       	call   801001e0 <brelse>
80102d63:	83 c4 10             	add    $0x10,%esp
80102d66:	3b 1d a8 30 11 80    	cmp    0x801130a8,%ebx
80102d6c:	7c 94                	jl     80102d02 <end_op+0x62>
80102d6e:	e8 bd fd ff ff       	call   80102b30 <write_head>
80102d73:	e8 18 fd ff ff       	call   80102a90 <install_trans>
80102d78:	c7 05 a8 30 11 80 00 	movl   $0x0,0x801130a8
80102d7f:	00 00 00 
80102d82:	e8 a9 fd ff ff       	call   80102b30 <write_head>
80102d87:	83 ec 0c             	sub    $0xc,%esp
80102d8a:	68 60 30 11 80       	push   $0x80113060
80102d8f:	e8 dc 17 00 00       	call   80104570 <acquire>
80102d94:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
80102d9b:	c7 05 a0 30 11 80 00 	movl   $0x0,0x801130a0
80102da2:	00 00 00 
80102da5:	e8 d6 12 00 00       	call   80104080 <wakeup>
80102daa:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
80102db1:	e8 7a 18 00 00       	call   80104630 <release>
80102db6:	83 c4 10             	add    $0x10,%esp
80102db9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102dbc:	5b                   	pop    %ebx
80102dbd:	5e                   	pop    %esi
80102dbe:	5f                   	pop    %edi
80102dbf:	5d                   	pop    %ebp
80102dc0:	c3                   	ret    
80102dc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102dc8:	83 ec 0c             	sub    $0xc,%esp
80102dcb:	68 60 30 11 80       	push   $0x80113060
80102dd0:	e8 ab 12 00 00       	call   80104080 <wakeup>
80102dd5:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
80102ddc:	e8 4f 18 00 00       	call   80104630 <release>
80102de1:	83 c4 10             	add    $0x10,%esp
80102de4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102de7:	5b                   	pop    %ebx
80102de8:	5e                   	pop    %esi
80102de9:	5f                   	pop    %edi
80102dea:	5d                   	pop    %ebp
80102deb:	c3                   	ret    
80102dec:	83 ec 0c             	sub    $0xc,%esp
80102def:	68 a4 79 10 80       	push   $0x801079a4
80102df4:	e8 97 d5 ff ff       	call   80100390 <panic>
80102df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102e00 <log_write>:
80102e00:	55                   	push   %ebp
80102e01:	89 e5                	mov    %esp,%ebp
80102e03:	53                   	push   %ebx
80102e04:	83 ec 04             	sub    $0x4,%esp
80102e07:	8b 15 a8 30 11 80    	mov    0x801130a8,%edx
80102e0d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102e10:	83 fa 1d             	cmp    $0x1d,%edx
80102e13:	0f 8f 9d 00 00 00    	jg     80102eb6 <log_write+0xb6>
80102e19:	a1 98 30 11 80       	mov    0x80113098,%eax
80102e1e:	83 e8 01             	sub    $0x1,%eax
80102e21:	39 c2                	cmp    %eax,%edx
80102e23:	0f 8d 8d 00 00 00    	jge    80102eb6 <log_write+0xb6>
80102e29:	a1 9c 30 11 80       	mov    0x8011309c,%eax
80102e2e:	85 c0                	test   %eax,%eax
80102e30:	0f 8e 8d 00 00 00    	jle    80102ec3 <log_write+0xc3>
80102e36:	83 ec 0c             	sub    $0xc,%esp
80102e39:	68 60 30 11 80       	push   $0x80113060
80102e3e:	e8 2d 17 00 00       	call   80104570 <acquire>
80102e43:	8b 0d a8 30 11 80    	mov    0x801130a8,%ecx
80102e49:	83 c4 10             	add    $0x10,%esp
80102e4c:	83 f9 00             	cmp    $0x0,%ecx
80102e4f:	7e 57                	jle    80102ea8 <log_write+0xa8>
80102e51:	8b 53 08             	mov    0x8(%ebx),%edx
80102e54:	31 c0                	xor    %eax,%eax
80102e56:	3b 15 ac 30 11 80    	cmp    0x801130ac,%edx
80102e5c:	75 0b                	jne    80102e69 <log_write+0x69>
80102e5e:	eb 38                	jmp    80102e98 <log_write+0x98>
80102e60:	39 14 85 ac 30 11 80 	cmp    %edx,-0x7feecf54(,%eax,4)
80102e67:	74 2f                	je     80102e98 <log_write+0x98>
80102e69:	83 c0 01             	add    $0x1,%eax
80102e6c:	39 c1                	cmp    %eax,%ecx
80102e6e:	75 f0                	jne    80102e60 <log_write+0x60>
80102e70:	89 14 85 ac 30 11 80 	mov    %edx,-0x7feecf54(,%eax,4)
80102e77:	83 c0 01             	add    $0x1,%eax
80102e7a:	a3 a8 30 11 80       	mov    %eax,0x801130a8
80102e7f:	83 0b 04             	orl    $0x4,(%ebx)
80102e82:	c7 45 08 60 30 11 80 	movl   $0x80113060,0x8(%ebp)
80102e89:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e8c:	c9                   	leave  
80102e8d:	e9 9e 17 00 00       	jmp    80104630 <release>
80102e92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102e98:	89 14 85 ac 30 11 80 	mov    %edx,-0x7feecf54(,%eax,4)
80102e9f:	eb de                	jmp    80102e7f <log_write+0x7f>
80102ea1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ea8:	8b 43 08             	mov    0x8(%ebx),%eax
80102eab:	a3 ac 30 11 80       	mov    %eax,0x801130ac
80102eb0:	75 cd                	jne    80102e7f <log_write+0x7f>
80102eb2:	31 c0                	xor    %eax,%eax
80102eb4:	eb c1                	jmp    80102e77 <log_write+0x77>
80102eb6:	83 ec 0c             	sub    $0xc,%esp
80102eb9:	68 b3 79 10 80       	push   $0x801079b3
80102ebe:	e8 cd d4 ff ff       	call   80100390 <panic>
80102ec3:	83 ec 0c             	sub    $0xc,%esp
80102ec6:	68 c9 79 10 80       	push   $0x801079c9
80102ecb:	e8 c0 d4 ff ff       	call   80100390 <panic>

80102ed0 <mpmain>:
80102ed0:	55                   	push   %ebp
80102ed1:	89 e5                	mov    %esp,%ebp
80102ed3:	53                   	push   %ebx
80102ed4:	83 ec 04             	sub    $0x4,%esp
80102ed7:	e8 a4 09 00 00       	call   80103880 <cpuid>
80102edc:	89 c3                	mov    %eax,%ebx
80102ede:	e8 9d 09 00 00       	call   80103880 <cpuid>
80102ee3:	83 ec 04             	sub    $0x4,%esp
80102ee6:	53                   	push   %ebx
80102ee7:	50                   	push   %eax
80102ee8:	68 e4 79 10 80       	push   $0x801079e4
80102eed:	e8 6e d7 ff ff       	call   80100660 <cprintf>
80102ef2:	e8 99 2a 00 00       	call   80105990 <idtinit>
80102ef7:	e8 04 09 00 00       	call   80103800 <mycpu>
80102efc:	89 c2                	mov    %eax,%edx
80102efe:	b8 01 00 00 00       	mov    $0x1,%eax
80102f03:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102f0a:	e8 91 0c 00 00       	call   80103ba0 <scheduler>
80102f0f:	90                   	nop

80102f10 <mpenter>:
80102f10:	55                   	push   %ebp
80102f11:	89 e5                	mov    %esp,%ebp
80102f13:	83 ec 08             	sub    $0x8,%esp
80102f16:	e8 65 3b 00 00       	call   80106a80 <switchkvm>
80102f1b:	e8 d0 3a 00 00       	call   801069f0 <seginit>
80102f20:	e8 4b f7 ff ff       	call   80102670 <lapicinit>
80102f25:	e8 a6 ff ff ff       	call   80102ed0 <mpmain>
80102f2a:	66 90                	xchg   %ax,%ax
80102f2c:	66 90                	xchg   %ax,%ax
80102f2e:	66 90                	xchg   %ax,%ax

80102f30 <main>:
80102f30:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102f34:	83 e4 f0             	and    $0xfffffff0,%esp
80102f37:	ff 71 fc             	pushl  -0x4(%ecx)
80102f3a:	55                   	push   %ebp
80102f3b:	89 e5                	mov    %esp,%ebp
80102f3d:	53                   	push   %ebx
80102f3e:	51                   	push   %ecx
80102f3f:	83 ec 08             	sub    $0x8,%esp
80102f42:	68 00 00 40 80       	push   $0x80400000
80102f47:	68 88 61 11 80       	push   $0x80116188
80102f4c:	e8 df f4 ff ff       	call   80102430 <kinit1>
80102f51:	e8 fa 3f 00 00       	call   80106f50 <kvmalloc>
80102f56:	e8 75 01 00 00       	call   801030d0 <mpinit>
80102f5b:	e8 10 f7 ff ff       	call   80102670 <lapicinit>
80102f60:	e8 8b 3a 00 00       	call   801069f0 <seginit>
80102f65:	e8 46 03 00 00       	call   801032b0 <picinit>
80102f6a:	e8 f1 f2 ff ff       	call   80102260 <ioapicinit>
80102f6f:	e8 8c da ff ff       	call   80100a00 <consoleinit>
80102f74:	e8 47 2d 00 00       	call   80105cc0 <uartinit>
80102f79:	e8 52 08 00 00       	call   801037d0 <pinit>
80102f7e:	e8 8d 29 00 00       	call   80105910 <tvinit>
80102f83:	e8 b8 d0 ff ff       	call   80100040 <binit>
80102f88:	e8 13 de ff ff       	call   80100da0 <fileinit>
80102f8d:	e8 ae f0 ff ff       	call   80102040 <ideinit>
80102f92:	83 c4 0c             	add    $0xc,%esp
80102f95:	68 8a 00 00 00       	push   $0x8a
80102f9a:	68 90 a4 10 80       	push   $0x8010a490
80102f9f:	68 00 70 00 80       	push   $0x80007000
80102fa4:	e8 87 17 00 00       	call   80104730 <memmove>
80102fa9:	69 05 e0 36 11 80 b0 	imul   $0xb0,0x801136e0,%eax
80102fb0:	00 00 00 
80102fb3:	83 c4 10             	add    $0x10,%esp
80102fb6:	05 60 31 11 80       	add    $0x80113160,%eax
80102fbb:	3d 60 31 11 80       	cmp    $0x80113160,%eax
80102fc0:	76 71                	jbe    80103033 <main+0x103>
80102fc2:	bb 60 31 11 80       	mov    $0x80113160,%ebx
80102fc7:	89 f6                	mov    %esi,%esi
80102fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102fd0:	e8 2b 08 00 00       	call   80103800 <mycpu>
80102fd5:	39 d8                	cmp    %ebx,%eax
80102fd7:	74 41                	je     8010301a <main+0xea>
80102fd9:	e8 22 f5 ff ff       	call   80102500 <kalloc>
80102fde:	05 00 10 00 00       	add    $0x1000,%eax
80102fe3:	c7 05 f8 6f 00 80 10 	movl   $0x80102f10,0x80006ff8
80102fea:	2f 10 80 
80102fed:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102ff4:	90 10 00 
80102ff7:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102ffc:	0f b6 03             	movzbl (%ebx),%eax
80102fff:	83 ec 08             	sub    $0x8,%esp
80103002:	68 00 70 00 00       	push   $0x7000
80103007:	50                   	push   %eax
80103008:	e8 b3 f7 ff ff       	call   801027c0 <lapicstartap>
8010300d:	83 c4 10             	add    $0x10,%esp
80103010:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80103016:	85 c0                	test   %eax,%eax
80103018:	74 f6                	je     80103010 <main+0xe0>
8010301a:	69 05 e0 36 11 80 b0 	imul   $0xb0,0x801136e0,%eax
80103021:	00 00 00 
80103024:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
8010302a:	05 60 31 11 80       	add    $0x80113160,%eax
8010302f:	39 c3                	cmp    %eax,%ebx
80103031:	72 9d                	jb     80102fd0 <main+0xa0>
80103033:	83 ec 08             	sub    $0x8,%esp
80103036:	68 00 00 00 8e       	push   $0x8e000000
8010303b:	68 00 00 40 80       	push   $0x80400000
80103040:	e8 5b f4 ff ff       	call   801024a0 <kinit2>
80103045:	e8 86 08 00 00       	call   801038d0 <userinit>
8010304a:	e8 81 fe ff ff       	call   80102ed0 <mpmain>
8010304f:	90                   	nop

80103050 <mpsearch1>:
80103050:	55                   	push   %ebp
80103051:	89 e5                	mov    %esp,%ebp
80103053:	57                   	push   %edi
80103054:	56                   	push   %esi
80103055:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
8010305b:	53                   	push   %ebx
8010305c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
8010305f:	83 ec 0c             	sub    $0xc,%esp
80103062:	39 de                	cmp    %ebx,%esi
80103064:	72 10                	jb     80103076 <mpsearch1+0x26>
80103066:	eb 50                	jmp    801030b8 <mpsearch1+0x68>
80103068:	90                   	nop
80103069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103070:	39 fb                	cmp    %edi,%ebx
80103072:	89 fe                	mov    %edi,%esi
80103074:	76 42                	jbe    801030b8 <mpsearch1+0x68>
80103076:	83 ec 04             	sub    $0x4,%esp
80103079:	8d 7e 10             	lea    0x10(%esi),%edi
8010307c:	6a 04                	push   $0x4
8010307e:	68 f8 79 10 80       	push   $0x801079f8
80103083:	56                   	push   %esi
80103084:	e8 47 16 00 00       	call   801046d0 <memcmp>
80103089:	83 c4 10             	add    $0x10,%esp
8010308c:	85 c0                	test   %eax,%eax
8010308e:	75 e0                	jne    80103070 <mpsearch1+0x20>
80103090:	89 f1                	mov    %esi,%ecx
80103092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103098:	0f b6 11             	movzbl (%ecx),%edx
8010309b:	83 c1 01             	add    $0x1,%ecx
8010309e:	01 d0                	add    %edx,%eax
801030a0:	39 f9                	cmp    %edi,%ecx
801030a2:	75 f4                	jne    80103098 <mpsearch1+0x48>
801030a4:	84 c0                	test   %al,%al
801030a6:	75 c8                	jne    80103070 <mpsearch1+0x20>
801030a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030ab:	89 f0                	mov    %esi,%eax
801030ad:	5b                   	pop    %ebx
801030ae:	5e                   	pop    %esi
801030af:	5f                   	pop    %edi
801030b0:	5d                   	pop    %ebp
801030b1:	c3                   	ret    
801030b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801030b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030bb:	31 f6                	xor    %esi,%esi
801030bd:	89 f0                	mov    %esi,%eax
801030bf:	5b                   	pop    %ebx
801030c0:	5e                   	pop    %esi
801030c1:	5f                   	pop    %edi
801030c2:	5d                   	pop    %ebp
801030c3:	c3                   	ret    
801030c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801030ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801030d0 <mpinit>:
801030d0:	55                   	push   %ebp
801030d1:	89 e5                	mov    %esp,%ebp
801030d3:	57                   	push   %edi
801030d4:	56                   	push   %esi
801030d5:	53                   	push   %ebx
801030d6:	83 ec 1c             	sub    $0x1c,%esp
801030d9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
801030e0:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
801030e7:	c1 e0 08             	shl    $0x8,%eax
801030ea:	09 d0                	or     %edx,%eax
801030ec:	c1 e0 04             	shl    $0x4,%eax
801030ef:	85 c0                	test   %eax,%eax
801030f1:	75 1b                	jne    8010310e <mpinit+0x3e>
801030f3:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
801030fa:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103101:	c1 e0 08             	shl    $0x8,%eax
80103104:	09 d0                	or     %edx,%eax
80103106:	c1 e0 0a             	shl    $0xa,%eax
80103109:	2d 00 04 00 00       	sub    $0x400,%eax
8010310e:	ba 00 04 00 00       	mov    $0x400,%edx
80103113:	e8 38 ff ff ff       	call   80103050 <mpsearch1>
80103118:	85 c0                	test   %eax,%eax
8010311a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010311d:	0f 84 3d 01 00 00    	je     80103260 <mpinit+0x190>
80103123:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103126:	8b 58 04             	mov    0x4(%eax),%ebx
80103129:	85 db                	test   %ebx,%ebx
8010312b:	0f 84 4f 01 00 00    	je     80103280 <mpinit+0x1b0>
80103131:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
80103137:	83 ec 04             	sub    $0x4,%esp
8010313a:	6a 04                	push   $0x4
8010313c:	68 15 7a 10 80       	push   $0x80107a15
80103141:	56                   	push   %esi
80103142:	e8 89 15 00 00       	call   801046d0 <memcmp>
80103147:	83 c4 10             	add    $0x10,%esp
8010314a:	85 c0                	test   %eax,%eax
8010314c:	0f 85 2e 01 00 00    	jne    80103280 <mpinit+0x1b0>
80103152:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103159:	3c 01                	cmp    $0x1,%al
8010315b:	0f 95 c2             	setne  %dl
8010315e:	3c 04                	cmp    $0x4,%al
80103160:	0f 95 c0             	setne  %al
80103163:	20 c2                	and    %al,%dl
80103165:	0f 85 15 01 00 00    	jne    80103280 <mpinit+0x1b0>
8010316b:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
80103172:	66 85 ff             	test   %di,%di
80103175:	74 1a                	je     80103191 <mpinit+0xc1>
80103177:	89 f0                	mov    %esi,%eax
80103179:	01 f7                	add    %esi,%edi
8010317b:	31 d2                	xor    %edx,%edx
8010317d:	8d 76 00             	lea    0x0(%esi),%esi
80103180:	0f b6 08             	movzbl (%eax),%ecx
80103183:	83 c0 01             	add    $0x1,%eax
80103186:	01 ca                	add    %ecx,%edx
80103188:	39 c7                	cmp    %eax,%edi
8010318a:	75 f4                	jne    80103180 <mpinit+0xb0>
8010318c:	84 d2                	test   %dl,%dl
8010318e:	0f 95 c2             	setne  %dl
80103191:	85 f6                	test   %esi,%esi
80103193:	0f 84 e7 00 00 00    	je     80103280 <mpinit+0x1b0>
80103199:	84 d2                	test   %dl,%dl
8010319b:	0f 85 df 00 00 00    	jne    80103280 <mpinit+0x1b0>
801031a1:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801031a7:	a3 5c 30 11 80       	mov    %eax,0x8011305c
801031ac:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801031b3:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
801031b9:	bb 01 00 00 00       	mov    $0x1,%ebx
801031be:	01 d6                	add    %edx,%esi
801031c0:	39 c6                	cmp    %eax,%esi
801031c2:	76 23                	jbe    801031e7 <mpinit+0x117>
801031c4:	0f b6 10             	movzbl (%eax),%edx
801031c7:	80 fa 04             	cmp    $0x4,%dl
801031ca:	0f 87 ca 00 00 00    	ja     8010329a <mpinit+0x1ca>
801031d0:	ff 24 95 3c 7a 10 80 	jmp    *-0x7fef85c4(,%edx,4)
801031d7:	89 f6                	mov    %esi,%esi
801031d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801031e0:	83 c0 08             	add    $0x8,%eax
801031e3:	39 c6                	cmp    %eax,%esi
801031e5:	77 dd                	ja     801031c4 <mpinit+0xf4>
801031e7:	85 db                	test   %ebx,%ebx
801031e9:	0f 84 9e 00 00 00    	je     8010328d <mpinit+0x1bd>
801031ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801031f2:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
801031f6:	74 15                	je     8010320d <mpinit+0x13d>
801031f8:	b8 70 00 00 00       	mov    $0x70,%eax
801031fd:	ba 22 00 00 00       	mov    $0x22,%edx
80103202:	ee                   	out    %al,(%dx)
80103203:	ba 23 00 00 00       	mov    $0x23,%edx
80103208:	ec                   	in     (%dx),%al
80103209:	83 c8 01             	or     $0x1,%eax
8010320c:	ee                   	out    %al,(%dx)
8010320d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103210:	5b                   	pop    %ebx
80103211:	5e                   	pop    %esi
80103212:	5f                   	pop    %edi
80103213:	5d                   	pop    %ebp
80103214:	c3                   	ret    
80103215:	8d 76 00             	lea    0x0(%esi),%esi
80103218:	8b 0d e0 36 11 80    	mov    0x801136e0,%ecx
8010321e:	83 f9 07             	cmp    $0x7,%ecx
80103221:	7f 19                	jg     8010323c <mpinit+0x16c>
80103223:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103227:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
8010322d:	83 c1 01             	add    $0x1,%ecx
80103230:	89 0d e0 36 11 80    	mov    %ecx,0x801136e0
80103236:	88 97 60 31 11 80    	mov    %dl,-0x7feecea0(%edi)
8010323c:	83 c0 14             	add    $0x14,%eax
8010323f:	e9 7c ff ff ff       	jmp    801031c0 <mpinit+0xf0>
80103244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103248:	0f b6 50 01          	movzbl 0x1(%eax),%edx
8010324c:	83 c0 08             	add    $0x8,%eax
8010324f:	88 15 40 31 11 80    	mov    %dl,0x80113140
80103255:	e9 66 ff ff ff       	jmp    801031c0 <mpinit+0xf0>
8010325a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103260:	ba 00 00 01 00       	mov    $0x10000,%edx
80103265:	b8 00 00 0f 00       	mov    $0xf0000,%eax
8010326a:	e8 e1 fd ff ff       	call   80103050 <mpsearch1>
8010326f:	85 c0                	test   %eax,%eax
80103271:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103274:	0f 85 a9 fe ff ff    	jne    80103123 <mpinit+0x53>
8010327a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103280:	83 ec 0c             	sub    $0xc,%esp
80103283:	68 fd 79 10 80       	push   $0x801079fd
80103288:	e8 03 d1 ff ff       	call   80100390 <panic>
8010328d:	83 ec 0c             	sub    $0xc,%esp
80103290:	68 1c 7a 10 80       	push   $0x80107a1c
80103295:	e8 f6 d0 ff ff       	call   80100390 <panic>
8010329a:	31 db                	xor    %ebx,%ebx
8010329c:	e9 26 ff ff ff       	jmp    801031c7 <mpinit+0xf7>
801032a1:	66 90                	xchg   %ax,%ax
801032a3:	66 90                	xchg   %ax,%ax
801032a5:	66 90                	xchg   %ax,%ax
801032a7:	66 90                	xchg   %ax,%ax
801032a9:	66 90                	xchg   %ax,%ax
801032ab:	66 90                	xchg   %ax,%ax
801032ad:	66 90                	xchg   %ax,%ax
801032af:	90                   	nop

801032b0 <picinit>:
801032b0:	55                   	push   %ebp
801032b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032b6:	ba 21 00 00 00       	mov    $0x21,%edx
801032bb:	89 e5                	mov    %esp,%ebp
801032bd:	ee                   	out    %al,(%dx)
801032be:	ba a1 00 00 00       	mov    $0xa1,%edx
801032c3:	ee                   	out    %al,(%dx)
801032c4:	5d                   	pop    %ebp
801032c5:	c3                   	ret    
801032c6:	66 90                	xchg   %ax,%ax
801032c8:	66 90                	xchg   %ax,%ax
801032ca:	66 90                	xchg   %ax,%ax
801032cc:	66 90                	xchg   %ax,%ax
801032ce:	66 90                	xchg   %ax,%ax

801032d0 <pipealloc>:
801032d0:	55                   	push   %ebp
801032d1:	89 e5                	mov    %esp,%ebp
801032d3:	57                   	push   %edi
801032d4:	56                   	push   %esi
801032d5:	53                   	push   %ebx
801032d6:	83 ec 0c             	sub    $0xc,%esp
801032d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032dc:	8b 75 0c             	mov    0xc(%ebp),%esi
801032df:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
801032e5:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801032eb:	e8 d0 da ff ff       	call   80100dc0 <filealloc>
801032f0:	85 c0                	test   %eax,%eax
801032f2:	89 03                	mov    %eax,(%ebx)
801032f4:	74 22                	je     80103318 <pipealloc+0x48>
801032f6:	e8 c5 da ff ff       	call   80100dc0 <filealloc>
801032fb:	85 c0                	test   %eax,%eax
801032fd:	89 06                	mov    %eax,(%esi)
801032ff:	74 3f                	je     80103340 <pipealloc+0x70>
80103301:	e8 fa f1 ff ff       	call   80102500 <kalloc>
80103306:	85 c0                	test   %eax,%eax
80103308:	89 c7                	mov    %eax,%edi
8010330a:	75 54                	jne    80103360 <pipealloc+0x90>
8010330c:	8b 03                	mov    (%ebx),%eax
8010330e:	85 c0                	test   %eax,%eax
80103310:	75 34                	jne    80103346 <pipealloc+0x76>
80103312:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103318:	8b 06                	mov    (%esi),%eax
8010331a:	85 c0                	test   %eax,%eax
8010331c:	74 0c                	je     8010332a <pipealloc+0x5a>
8010331e:	83 ec 0c             	sub    $0xc,%esp
80103321:	50                   	push   %eax
80103322:	e8 59 db ff ff       	call   80100e80 <fileclose>
80103327:	83 c4 10             	add    $0x10,%esp
8010332a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010332d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103332:	5b                   	pop    %ebx
80103333:	5e                   	pop    %esi
80103334:	5f                   	pop    %edi
80103335:	5d                   	pop    %ebp
80103336:	c3                   	ret    
80103337:	89 f6                	mov    %esi,%esi
80103339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103340:	8b 03                	mov    (%ebx),%eax
80103342:	85 c0                	test   %eax,%eax
80103344:	74 e4                	je     8010332a <pipealloc+0x5a>
80103346:	83 ec 0c             	sub    $0xc,%esp
80103349:	50                   	push   %eax
8010334a:	e8 31 db ff ff       	call   80100e80 <fileclose>
8010334f:	8b 06                	mov    (%esi),%eax
80103351:	83 c4 10             	add    $0x10,%esp
80103354:	85 c0                	test   %eax,%eax
80103356:	75 c6                	jne    8010331e <pipealloc+0x4e>
80103358:	eb d0                	jmp    8010332a <pipealloc+0x5a>
8010335a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103360:	83 ec 08             	sub    $0x8,%esp
80103363:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
8010336a:	00 00 00 
8010336d:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80103374:	00 00 00 
80103377:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
8010337e:	00 00 00 
80103381:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103388:	00 00 00 
8010338b:	68 50 7a 10 80       	push   $0x80107a50
80103390:	50                   	push   %eax
80103391:	e8 9a 10 00 00       	call   80104430 <initlock>
80103396:	8b 03                	mov    (%ebx),%eax
80103398:	83 c4 10             	add    $0x10,%esp
8010339b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801033a1:	8b 03                	mov    (%ebx),%eax
801033a3:	c6 40 08 01          	movb   $0x1,0x8(%eax)
801033a7:	8b 03                	mov    (%ebx),%eax
801033a9:	c6 40 09 00          	movb   $0x0,0x9(%eax)
801033ad:	8b 03                	mov    (%ebx),%eax
801033af:	89 78 0c             	mov    %edi,0xc(%eax)
801033b2:	8b 06                	mov    (%esi),%eax
801033b4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801033ba:	8b 06                	mov    (%esi),%eax
801033bc:	c6 40 08 00          	movb   $0x0,0x8(%eax)
801033c0:	8b 06                	mov    (%esi),%eax
801033c2:	c6 40 09 01          	movb   $0x1,0x9(%eax)
801033c6:	8b 06                	mov    (%esi),%eax
801033c8:	89 78 0c             	mov    %edi,0xc(%eax)
801033cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801033ce:	31 c0                	xor    %eax,%eax
801033d0:	5b                   	pop    %ebx
801033d1:	5e                   	pop    %esi
801033d2:	5f                   	pop    %edi
801033d3:	5d                   	pop    %ebp
801033d4:	c3                   	ret    
801033d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801033d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801033e0 <pipeclose>:
801033e0:	55                   	push   %ebp
801033e1:	89 e5                	mov    %esp,%ebp
801033e3:	56                   	push   %esi
801033e4:	53                   	push   %ebx
801033e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801033e8:	8b 75 0c             	mov    0xc(%ebp),%esi
801033eb:	83 ec 0c             	sub    $0xc,%esp
801033ee:	53                   	push   %ebx
801033ef:	e8 7c 11 00 00       	call   80104570 <acquire>
801033f4:	83 c4 10             	add    $0x10,%esp
801033f7:	85 f6                	test   %esi,%esi
801033f9:	74 45                	je     80103440 <pipeclose+0x60>
801033fb:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103401:	83 ec 0c             	sub    $0xc,%esp
80103404:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010340b:	00 00 00 
8010340e:	50                   	push   %eax
8010340f:	e8 6c 0c 00 00       	call   80104080 <wakeup>
80103414:	83 c4 10             	add    $0x10,%esp
80103417:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010341d:	85 d2                	test   %edx,%edx
8010341f:	75 0a                	jne    8010342b <pipeclose+0x4b>
80103421:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103427:	85 c0                	test   %eax,%eax
80103429:	74 35                	je     80103460 <pipeclose+0x80>
8010342b:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010342e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103431:	5b                   	pop    %ebx
80103432:	5e                   	pop    %esi
80103433:	5d                   	pop    %ebp
80103434:	e9 f7 11 00 00       	jmp    80104630 <release>
80103439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103440:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103446:	83 ec 0c             	sub    $0xc,%esp
80103449:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103450:	00 00 00 
80103453:	50                   	push   %eax
80103454:	e8 27 0c 00 00       	call   80104080 <wakeup>
80103459:	83 c4 10             	add    $0x10,%esp
8010345c:	eb b9                	jmp    80103417 <pipeclose+0x37>
8010345e:	66 90                	xchg   %ax,%ax
80103460:	83 ec 0c             	sub    $0xc,%esp
80103463:	53                   	push   %ebx
80103464:	e8 c7 11 00 00       	call   80104630 <release>
80103469:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010346c:	83 c4 10             	add    $0x10,%esp
8010346f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103472:	5b                   	pop    %ebx
80103473:	5e                   	pop    %esi
80103474:	5d                   	pop    %ebp
80103475:	e9 d6 ee ff ff       	jmp    80102350 <kfree>
8010347a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103480 <pipewrite>:
80103480:	55                   	push   %ebp
80103481:	89 e5                	mov    %esp,%ebp
80103483:	57                   	push   %edi
80103484:	56                   	push   %esi
80103485:	53                   	push   %ebx
80103486:	83 ec 28             	sub    $0x28,%esp
80103489:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010348c:	53                   	push   %ebx
8010348d:	e8 de 10 00 00       	call   80104570 <acquire>
80103492:	8b 45 10             	mov    0x10(%ebp),%eax
80103495:	83 c4 10             	add    $0x10,%esp
80103498:	85 c0                	test   %eax,%eax
8010349a:	0f 8e c9 00 00 00    	jle    80103569 <pipewrite+0xe9>
801034a0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801034a3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801034a9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801034af:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801034b2:	03 4d 10             	add    0x10(%ebp),%ecx
801034b5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801034b8:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801034be:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801034c4:	39 d0                	cmp    %edx,%eax
801034c6:	75 71                	jne    80103539 <pipewrite+0xb9>
801034c8:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801034ce:	85 c0                	test   %eax,%eax
801034d0:	74 4e                	je     80103520 <pipewrite+0xa0>
801034d2:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801034d8:	eb 3a                	jmp    80103514 <pipewrite+0x94>
801034da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801034e0:	83 ec 0c             	sub    $0xc,%esp
801034e3:	57                   	push   %edi
801034e4:	e8 97 0b 00 00       	call   80104080 <wakeup>
801034e9:	5a                   	pop    %edx
801034ea:	59                   	pop    %ecx
801034eb:	53                   	push   %ebx
801034ec:	56                   	push   %esi
801034ed:	e8 ce 09 00 00       	call   80103ec0 <sleep>
801034f2:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801034f8:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
801034fe:	83 c4 10             	add    $0x10,%esp
80103501:	05 00 02 00 00       	add    $0x200,%eax
80103506:	39 c2                	cmp    %eax,%edx
80103508:	75 36                	jne    80103540 <pipewrite+0xc0>
8010350a:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103510:	85 c0                	test   %eax,%eax
80103512:	74 0c                	je     80103520 <pipewrite+0xa0>
80103514:	e8 87 03 00 00       	call   801038a0 <myproc>
80103519:	8b 40 28             	mov    0x28(%eax),%eax
8010351c:	85 c0                	test   %eax,%eax
8010351e:	74 c0                	je     801034e0 <pipewrite+0x60>
80103520:	83 ec 0c             	sub    $0xc,%esp
80103523:	53                   	push   %ebx
80103524:	e8 07 11 00 00       	call   80104630 <release>
80103529:	83 c4 10             	add    $0x10,%esp
8010352c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103531:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103534:	5b                   	pop    %ebx
80103535:	5e                   	pop    %esi
80103536:	5f                   	pop    %edi
80103537:	5d                   	pop    %ebp
80103538:	c3                   	ret    
80103539:	89 c2                	mov    %eax,%edx
8010353b:	90                   	nop
8010353c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103540:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80103543:	8d 42 01             	lea    0x1(%edx),%eax
80103546:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010354c:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103552:	83 c6 01             	add    $0x1,%esi
80103555:	0f b6 4e ff          	movzbl -0x1(%esi),%ecx
80103559:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010355c:	89 75 e4             	mov    %esi,-0x1c(%ebp)
8010355f:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
80103563:	0f 85 4f ff ff ff    	jne    801034b8 <pipewrite+0x38>
80103569:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010356f:	83 ec 0c             	sub    $0xc,%esp
80103572:	50                   	push   %eax
80103573:	e8 08 0b 00 00       	call   80104080 <wakeup>
80103578:	89 1c 24             	mov    %ebx,(%esp)
8010357b:	e8 b0 10 00 00       	call   80104630 <release>
80103580:	83 c4 10             	add    $0x10,%esp
80103583:	8b 45 10             	mov    0x10(%ebp),%eax
80103586:	eb a9                	jmp    80103531 <pipewrite+0xb1>
80103588:	90                   	nop
80103589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103590 <piperead>:
80103590:	55                   	push   %ebp
80103591:	89 e5                	mov    %esp,%ebp
80103593:	57                   	push   %edi
80103594:	56                   	push   %esi
80103595:	53                   	push   %ebx
80103596:	83 ec 18             	sub    $0x18,%esp
80103599:	8b 75 08             	mov    0x8(%ebp),%esi
8010359c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010359f:	56                   	push   %esi
801035a0:	e8 cb 0f 00 00       	call   80104570 <acquire>
801035a5:	83 c4 10             	add    $0x10,%esp
801035a8:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801035ae:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801035b4:	75 6a                	jne    80103620 <piperead+0x90>
801035b6:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
801035bc:	85 db                	test   %ebx,%ebx
801035be:	0f 84 c4 00 00 00    	je     80103688 <piperead+0xf8>
801035c4:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801035ca:	eb 2d                	jmp    801035f9 <piperead+0x69>
801035cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035d0:	83 ec 08             	sub    $0x8,%esp
801035d3:	56                   	push   %esi
801035d4:	53                   	push   %ebx
801035d5:	e8 e6 08 00 00       	call   80103ec0 <sleep>
801035da:	83 c4 10             	add    $0x10,%esp
801035dd:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801035e3:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801035e9:	75 35                	jne    80103620 <piperead+0x90>
801035eb:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
801035f1:	85 d2                	test   %edx,%edx
801035f3:	0f 84 8f 00 00 00    	je     80103688 <piperead+0xf8>
801035f9:	e8 a2 02 00 00       	call   801038a0 <myproc>
801035fe:	8b 48 28             	mov    0x28(%eax),%ecx
80103601:	85 c9                	test   %ecx,%ecx
80103603:	74 cb                	je     801035d0 <piperead+0x40>
80103605:	83 ec 0c             	sub    $0xc,%esp
80103608:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010360d:	56                   	push   %esi
8010360e:	e8 1d 10 00 00       	call   80104630 <release>
80103613:	83 c4 10             	add    $0x10,%esp
80103616:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103619:	89 d8                	mov    %ebx,%eax
8010361b:	5b                   	pop    %ebx
8010361c:	5e                   	pop    %esi
8010361d:	5f                   	pop    %edi
8010361e:	5d                   	pop    %ebp
8010361f:	c3                   	ret    
80103620:	8b 45 10             	mov    0x10(%ebp),%eax
80103623:	85 c0                	test   %eax,%eax
80103625:	7e 61                	jle    80103688 <piperead+0xf8>
80103627:	31 db                	xor    %ebx,%ebx
80103629:	eb 13                	jmp    8010363e <piperead+0xae>
8010362b:	90                   	nop
8010362c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103630:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103636:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
8010363c:	74 1f                	je     8010365d <piperead+0xcd>
8010363e:	8d 41 01             	lea    0x1(%ecx),%eax
80103641:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80103647:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
8010364d:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
80103652:	88 04 1f             	mov    %al,(%edi,%ebx,1)
80103655:	83 c3 01             	add    $0x1,%ebx
80103658:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010365b:	75 d3                	jne    80103630 <piperead+0xa0>
8010365d:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103663:	83 ec 0c             	sub    $0xc,%esp
80103666:	50                   	push   %eax
80103667:	e8 14 0a 00 00       	call   80104080 <wakeup>
8010366c:	89 34 24             	mov    %esi,(%esp)
8010366f:	e8 bc 0f 00 00       	call   80104630 <release>
80103674:	83 c4 10             	add    $0x10,%esp
80103677:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010367a:	89 d8                	mov    %ebx,%eax
8010367c:	5b                   	pop    %ebx
8010367d:	5e                   	pop    %esi
8010367e:	5f                   	pop    %edi
8010367f:	5d                   	pop    %ebp
80103680:	c3                   	ret    
80103681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103688:	31 db                	xor    %ebx,%ebx
8010368a:	eb d1                	jmp    8010365d <piperead+0xcd>
8010368c:	66 90                	xchg   %ax,%ax
8010368e:	66 90                	xchg   %ax,%ax

80103690 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103690:	55                   	push   %ebp
80103691:	89 e5                	mov    %esp,%ebp
80103693:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103694:	bb 34 37 11 80       	mov    $0x80113734,%ebx
{
80103699:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
8010369c:	68 00 37 11 80       	push   $0x80113700
801036a1:	e8 ca 0e 00 00       	call   80104570 <acquire>
801036a6:	83 c4 10             	add    $0x10,%esp
801036a9:	eb 17                	jmp    801036c2 <allocproc+0x32>
801036ab:	90                   	nop
801036ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801036b0:	81 c3 88 00 00 00    	add    $0x88,%ebx
801036b6:	81 fb 34 59 11 80    	cmp    $0x80115934,%ebx
801036bc:	0f 83 8e 00 00 00    	jae    80103750 <allocproc+0xc0>
    if(p->state == UNUSED)
801036c2:	8b 43 10             	mov    0x10(%ebx),%eax
801036c5:	85 c0                	test   %eax,%eax
801036c7:	75 e7                	jne    801036b0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801036c9:	a1 04 a0 10 80       	mov    0x8010a004,%eax

  p->tickets = 1;    //updated
  p->ticks = 0;  // updated

  release(&ptable.lock);
801036ce:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
801036d1:	c7 43 10 01 00 00 00 	movl   $0x1,0x10(%ebx)
  p->tickets = 1;    //updated
801036d8:	c7 83 80 00 00 00 01 	movl   $0x1,0x80(%ebx)
801036df:	00 00 00 
  p->ticks = 0;  // updated
801036e2:	c7 83 84 00 00 00 00 	movl   $0x0,0x84(%ebx)
801036e9:	00 00 00 
  p->pid = nextpid++;
801036ec:	8d 50 01             	lea    0x1(%eax),%edx
801036ef:	89 43 14             	mov    %eax,0x14(%ebx)
  release(&ptable.lock);
801036f2:	68 00 37 11 80       	push   $0x80113700
  p->pid = nextpid++;
801036f7:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  release(&ptable.lock);
801036fd:	e8 2e 0f 00 00       	call   80104630 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103702:	e8 f9 ed ff ff       	call   80102500 <kalloc>
80103707:	83 c4 10             	add    $0x10,%esp
8010370a:	85 c0                	test   %eax,%eax
8010370c:	89 43 08             	mov    %eax,0x8(%ebx)
8010370f:	74 58                	je     80103769 <allocproc+0xd9>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103711:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103717:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
8010371a:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
8010371f:	89 53 1c             	mov    %edx,0x1c(%ebx)
  *(uint*)sp = (uint)trapret;
80103722:	c7 40 14 ff 58 10 80 	movl   $0x801058ff,0x14(%eax)
  p->context = (struct context*)sp;
80103729:	89 43 20             	mov    %eax,0x20(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010372c:	6a 14                	push   $0x14
8010372e:	6a 00                	push   $0x0
80103730:	50                   	push   %eax
80103731:	e8 4a 0f 00 00       	call   80104680 <memset>
  p->context->eip = (uint)forkret;
80103736:	8b 43 20             	mov    0x20(%ebx),%eax

  return p;
80103739:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
8010373c:	c7 40 10 80 37 10 80 	movl   $0x80103780,0x10(%eax)
}
80103743:	89 d8                	mov    %ebx,%eax
80103745:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103748:	c9                   	leave  
80103749:	c3                   	ret    
8010374a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
80103750:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80103753:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
80103755:	68 00 37 11 80       	push   $0x80113700
8010375a:	e8 d1 0e 00 00       	call   80104630 <release>
}
8010375f:	89 d8                	mov    %ebx,%eax
  return 0;
80103761:	83 c4 10             	add    $0x10,%esp
}
80103764:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103767:	c9                   	leave  
80103768:	c3                   	ret    
    p->state = UNUSED;
80103769:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    return 0;
80103770:	31 db                	xor    %ebx,%ebx
80103772:	eb cf                	jmp    80103743 <allocproc+0xb3>
80103774:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010377a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103780 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103780:	55                   	push   %ebp
80103781:	89 e5                	mov    %esp,%ebp
80103783:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103786:	68 00 37 11 80       	push   $0x80113700
8010378b:	e8 a0 0e 00 00       	call   80104630 <release>

  if (first) {
80103790:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103795:	83 c4 10             	add    $0x10,%esp
80103798:	85 c0                	test   %eax,%eax
8010379a:	75 04                	jne    801037a0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010379c:	c9                   	leave  
8010379d:	c3                   	ret    
8010379e:	66 90                	xchg   %ax,%ax
    iinit(ROOTDEV);
801037a0:	83 ec 0c             	sub    $0xc,%esp
    first = 0;
801037a3:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
801037aa:	00 00 00 
    iinit(ROOTDEV);
801037ad:	6a 01                	push   $0x1
801037af:	e8 0c dd ff ff       	call   801014c0 <iinit>
    initlog(ROOTDEV);
801037b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801037bb:	e8 d0 f3 ff ff       	call   80102b90 <initlog>
801037c0:	83 c4 10             	add    $0x10,%esp
}
801037c3:	c9                   	leave  
801037c4:	c3                   	ret    
801037c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801037c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801037d0 <pinit>:
{
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801037d6:	68 55 7a 10 80       	push   $0x80107a55
801037db:	68 00 37 11 80       	push   $0x80113700
801037e0:	e8 4b 0c 00 00       	call   80104430 <initlock>
  sgenrand(unixtime());
801037e5:	e8 56 f2 ff ff       	call   80102a40 <unixtime>
801037ea:	89 04 24             	mov    %eax,(%esp)
801037ed:	e8 3e 3b 00 00       	call   80107330 <sgenrand>
}
801037f2:	83 c4 10             	add    $0x10,%esp
801037f5:	c9                   	leave  
801037f6:	c3                   	ret    
801037f7:	89 f6                	mov    %esi,%esi
801037f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103800 <mycpu>:
{
80103800:	55                   	push   %ebp
80103801:	89 e5                	mov    %esp,%ebp
80103803:	56                   	push   %esi
80103804:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103805:	9c                   	pushf  
80103806:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103807:	f6 c4 02             	test   $0x2,%ah
8010380a:	75 5e                	jne    8010386a <mycpu+0x6a>
  apicid = lapicid();
8010380c:	e8 5f ef ff ff       	call   80102770 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103811:	8b 35 e0 36 11 80    	mov    0x801136e0,%esi
80103817:	85 f6                	test   %esi,%esi
80103819:	7e 42                	jle    8010385d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
8010381b:	0f b6 15 60 31 11 80 	movzbl 0x80113160,%edx
80103822:	39 d0                	cmp    %edx,%eax
80103824:	74 30                	je     80103856 <mycpu+0x56>
80103826:	b9 10 32 11 80       	mov    $0x80113210,%ecx
  for (i = 0; i < ncpu; ++i) {
8010382b:	31 d2                	xor    %edx,%edx
8010382d:	8d 76 00             	lea    0x0(%esi),%esi
80103830:	83 c2 01             	add    $0x1,%edx
80103833:	39 f2                	cmp    %esi,%edx
80103835:	74 26                	je     8010385d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
80103837:	0f b6 19             	movzbl (%ecx),%ebx
8010383a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103840:	39 c3                	cmp    %eax,%ebx
80103842:	75 ec                	jne    80103830 <mycpu+0x30>
80103844:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
8010384a:	05 60 31 11 80       	add    $0x80113160,%eax
}
8010384f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103852:	5b                   	pop    %ebx
80103853:	5e                   	pop    %esi
80103854:	5d                   	pop    %ebp
80103855:	c3                   	ret    
    if (cpus[i].apicid == apicid)
80103856:	b8 60 31 11 80       	mov    $0x80113160,%eax
      return &cpus[i];
8010385b:	eb f2                	jmp    8010384f <mycpu+0x4f>
  panic("unknown apicid\n");
8010385d:	83 ec 0c             	sub    $0xc,%esp
80103860:	68 5c 7a 10 80       	push   $0x80107a5c
80103865:	e8 26 cb ff ff       	call   80100390 <panic>
    panic("mycpu called with interrupts enabled\n");
8010386a:	83 ec 0c             	sub    $0xc,%esp
8010386d:	68 3c 7b 10 80       	push   $0x80107b3c
80103872:	e8 19 cb ff ff       	call   80100390 <panic>
80103877:	89 f6                	mov    %esi,%esi
80103879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103880 <cpuid>:
cpuid() {
80103880:	55                   	push   %ebp
80103881:	89 e5                	mov    %esp,%ebp
80103883:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103886:	e8 75 ff ff ff       	call   80103800 <mycpu>
8010388b:	2d 60 31 11 80       	sub    $0x80113160,%eax
}
80103890:	c9                   	leave  
  return mycpu()-cpus;
80103891:	c1 f8 04             	sar    $0x4,%eax
80103894:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010389a:	c3                   	ret    
8010389b:	90                   	nop
8010389c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801038a0 <myproc>:
myproc(void) {
801038a0:	55                   	push   %ebp
801038a1:	89 e5                	mov    %esp,%ebp
801038a3:	53                   	push   %ebx
801038a4:	83 ec 04             	sub    $0x4,%esp
  pushcli();
801038a7:	e8 f4 0b 00 00       	call   801044a0 <pushcli>
  c = mycpu();
801038ac:	e8 4f ff ff ff       	call   80103800 <mycpu>
  p = c->proc;
801038b1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038b7:	e8 24 0c 00 00       	call   801044e0 <popcli>
}
801038bc:	83 c4 04             	add    $0x4,%esp
801038bf:	89 d8                	mov    %ebx,%eax
801038c1:	5b                   	pop    %ebx
801038c2:	5d                   	pop    %ebp
801038c3:	c3                   	ret    
801038c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801038ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801038d0 <userinit>:
{
801038d0:	55                   	push   %ebp
801038d1:	89 e5                	mov    %esp,%ebp
801038d3:	53                   	push   %ebx
801038d4:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
801038d7:	e8 b4 fd ff ff       	call   80103690 <allocproc>
801038dc:	89 c3                	mov    %eax,%ebx
  initproc = p;
801038de:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
801038e3:	e8 e8 35 00 00       	call   80106ed0 <setupkvm>
801038e8:	85 c0                	test   %eax,%eax
801038ea:	89 43 04             	mov    %eax,0x4(%ebx)
801038ed:	0f 84 bd 00 00 00    	je     801039b0 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801038f3:	83 ec 04             	sub    $0x4,%esp
801038f6:	68 2c 00 00 00       	push   $0x2c
801038fb:	68 64 a4 10 80       	push   $0x8010a464
80103900:	50                   	push   %eax
80103901:	e8 aa 32 00 00       	call   80106bb0 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
80103906:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103909:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010390f:	6a 4c                	push   $0x4c
80103911:	6a 00                	push   $0x0
80103913:	ff 73 1c             	pushl  0x1c(%ebx)
80103916:	e8 65 0d 00 00       	call   80104680 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010391b:	8b 43 1c             	mov    0x1c(%ebx),%eax
8010391e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103923:	b9 23 00 00 00       	mov    $0x23,%ecx
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103928:	83 c4 0c             	add    $0xc,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010392b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010392f:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103932:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103936:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103939:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010393d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103941:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103944:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103948:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010394c:	8b 43 1c             	mov    0x1c(%ebx),%eax
8010394f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103956:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103959:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103960:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103963:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
8010396a:	8d 43 70             	lea    0x70(%ebx),%eax
8010396d:	6a 10                	push   $0x10
8010396f:	68 85 7a 10 80       	push   $0x80107a85
80103974:	50                   	push   %eax
80103975:	e8 e6 0e 00 00       	call   80104860 <safestrcpy>
  p->cwd = namei("/");
8010397a:	c7 04 24 8e 7a 10 80 	movl   $0x80107a8e,(%esp)
80103981:	e8 9a e5 ff ff       	call   80101f20 <namei>
80103986:	89 43 6c             	mov    %eax,0x6c(%ebx)
  acquire(&ptable.lock);
80103989:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103990:	e8 db 0b 00 00       	call   80104570 <acquire>
  p->state = RUNNABLE;
80103995:	c7 43 10 03 00 00 00 	movl   $0x3,0x10(%ebx)
  release(&ptable.lock);
8010399c:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
801039a3:	e8 88 0c 00 00       	call   80104630 <release>
}
801039a8:	83 c4 10             	add    $0x10,%esp
801039ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801039ae:	c9                   	leave  
801039af:	c3                   	ret    
    panic("userinit: out of memory?");
801039b0:	83 ec 0c             	sub    $0xc,%esp
801039b3:	68 6c 7a 10 80       	push   $0x80107a6c
801039b8:	e8 d3 c9 ff ff       	call   80100390 <panic>
801039bd:	8d 76 00             	lea    0x0(%esi),%esi

801039c0 <growproc>:
{
801039c0:	55                   	push   %ebp
801039c1:	89 e5                	mov    %esp,%ebp
801039c3:	56                   	push   %esi
801039c4:	53                   	push   %ebx
801039c5:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
801039c8:	e8 d3 0a 00 00       	call   801044a0 <pushcli>
  c = mycpu();
801039cd:	e8 2e fe ff ff       	call   80103800 <mycpu>
  p = c->proc;
801039d2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801039d8:	e8 03 0b 00 00       	call   801044e0 <popcli>
  if(n > 0){
801039dd:	83 fe 00             	cmp    $0x0,%esi
  sz = curproc->sz;
801039e0:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
801039e2:	7f 1c                	jg     80103a00 <growproc+0x40>
  } else if(n < 0){
801039e4:	75 3a                	jne    80103a20 <growproc+0x60>
  switchuvm(curproc);
801039e6:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
801039e9:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801039eb:	53                   	push   %ebx
801039ec:	e8 af 30 00 00       	call   80106aa0 <switchuvm>
  return 0;
801039f1:	83 c4 10             	add    $0x10,%esp
801039f4:	31 c0                	xor    %eax,%eax
}
801039f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801039f9:	5b                   	pop    %ebx
801039fa:	5e                   	pop    %esi
801039fb:	5d                   	pop    %ebp
801039fc:	c3                   	ret    
801039fd:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a00:	83 ec 04             	sub    $0x4,%esp
80103a03:	01 c6                	add    %eax,%esi
80103a05:	56                   	push   %esi
80103a06:	50                   	push   %eax
80103a07:	ff 73 04             	pushl  0x4(%ebx)
80103a0a:	e8 e1 32 00 00       	call   80106cf0 <allocuvm>
80103a0f:	83 c4 10             	add    $0x10,%esp
80103a12:	85 c0                	test   %eax,%eax
80103a14:	75 d0                	jne    801039e6 <growproc+0x26>
      return -1;
80103a16:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a1b:	eb d9                	jmp    801039f6 <growproc+0x36>
80103a1d:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a20:	83 ec 04             	sub    $0x4,%esp
80103a23:	01 c6                	add    %eax,%esi
80103a25:	56                   	push   %esi
80103a26:	50                   	push   %eax
80103a27:	ff 73 04             	pushl  0x4(%ebx)
80103a2a:	e8 f1 33 00 00       	call   80106e20 <deallocuvm>
80103a2f:	83 c4 10             	add    $0x10,%esp
80103a32:	85 c0                	test   %eax,%eax
80103a34:	75 b0                	jne    801039e6 <growproc+0x26>
80103a36:	eb de                	jmp    80103a16 <growproc+0x56>
80103a38:	90                   	nop
80103a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103a40 <fork>:
{
80103a40:	55                   	push   %ebp
80103a41:	89 e5                	mov    %esp,%ebp
80103a43:	57                   	push   %edi
80103a44:	56                   	push   %esi
80103a45:	53                   	push   %ebx
80103a46:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103a49:	e8 52 0a 00 00       	call   801044a0 <pushcli>
  c = mycpu();
80103a4e:	e8 ad fd ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103a53:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a59:	e8 82 0a 00 00       	call   801044e0 <popcli>
  if((np = allocproc()) == 0){
80103a5e:	e8 2d fc ff ff       	call   80103690 <allocproc>
80103a63:	85 c0                	test   %eax,%eax
80103a65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103a68:	0f 84 c7 00 00 00    	je     80103b35 <fork+0xf5>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103a6e:	83 ec 08             	sub    $0x8,%esp
80103a71:	ff 33                	pushl  (%ebx)
80103a73:	ff 73 04             	pushl  0x4(%ebx)
80103a76:	89 c7                	mov    %eax,%edi
80103a78:	e8 23 35 00 00       	call   80106fa0 <copyuvm>
80103a7d:	83 c4 10             	add    $0x10,%esp
80103a80:	85 c0                	test   %eax,%eax
80103a82:	89 47 04             	mov    %eax,0x4(%edi)
80103a85:	0f 84 b1 00 00 00    	je     80103b3c <fork+0xfc>
  np->tickets = curproc->tickets;
80103a8b:	8b 83 80 00 00 00    	mov    0x80(%ebx),%eax
80103a91:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103a94:	89 81 80 00 00 00    	mov    %eax,0x80(%ecx)
  np->sz = curproc->sz;
80103a9a:	8b 03                	mov    (%ebx),%eax
  *np->tf = *curproc->tf;
80103a9c:	8b 79 1c             	mov    0x1c(%ecx),%edi
  np->parent = curproc;
80103a9f:	89 59 18             	mov    %ebx,0x18(%ecx)
  np->sz = curproc->sz;
80103aa2:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
80103aa4:	89 c8                	mov    %ecx,%eax
  *np->tf = *curproc->tf;
80103aa6:	8b 73 1c             	mov    0x1c(%ebx),%esi
80103aa9:	b9 13 00 00 00       	mov    $0x13,%ecx
80103aae:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
80103ab0:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103ab2:	8b 40 1c             	mov    0x1c(%eax),%eax
80103ab5:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[i])
80103ac0:	8b 44 b3 2c          	mov    0x2c(%ebx,%esi,4),%eax
80103ac4:	85 c0                	test   %eax,%eax
80103ac6:	74 13                	je     80103adb <fork+0x9b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103ac8:	83 ec 0c             	sub    $0xc,%esp
80103acb:	50                   	push   %eax
80103acc:	e8 5f d3 ff ff       	call   80100e30 <filedup>
80103ad1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103ad4:	83 c4 10             	add    $0x10,%esp
80103ad7:	89 44 b2 2c          	mov    %eax,0x2c(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103adb:	83 c6 01             	add    $0x1,%esi
80103ade:	83 fe 10             	cmp    $0x10,%esi
80103ae1:	75 dd                	jne    80103ac0 <fork+0x80>
  np->cwd = idup(curproc->cwd);
80103ae3:	83 ec 0c             	sub    $0xc,%esp
80103ae6:	ff 73 6c             	pushl  0x6c(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103ae9:	83 c3 70             	add    $0x70,%ebx
  np->cwd = idup(curproc->cwd);
80103aec:	e8 9f db ff ff       	call   80101690 <idup>
80103af1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103af4:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
80103af7:	89 47 6c             	mov    %eax,0x6c(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103afa:	8d 47 70             	lea    0x70(%edi),%eax
80103afd:	6a 10                	push   $0x10
80103aff:	53                   	push   %ebx
80103b00:	50                   	push   %eax
80103b01:	e8 5a 0d 00 00       	call   80104860 <safestrcpy>
  pid = np->pid;
80103b06:	8b 5f 14             	mov    0x14(%edi),%ebx
  acquire(&ptable.lock);
80103b09:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103b10:	e8 5b 0a 00 00       	call   80104570 <acquire>
  np->state = RUNNABLE;
80103b15:	c7 47 10 03 00 00 00 	movl   $0x3,0x10(%edi)
  release(&ptable.lock);
80103b1c:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103b23:	e8 08 0b 00 00       	call   80104630 <release>
  return pid;
80103b28:	83 c4 10             	add    $0x10,%esp
}
80103b2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103b2e:	89 d8                	mov    %ebx,%eax
80103b30:	5b                   	pop    %ebx
80103b31:	5e                   	pop    %esi
80103b32:	5f                   	pop    %edi
80103b33:	5d                   	pop    %ebp
80103b34:	c3                   	ret    
    return -1;
80103b35:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b3a:	eb ef                	jmp    80103b2b <fork+0xeb>
    kfree(np->kstack);
80103b3c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103b3f:	83 ec 0c             	sub    $0xc,%esp
80103b42:	ff 73 08             	pushl  0x8(%ebx)
80103b45:	e8 06 e8 ff ff       	call   80102350 <kfree>
    np->kstack = 0;
80103b4a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103b51:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    return -1;
80103b58:	83 c4 10             	add    $0x10,%esp
80103b5b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b60:	eb c9                	jmp    80103b2b <fork+0xeb>
80103b62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b70 <getrpt>:
getrpt(void){   // get total number of tickets for runnable processes
80103b70:	55                   	push   %ebp
  int total_process_tickets=0;
80103b71:	31 c0                	xor    %eax,%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)  //You have access to the entire xv6 source presumably, which means that you can add a function in proc.c
80103b73:	ba 34 37 11 80       	mov    $0x80113734,%edx
getrpt(void){   // get total number of tickets for runnable processes
80103b78:	89 e5                	mov    %esp,%ebp
80103b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(p->state==RUNNABLE){
80103b80:	83 7a 10 03          	cmpl   $0x3,0x10(%edx)
80103b84:	75 06                	jne    80103b8c <getrpt+0x1c>
      total_process_tickets+=p->tickets;  
80103b86:	03 82 80 00 00 00    	add    0x80(%edx),%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)  //You have access to the entire xv6 source presumably, which means that you can add a function in proc.c
80103b8c:	81 c2 88 00 00 00    	add    $0x88,%edx
80103b92:	81 fa 34 59 11 80    	cmp    $0x80115934,%edx
80103b98:	72 e6                	jb     80103b80 <getrpt+0x10>
}
80103b9a:	5d                   	pop    %ebp
80103b9b:	c3                   	ret    
80103b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103ba0 <scheduler>:
{
80103ba0:	55                   	push   %ebp
80103ba1:	89 e5                	mov    %esp,%ebp
80103ba3:	57                   	push   %edi
80103ba4:	56                   	push   %esi
80103ba5:	53                   	push   %ebx
80103ba6:	83 ec 1c             	sub    $0x1c,%esp
  struct cpu *c = mycpu();  // Per-CPU state
80103ba9:	e8 52 fc ff ff       	call   80103800 <mycpu>
  c->proc = 0;
80103bae:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103bb5:	00 00 00 
  struct cpu *c = mycpu();  // Per-CPU state
80103bb8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103bbb:	83 c0 04             	add    $0x4,%eax
80103bbe:	89 45 e0             	mov    %eax,-0x20(%ebp)
80103bc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103bc8:	fb                   	sti    
    acquire(&ptable.lock);                 
80103bc9:	83 ec 0c             	sub    $0xc,%esp
80103bcc:	68 00 37 11 80       	push   $0x80113700
80103bd1:	e8 9a 09 00 00       	call   80104570 <acquire>
80103bd6:	83 c4 10             	add    $0x10,%esp
  int total_process_tickets=0;
80103bd9:	31 d2                	xor    %edx,%edx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)  //You have access to the entire xv6 source presumably, which means that you can add a function in proc.c
80103bdb:	b8 34 37 11 80       	mov    $0x80113734,%eax
    if(p->state==RUNNABLE){
80103be0:	83 78 10 03          	cmpl   $0x3,0x10(%eax)
80103be4:	75 06                	jne    80103bec <scheduler+0x4c>
      total_process_tickets+=p->tickets;  
80103be6:	03 90 80 00 00 00    	add    0x80(%eax),%edx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)  //You have access to the entire xv6 source presumably, which means that you can add a function in proc.c
80103bec:	05 88 00 00 00       	add    $0x88,%eax
80103bf1:	3d 34 59 11 80       	cmp    $0x80115934,%eax
80103bf6:	72 e8                	jb     80103be0 <scheduler+0x40>
    win = random_at_most(getrpt());       //You will need to add a psuedorandom number generator to the kernel to get a random number between 1 and total_tickets
80103bf8:	83 ec 0c             	sub    $0xc,%esp
	   long count = 0;
80103bfb:	31 f6                	xor    %esi,%esi
 for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bfd:	bf 34 37 11 80       	mov    $0x80113734,%edi
    win = random_at_most(getrpt());       //You will need to add a psuedorandom number generator to the kernel to get a random number between 1 and total_tickets
80103c02:	52                   	push   %edx
80103c03:	e8 b8 38 00 00       	call   801074c0 <random_at_most>
80103c08:	83 c4 10             	add    $0x10,%esp
80103c0b:	89 c3                	mov    %eax,%ebx
80103c0d:	8d 76 00             	lea    0x0(%esi),%esi
	 if(p->state == RUNNABLE)  count += p->tickets;  // sum of tickets of runnable process
80103c10:	83 7f 10 03          	cmpl   $0x3,0x10(%edi)
80103c14:	75 3f                	jne    80103c55 <scheduler+0xb5>
80103c16:	03 b7 80 00 00 00    	add    0x80(%edi),%esi
        if (count > win){   //  It is the chosen process job  / release ptable.lock / then reacquire it before jumping back to us.
80103c1c:	39 f3                	cmp    %esi,%ebx
80103c1e:	7d 35                	jge    80103c55 <scheduler+0xb5>
             c->proc = p;
80103c20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
             switchuvm(p);     //The OS loads the process information to run it. After having loaded the process  
80103c23:	83 ec 0c             	sub    $0xc,%esp
             c->proc = p;
80103c26:	89 b8 ac 00 00 00    	mov    %edi,0xac(%eax)
             switchuvm(p);     //The OS loads the process information to run it. After having loaded the process  
80103c2c:	57                   	push   %edi
80103c2d:	e8 6e 2e 00 00       	call   80106aa0 <switchuvm>
             swtch(&(c->scheduler), p->context);   // the processor switches to execute it
80103c32:	58                   	pop    %eax
80103c33:	5a                   	pop    %edx
80103c34:	ff 77 20             	pushl  0x20(%edi)
80103c37:	ff 75 e0             	pushl  -0x20(%ebp)
             p->state = RUNNING; // The process is marked running
80103c3a:	c7 47 10 04 00 00 00 	movl   $0x4,0x10(%edi)
             p->ticks++;   // increase no of times that processes has been chosen
80103c41:	83 87 84 00 00 00 01 	addl   $0x1,0x84(%edi)
             swtch(&(c->scheduler), p->context);   // the processor switches to execute it
80103c48:	e8 6e 0c 00 00       	call   801048bb <swtch>
             switchkvm();     //  When the process comes back to scheduler (so after the swtch) the kernel load its memory
80103c4d:	e8 2e 2e 00 00       	call   80106a80 <switchkvm>
80103c52:	83 c4 10             	add    $0x10,%esp
 for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c55:	81 c7 88 00 00 00    	add    $0x88,%edi
80103c5b:	81 ff 34 59 11 80    	cmp    $0x80115934,%edi
80103c61:	72 ad                	jb     80103c10 <scheduler+0x70>
    release(&ptable.lock);
80103c63:	83 ec 0c             	sub    $0xc,%esp
80103c66:	68 00 37 11 80       	push   $0x80113700
80103c6b:	e8 c0 09 00 00       	call   80104630 <release>
  for(;;){
80103c70:	83 c4 10             	add    $0x10,%esp
80103c73:	e9 50 ff ff ff       	jmp    80103bc8 <scheduler+0x28>
80103c78:	90                   	nop
80103c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103c80 <sched>:
{
80103c80:	55                   	push   %ebp
80103c81:	89 e5                	mov    %esp,%ebp
80103c83:	56                   	push   %esi
80103c84:	53                   	push   %ebx
  pushcli();
80103c85:	e8 16 08 00 00       	call   801044a0 <pushcli>
  c = mycpu();
80103c8a:	e8 71 fb ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103c8f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103c95:	e8 46 08 00 00       	call   801044e0 <popcli>
  if(!holding(&ptable.lock))
80103c9a:	83 ec 0c             	sub    $0xc,%esp
80103c9d:	68 00 37 11 80       	push   $0x80113700
80103ca2:	e8 99 08 00 00       	call   80104540 <holding>
80103ca7:	83 c4 10             	add    $0x10,%esp
80103caa:	85 c0                	test   %eax,%eax
80103cac:	74 4f                	je     80103cfd <sched+0x7d>
  if(mycpu()->ncli != 1)
80103cae:	e8 4d fb ff ff       	call   80103800 <mycpu>
80103cb3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103cba:	75 68                	jne    80103d24 <sched+0xa4>
  if(p->state == RUNNING)
80103cbc:	83 7b 10 04          	cmpl   $0x4,0x10(%ebx)
80103cc0:	74 55                	je     80103d17 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103cc2:	9c                   	pushf  
80103cc3:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103cc4:	f6 c4 02             	test   $0x2,%ah
80103cc7:	75 41                	jne    80103d0a <sched+0x8a>
  intena = mycpu()->intena;
80103cc9:	e8 32 fb ff ff       	call   80103800 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103cce:	83 c3 20             	add    $0x20,%ebx
  intena = mycpu()->intena;
80103cd1:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103cd7:	e8 24 fb ff ff       	call   80103800 <mycpu>
80103cdc:	83 ec 08             	sub    $0x8,%esp
80103cdf:	ff 70 04             	pushl  0x4(%eax)
80103ce2:	53                   	push   %ebx
80103ce3:	e8 d3 0b 00 00       	call   801048bb <swtch>
  mycpu()->intena = intena;
80103ce8:	e8 13 fb ff ff       	call   80103800 <mycpu>
}
80103ced:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103cf0:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103cf6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103cf9:	5b                   	pop    %ebx
80103cfa:	5e                   	pop    %esi
80103cfb:	5d                   	pop    %ebp
80103cfc:	c3                   	ret    
    panic("sched ptable.lock");
80103cfd:	83 ec 0c             	sub    $0xc,%esp
80103d00:	68 90 7a 10 80       	push   $0x80107a90
80103d05:	e8 86 c6 ff ff       	call   80100390 <panic>
    panic("sched interruptible");
80103d0a:	83 ec 0c             	sub    $0xc,%esp
80103d0d:	68 bc 7a 10 80       	push   $0x80107abc
80103d12:	e8 79 c6 ff ff       	call   80100390 <panic>
    panic("sched running");
80103d17:	83 ec 0c             	sub    $0xc,%esp
80103d1a:	68 ae 7a 10 80       	push   $0x80107aae
80103d1f:	e8 6c c6 ff ff       	call   80100390 <panic>
    panic("sched locks");
80103d24:	83 ec 0c             	sub    $0xc,%esp
80103d27:	68 a2 7a 10 80       	push   $0x80107aa2
80103d2c:	e8 5f c6 ff ff       	call   80100390 <panic>
80103d31:	eb 0d                	jmp    80103d40 <exit>
80103d33:	90                   	nop
80103d34:	90                   	nop
80103d35:	90                   	nop
80103d36:	90                   	nop
80103d37:	90                   	nop
80103d38:	90                   	nop
80103d39:	90                   	nop
80103d3a:	90                   	nop
80103d3b:	90                   	nop
80103d3c:	90                   	nop
80103d3d:	90                   	nop
80103d3e:	90                   	nop
80103d3f:	90                   	nop

80103d40 <exit>:
{
80103d40:	55                   	push   %ebp
80103d41:	89 e5                	mov    %esp,%ebp
80103d43:	57                   	push   %edi
80103d44:	56                   	push   %esi
80103d45:	53                   	push   %ebx
80103d46:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
80103d49:	e8 52 07 00 00       	call   801044a0 <pushcli>
  c = mycpu();
80103d4e:	e8 ad fa ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103d53:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103d59:	e8 82 07 00 00       	call   801044e0 <popcli>
  if(curproc == initproc)
80103d5e:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103d64:	8d 5e 2c             	lea    0x2c(%esi),%ebx
80103d67:	8d 7e 6c             	lea    0x6c(%esi),%edi
80103d6a:	0f 84 f1 00 00 00    	je     80103e61 <exit+0x121>
    if(curproc->ofile[fd]){
80103d70:	8b 03                	mov    (%ebx),%eax
80103d72:	85 c0                	test   %eax,%eax
80103d74:	74 12                	je     80103d88 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103d76:	83 ec 0c             	sub    $0xc,%esp
80103d79:	50                   	push   %eax
80103d7a:	e8 01 d1 ff ff       	call   80100e80 <fileclose>
      curproc->ofile[fd] = 0;
80103d7f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103d85:	83 c4 10             	add    $0x10,%esp
80103d88:	83 c3 04             	add    $0x4,%ebx
  for(fd = 0; fd < NOFILE; fd++){
80103d8b:	39 fb                	cmp    %edi,%ebx
80103d8d:	75 e1                	jne    80103d70 <exit+0x30>
  begin_op();
80103d8f:	e8 9c ee ff ff       	call   80102c30 <begin_op>
  iput(curproc->cwd);
80103d94:	83 ec 0c             	sub    $0xc,%esp
80103d97:	ff 76 6c             	pushl  0x6c(%esi)
80103d9a:	e8 51 da ff ff       	call   801017f0 <iput>
  end_op();
80103d9f:	e8 fc ee ff ff       	call   80102ca0 <end_op>
  curproc->cwd = 0;
80103da4:	c7 46 6c 00 00 00 00 	movl   $0x0,0x6c(%esi)
  acquire(&ptable.lock);
80103dab:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103db2:	e8 b9 07 00 00       	call   80104570 <acquire>
  wakeup1(curproc->parent);
80103db7:	8b 56 18             	mov    0x18(%esi),%edx
80103dba:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103dbd:	b8 34 37 11 80       	mov    $0x80113734,%eax
80103dc2:	eb 10                	jmp    80103dd4 <exit+0x94>
80103dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103dc8:	05 88 00 00 00       	add    $0x88,%eax
80103dcd:	3d 34 59 11 80       	cmp    $0x80115934,%eax
80103dd2:	73 1e                	jae    80103df2 <exit+0xb2>
    if(p->state == SLEEPING && p->chan == chan)
80103dd4:	83 78 10 02          	cmpl   $0x2,0x10(%eax)
80103dd8:	75 ee                	jne    80103dc8 <exit+0x88>
80103dda:	3b 50 24             	cmp    0x24(%eax),%edx
80103ddd:	75 e9                	jne    80103dc8 <exit+0x88>
      p->state = RUNNABLE;
80103ddf:	c7 40 10 03 00 00 00 	movl   $0x3,0x10(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103de6:	05 88 00 00 00       	add    $0x88,%eax
80103deb:	3d 34 59 11 80       	cmp    $0x80115934,%eax
80103df0:	72 e2                	jb     80103dd4 <exit+0x94>
      p->parent = initproc;
80103df2:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103df8:	ba 34 37 11 80       	mov    $0x80113734,%edx
80103dfd:	eb 0f                	jmp    80103e0e <exit+0xce>
80103dff:	90                   	nop
80103e00:	81 c2 88 00 00 00    	add    $0x88,%edx
80103e06:	81 fa 34 59 11 80    	cmp    $0x80115934,%edx
80103e0c:	73 3a                	jae    80103e48 <exit+0x108>
    if(p->parent == curproc){
80103e0e:	39 72 18             	cmp    %esi,0x18(%edx)
80103e11:	75 ed                	jne    80103e00 <exit+0xc0>
      if(p->state == ZOMBIE)
80103e13:	83 7a 10 05          	cmpl   $0x5,0x10(%edx)
      p->parent = initproc;
80103e17:	89 4a 18             	mov    %ecx,0x18(%edx)
      if(p->state == ZOMBIE)
80103e1a:	75 e4                	jne    80103e00 <exit+0xc0>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e1c:	b8 34 37 11 80       	mov    $0x80113734,%eax
80103e21:	eb 11                	jmp    80103e34 <exit+0xf4>
80103e23:	90                   	nop
80103e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e28:	05 88 00 00 00       	add    $0x88,%eax
80103e2d:	3d 34 59 11 80       	cmp    $0x80115934,%eax
80103e32:	73 cc                	jae    80103e00 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103e34:	83 78 10 02          	cmpl   $0x2,0x10(%eax)
80103e38:	75 ee                	jne    80103e28 <exit+0xe8>
80103e3a:	3b 48 24             	cmp    0x24(%eax),%ecx
80103e3d:	75 e9                	jne    80103e28 <exit+0xe8>
      p->state = RUNNABLE;
80103e3f:	c7 40 10 03 00 00 00 	movl   $0x3,0x10(%eax)
80103e46:	eb e0                	jmp    80103e28 <exit+0xe8>
  curproc->state = ZOMBIE;
80103e48:	c7 46 10 05 00 00 00 	movl   $0x5,0x10(%esi)
  sched();
80103e4f:	e8 2c fe ff ff       	call   80103c80 <sched>
  panic("zombie exit");
80103e54:	83 ec 0c             	sub    $0xc,%esp
80103e57:	68 dd 7a 10 80       	push   $0x80107add
80103e5c:	e8 2f c5 ff ff       	call   80100390 <panic>
    panic("init exiting");
80103e61:	83 ec 0c             	sub    $0xc,%esp
80103e64:	68 d0 7a 10 80       	push   $0x80107ad0
80103e69:	e8 22 c5 ff ff       	call   80100390 <panic>
80103e6e:	66 90                	xchg   %ax,%ax

80103e70 <yield>:
{
80103e70:	55                   	push   %ebp
80103e71:	89 e5                	mov    %esp,%ebp
80103e73:	53                   	push   %ebx
80103e74:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103e77:	68 00 37 11 80       	push   $0x80113700
80103e7c:	e8 ef 06 00 00       	call   80104570 <acquire>
  pushcli();
80103e81:	e8 1a 06 00 00       	call   801044a0 <pushcli>
  c = mycpu();
80103e86:	e8 75 f9 ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103e8b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103e91:	e8 4a 06 00 00       	call   801044e0 <popcli>
  myproc()->state = RUNNABLE;
80103e96:	c7 43 10 03 00 00 00 	movl   $0x3,0x10(%ebx)
  sched();
80103e9d:	e8 de fd ff ff       	call   80103c80 <sched>
  release(&ptable.lock);
80103ea2:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103ea9:	e8 82 07 00 00       	call   80104630 <release>
}
80103eae:	83 c4 10             	add    $0x10,%esp
80103eb1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103eb4:	c9                   	leave  
80103eb5:	c3                   	ret    
80103eb6:	8d 76 00             	lea    0x0(%esi),%esi
80103eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ec0 <sleep>:
{
80103ec0:	55                   	push   %ebp
80103ec1:	89 e5                	mov    %esp,%ebp
80103ec3:	57                   	push   %edi
80103ec4:	56                   	push   %esi
80103ec5:	53                   	push   %ebx
80103ec6:	83 ec 0c             	sub    $0xc,%esp
80103ec9:	8b 7d 08             	mov    0x8(%ebp),%edi
80103ecc:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
80103ecf:	e8 cc 05 00 00       	call   801044a0 <pushcli>
  c = mycpu();
80103ed4:	e8 27 f9 ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103ed9:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103edf:	e8 fc 05 00 00       	call   801044e0 <popcli>
  if(p == 0)
80103ee4:	85 db                	test   %ebx,%ebx
80103ee6:	0f 84 87 00 00 00    	je     80103f73 <sleep+0xb3>
  if(lk == 0)
80103eec:	85 f6                	test   %esi,%esi
80103eee:	74 76                	je     80103f66 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103ef0:	81 fe 00 37 11 80    	cmp    $0x80113700,%esi
80103ef6:	74 50                	je     80103f48 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103ef8:	83 ec 0c             	sub    $0xc,%esp
80103efb:	68 00 37 11 80       	push   $0x80113700
80103f00:	e8 6b 06 00 00       	call   80104570 <acquire>
    release(lk);
80103f05:	89 34 24             	mov    %esi,(%esp)
80103f08:	e8 23 07 00 00       	call   80104630 <release>
  p->chan = chan;
80103f0d:	89 7b 24             	mov    %edi,0x24(%ebx)
  p->state = SLEEPING;
80103f10:	c7 43 10 02 00 00 00 	movl   $0x2,0x10(%ebx)
  sched();
80103f17:	e8 64 fd ff ff       	call   80103c80 <sched>
  p->chan = 0;
80103f1c:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
    release(&ptable.lock);
80103f23:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103f2a:	e8 01 07 00 00       	call   80104630 <release>
    acquire(lk);
80103f2f:	89 75 08             	mov    %esi,0x8(%ebp)
80103f32:	83 c4 10             	add    $0x10,%esp
}
80103f35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f38:	5b                   	pop    %ebx
80103f39:	5e                   	pop    %esi
80103f3a:	5f                   	pop    %edi
80103f3b:	5d                   	pop    %ebp
    acquire(lk);
80103f3c:	e9 2f 06 00 00       	jmp    80104570 <acquire>
80103f41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
80103f48:	89 7b 24             	mov    %edi,0x24(%ebx)
  p->state = SLEEPING;
80103f4b:	c7 43 10 02 00 00 00 	movl   $0x2,0x10(%ebx)
  sched();
80103f52:	e8 29 fd ff ff       	call   80103c80 <sched>
  p->chan = 0;
80103f57:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
}
80103f5e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f61:	5b                   	pop    %ebx
80103f62:	5e                   	pop    %esi
80103f63:	5f                   	pop    %edi
80103f64:	5d                   	pop    %ebp
80103f65:	c3                   	ret    
    panic("sleep without lk");
80103f66:	83 ec 0c             	sub    $0xc,%esp
80103f69:	68 ef 7a 10 80       	push   $0x80107aef
80103f6e:	e8 1d c4 ff ff       	call   80100390 <panic>
    panic("sleep");
80103f73:	83 ec 0c             	sub    $0xc,%esp
80103f76:	68 e9 7a 10 80       	push   $0x80107ae9
80103f7b:	e8 10 c4 ff ff       	call   80100390 <panic>

80103f80 <wait>:
{
80103f80:	55                   	push   %ebp
80103f81:	89 e5                	mov    %esp,%ebp
80103f83:	56                   	push   %esi
80103f84:	53                   	push   %ebx
  pushcli();
80103f85:	e8 16 05 00 00       	call   801044a0 <pushcli>
  c = mycpu();
80103f8a:	e8 71 f8 ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103f8f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103f95:	e8 46 05 00 00       	call   801044e0 <popcli>
  acquire(&ptable.lock);
80103f9a:	83 ec 0c             	sub    $0xc,%esp
80103f9d:	68 00 37 11 80       	push   $0x80113700
80103fa2:	e8 c9 05 00 00       	call   80104570 <acquire>
80103fa7:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
80103faa:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fac:	bb 34 37 11 80       	mov    $0x80113734,%ebx
80103fb1:	eb 13                	jmp    80103fc6 <wait+0x46>
80103fb3:	90                   	nop
80103fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fb8:	81 c3 88 00 00 00    	add    $0x88,%ebx
80103fbe:	81 fb 34 59 11 80    	cmp    $0x80115934,%ebx
80103fc4:	73 1e                	jae    80103fe4 <wait+0x64>
      if(p->parent != curproc)
80103fc6:	39 73 18             	cmp    %esi,0x18(%ebx)
80103fc9:	75 ed                	jne    80103fb8 <wait+0x38>
      if(p->state == ZOMBIE){
80103fcb:	83 7b 10 05          	cmpl   $0x5,0x10(%ebx)
80103fcf:	74 37                	je     80104008 <wait+0x88>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fd1:	81 c3 88 00 00 00    	add    $0x88,%ebx
      havekids = 1;
80103fd7:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fdc:	81 fb 34 59 11 80    	cmp    $0x80115934,%ebx
80103fe2:	72 e2                	jb     80103fc6 <wait+0x46>
    if(!havekids || curproc->killed){
80103fe4:	85 c0                	test   %eax,%eax
80103fe6:	74 76                	je     8010405e <wait+0xde>
80103fe8:	8b 46 28             	mov    0x28(%esi),%eax
80103feb:	85 c0                	test   %eax,%eax
80103fed:	75 6f                	jne    8010405e <wait+0xde>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103fef:	83 ec 08             	sub    $0x8,%esp
80103ff2:	68 00 37 11 80       	push   $0x80113700
80103ff7:	56                   	push   %esi
80103ff8:	e8 c3 fe ff ff       	call   80103ec0 <sleep>
    havekids = 0;
80103ffd:	83 c4 10             	add    $0x10,%esp
80104000:	eb a8                	jmp    80103faa <wait+0x2a>
80104002:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        kfree(p->kstack);
80104008:	83 ec 0c             	sub    $0xc,%esp
8010400b:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
8010400e:	8b 73 14             	mov    0x14(%ebx),%esi
        kfree(p->kstack);
80104011:	e8 3a e3 ff ff       	call   80102350 <kfree>
        freevm(p->pgdir);
80104016:	5a                   	pop    %edx
80104017:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
8010401a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80104021:	e8 2a 2e 00 00       	call   80106e50 <freevm>
        release(&ptable.lock);
80104026:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
        p->pid = 0;
8010402d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->parent = 0;
80104034:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
        p->name[0] = 0;
8010403b:	c6 43 70 00          	movb   $0x0,0x70(%ebx)
        p->killed = 0;
8010403f:	c7 43 28 00 00 00 00 	movl   $0x0,0x28(%ebx)
        p->state = UNUSED;
80104046:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        release(&ptable.lock);
8010404d:	e8 de 05 00 00       	call   80104630 <release>
        return pid;
80104052:	83 c4 10             	add    $0x10,%esp
}
80104055:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104058:	89 f0                	mov    %esi,%eax
8010405a:	5b                   	pop    %ebx
8010405b:	5e                   	pop    %esi
8010405c:	5d                   	pop    %ebp
8010405d:	c3                   	ret    
      release(&ptable.lock);
8010405e:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80104061:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
80104066:	68 00 37 11 80       	push   $0x80113700
8010406b:	e8 c0 05 00 00       	call   80104630 <release>
      return -1;
80104070:	83 c4 10             	add    $0x10,%esp
80104073:	eb e0                	jmp    80104055 <wait+0xd5>
80104075:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104080 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104080:	55                   	push   %ebp
80104081:	89 e5                	mov    %esp,%ebp
80104083:	53                   	push   %ebx
80104084:	83 ec 10             	sub    $0x10,%esp
80104087:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010408a:	68 00 37 11 80       	push   $0x80113700
8010408f:	e8 dc 04 00 00       	call   80104570 <acquire>
80104094:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104097:	b8 34 37 11 80       	mov    $0x80113734,%eax
8010409c:	eb 0e                	jmp    801040ac <wakeup+0x2c>
8010409e:	66 90                	xchg   %ax,%ax
801040a0:	05 88 00 00 00       	add    $0x88,%eax
801040a5:	3d 34 59 11 80       	cmp    $0x80115934,%eax
801040aa:	73 1e                	jae    801040ca <wakeup+0x4a>
    if(p->state == SLEEPING && p->chan == chan)
801040ac:	83 78 10 02          	cmpl   $0x2,0x10(%eax)
801040b0:	75 ee                	jne    801040a0 <wakeup+0x20>
801040b2:	3b 58 24             	cmp    0x24(%eax),%ebx
801040b5:	75 e9                	jne    801040a0 <wakeup+0x20>
      p->state = RUNNABLE;
801040b7:	c7 40 10 03 00 00 00 	movl   $0x3,0x10(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040be:	05 88 00 00 00       	add    $0x88,%eax
801040c3:	3d 34 59 11 80       	cmp    $0x80115934,%eax
801040c8:	72 e2                	jb     801040ac <wakeup+0x2c>
  wakeup1(chan);
  release(&ptable.lock);
801040ca:	c7 45 08 00 37 11 80 	movl   $0x80113700,0x8(%ebp)
}
801040d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040d4:	c9                   	leave  
  release(&ptable.lock);
801040d5:	e9 56 05 00 00       	jmp    80104630 <release>
801040da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801040e0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
801040e0:	55                   	push   %ebp
801040e1:	89 e5                	mov    %esp,%ebp
801040e3:	53                   	push   %ebx
801040e4:	83 ec 10             	sub    $0x10,%esp
801040e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
801040ea:	68 00 37 11 80       	push   $0x80113700
801040ef:	e8 7c 04 00 00       	call   80104570 <acquire>
801040f4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040f7:	b8 34 37 11 80       	mov    $0x80113734,%eax
801040fc:	eb 0e                	jmp    8010410c <kill+0x2c>
801040fe:	66 90                	xchg   %ax,%ax
80104100:	05 88 00 00 00       	add    $0x88,%eax
80104105:	3d 34 59 11 80       	cmp    $0x80115934,%eax
8010410a:	73 34                	jae    80104140 <kill+0x60>
    if(p->pid == pid){
8010410c:	39 58 14             	cmp    %ebx,0x14(%eax)
8010410f:	75 ef                	jne    80104100 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104111:	83 78 10 02          	cmpl   $0x2,0x10(%eax)
      p->killed = 1;
80104115:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
      if(p->state == SLEEPING)
8010411c:	75 07                	jne    80104125 <kill+0x45>
        p->state = RUNNABLE;
8010411e:	c7 40 10 03 00 00 00 	movl   $0x3,0x10(%eax)
      release(&ptable.lock);
80104125:	83 ec 0c             	sub    $0xc,%esp
80104128:	68 00 37 11 80       	push   $0x80113700
8010412d:	e8 fe 04 00 00       	call   80104630 <release>
      return 0;
80104132:	83 c4 10             	add    $0x10,%esp
80104135:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104137:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010413a:	c9                   	leave  
8010413b:	c3                   	ret    
8010413c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80104140:	83 ec 0c             	sub    $0xc,%esp
80104143:	68 00 37 11 80       	push   $0x80113700
80104148:	e8 e3 04 00 00       	call   80104630 <release>
  return -1;
8010414d:	83 c4 10             	add    $0x10,%esp
80104150:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104155:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104158:	c9                   	leave  
80104159:	c3                   	ret    
8010415a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104160 <settickets>:

int 
settickets(int tickets){
80104160:	55                   	push   %ebp
80104161:	89 e5                	mov    %esp,%ebp
80104163:	53                   	push   %ebx
80104164:	83 ec 04             	sub    $0x4,%esp
  pushcli();
80104167:	e8 34 03 00 00       	call   801044a0 <pushcli>
  c = mycpu();
8010416c:	e8 8f f6 ff ff       	call   80103800 <mycpu>
  p = c->proc;
80104171:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80104177:	e8 64 03 00 00       	call   801044e0 <popcli>

  struct proc *proc = myproc(); //Disable interrupts so that we are not rescheduled; while reading proc from the cpu structure
  acquire(&ptable.lock);
8010417c:	83 ec 0c             	sub    $0xc,%esp
8010417f:	68 00 37 11 80       	push   $0x80113700
  ptable.proc[proc-ptable.proc].tickets = tickets;
80104184:	81 eb 34 37 11 80    	sub    $0x80113734,%ebx
8010418a:	83 e3 f8             	and    $0xfffffff8,%ebx
  acquire(&ptable.lock);
8010418d:	e8 de 03 00 00       	call   80104570 <acquire>
  ptable.proc[proc-ptable.proc].tickets = tickets;
80104192:	8b 45 08             	mov    0x8(%ebp),%eax
  release(&ptable.lock);
80104195:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
  ptable.proc[proc-ptable.proc].tickets = tickets;
8010419c:	89 83 b4 37 11 80    	mov    %eax,-0x7feec84c(%ebx)
  release(&ptable.lock);
801041a2:	e8 89 04 00 00       	call   80104630 <release>
 
  return 0;
}
801041a7:	31 c0                	xor    %eax,%eax
801041a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041ac:	c9                   	leave  
801041ad:	c3                   	ret    
801041ae:	66 90                	xchg   %ax,%ax

801041b0 <getpinfo>:

int
getpinfo(struct pstat* ps) {
801041b0:	55                   	push   %ebp
801041b1:	89 e5                	mov    %esp,%ebp
801041b3:	83 ec 14             	sub    $0x14,%esp
  int i = 0;
  struct proc *p;
  acquire(&ptable.lock);
801041b6:	68 00 37 11 80       	push   $0x80113700
801041bb:	e8 b0 03 00 00       	call   80104570 <acquire>
801041c0:	8b 55 08             	mov    0x8(%ebp),%edx
801041c3:	83 c4 10             	add    $0x10,%esp
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801041c6:	b8 34 37 11 80       	mov    $0x80113734,%eax
801041cb:	90                   	nop
801041cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ps->pid[i] = p->pid;
801041d0:	8b 48 14             	mov    0x14(%eax),%ecx
801041d3:	89 8a 00 02 00 00    	mov    %ecx,0x200(%edx)
    ps->inuse[i] = p->state != UNUSED;
801041d9:	31 c9                	xor    %ecx,%ecx
801041db:	83 78 10 00          	cmpl   $0x0,0x10(%eax)
801041df:	0f 95 c1             	setne  %cl
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801041e2:	05 88 00 00 00       	add    $0x88,%eax
801041e7:	83 c2 04             	add    $0x4,%edx
    ps->inuse[i] = p->state != UNUSED;
801041ea:	89 4a fc             	mov    %ecx,-0x4(%edx)
    ps->tickets[i] = p->tickets;
801041ed:	8b 48 f8             	mov    -0x8(%eax),%ecx
801041f0:	89 8a fc 00 00 00    	mov    %ecx,0xfc(%edx)
    ps->ticks[i] = p->ticks;
801041f6:	8b 48 fc             	mov    -0x4(%eax),%ecx
801041f9:	89 8a fc 02 00 00    	mov    %ecx,0x2fc(%edx)
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801041ff:	3d 34 59 11 80       	cmp    $0x80115934,%eax
80104204:	72 ca                	jb     801041d0 <getpinfo+0x20>
     
    i++;
  }
  release(&ptable.lock);
80104206:	83 ec 0c             	sub    $0xc,%esp
80104209:	68 00 37 11 80       	push   $0x80113700
8010420e:	e8 1d 04 00 00       	call   80104630 <release>
  return 0;
}
80104213:	31 c0                	xor    %eax,%eax
80104215:	c9                   	leave  
80104216:	c3                   	ret    
80104217:	89 f6                	mov    %esi,%esi
80104219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104220 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104220:	55                   	push   %ebp
80104221:	89 e5                	mov    %esp,%ebp
80104223:	57                   	push   %edi
80104224:	56                   	push   %esi
80104225:	53                   	push   %ebx
80104226:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104229:	bb 34 37 11 80       	mov    $0x80113734,%ebx
{
8010422e:	83 ec 3c             	sub    $0x3c,%esp
80104231:	eb 27                	jmp    8010425a <procdump+0x3a>
80104233:	90                   	nop
80104234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    // cprintf(" %d", p->tickets);
    // cprintf(" %d", winning_ticket);
    // cprintf(" %d", total_tickets);
    cprintf("\n");
80104238:	83 ec 0c             	sub    $0xc,%esp
8010423b:	68 7f 7e 10 80       	push   $0x80107e7f
80104240:	e8 1b c4 ff ff       	call   80100660 <cprintf>
80104245:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104248:	81 c3 88 00 00 00    	add    $0x88,%ebx
8010424e:	81 fb 34 59 11 80    	cmp    $0x80115934,%ebx
80104254:	0f 83 96 00 00 00    	jae    801042f0 <procdump+0xd0>
    if(p->state == UNUSED)
8010425a:	8b 43 10             	mov    0x10(%ebx),%eax
8010425d:	85 c0                	test   %eax,%eax
8010425f:	74 e7                	je     80104248 <procdump+0x28>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104261:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
80104264:	ba 00 7b 10 80       	mov    $0x80107b00,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104269:	77 11                	ja     8010427c <procdump+0x5c>
8010426b:	8b 14 85 64 7b 10 80 	mov    -0x7fef849c(,%eax,4),%edx
      state = "???";
80104272:	b8 00 7b 10 80       	mov    $0x80107b00,%eax
80104277:	85 d2                	test   %edx,%edx
80104279:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %sc%d", p->pid, state, p->name, p->tickets);
8010427c:	8d 43 70             	lea    0x70(%ebx),%eax
8010427f:	83 ec 0c             	sub    $0xc,%esp
80104282:	ff b3 80 00 00 00    	pushl  0x80(%ebx)
80104288:	50                   	push   %eax
80104289:	52                   	push   %edx
8010428a:	ff 73 14             	pushl  0x14(%ebx)
8010428d:	68 04 7b 10 80       	push   $0x80107b04
80104292:	e8 c9 c3 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
80104297:	83 c4 20             	add    $0x20,%esp
8010429a:	83 7b 10 02          	cmpl   $0x2,0x10(%ebx)
8010429e:	75 98                	jne    80104238 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801042a0:	8d 45 c0             	lea    -0x40(%ebp),%eax
801042a3:	83 ec 08             	sub    $0x8,%esp
801042a6:	8d 7d c0             	lea    -0x40(%ebp),%edi
801042a9:	50                   	push   %eax
801042aa:	8b 43 20             	mov    0x20(%ebx),%eax
801042ad:	8b 40 0c             	mov    0xc(%eax),%eax
801042b0:	83 c0 08             	add    $0x8,%eax
801042b3:	50                   	push   %eax
801042b4:	e8 97 01 00 00       	call   80104450 <getcallerpcs>
801042b9:	83 c4 10             	add    $0x10,%esp
801042bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
801042c0:	8b 17                	mov    (%edi),%edx
801042c2:	85 d2                	test   %edx,%edx
801042c4:	0f 84 6e ff ff ff    	je     80104238 <procdump+0x18>
        cprintf(" %p", pc[i]);
801042ca:	83 ec 08             	sub    $0x8,%esp
801042cd:	83 c7 04             	add    $0x4,%edi
801042d0:	52                   	push   %edx
801042d1:	68 41 75 10 80       	push   $0x80107541
801042d6:	e8 85 c3 ff ff       	call   80100660 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
801042db:	83 c4 10             	add    $0x10,%esp
801042de:	39 fe                	cmp    %edi,%esi
801042e0:	75 de                	jne    801042c0 <procdump+0xa0>
801042e2:	e9 51 ff ff ff       	jmp    80104238 <procdump+0x18>
801042e7:	89 f6                	mov    %esi,%esi
801042e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }
}
801042f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801042f3:	5b                   	pop    %ebx
801042f4:	5e                   	pop    %esi
801042f5:	5f                   	pop    %edi
801042f6:	5d                   	pop    %ebp
801042f7:	c3                   	ret    
801042f8:	66 90                	xchg   %ax,%ax
801042fa:	66 90                	xchg   %ax,%ax
801042fc:	66 90                	xchg   %ax,%ax
801042fe:	66 90                	xchg   %ax,%ax

80104300 <initsleeplock>:
80104300:	55                   	push   %ebp
80104301:	89 e5                	mov    %esp,%ebp
80104303:	53                   	push   %ebx
80104304:	83 ec 0c             	sub    $0xc,%esp
80104307:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010430a:	68 7c 7b 10 80       	push   $0x80107b7c
8010430f:	8d 43 04             	lea    0x4(%ebx),%eax
80104312:	50                   	push   %eax
80104313:	e8 18 01 00 00       	call   80104430 <initlock>
80104318:	8b 45 0c             	mov    0xc(%ebp),%eax
8010431b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104321:	83 c4 10             	add    $0x10,%esp
80104324:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010432b:	89 43 38             	mov    %eax,0x38(%ebx)
8010432e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104331:	c9                   	leave  
80104332:	c3                   	ret    
80104333:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104340 <acquiresleep>:
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	56                   	push   %esi
80104344:	53                   	push   %ebx
80104345:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104348:	83 ec 0c             	sub    $0xc,%esp
8010434b:	8d 73 04             	lea    0x4(%ebx),%esi
8010434e:	56                   	push   %esi
8010434f:	e8 1c 02 00 00       	call   80104570 <acquire>
80104354:	8b 13                	mov    (%ebx),%edx
80104356:	83 c4 10             	add    $0x10,%esp
80104359:	85 d2                	test   %edx,%edx
8010435b:	74 16                	je     80104373 <acquiresleep+0x33>
8010435d:	8d 76 00             	lea    0x0(%esi),%esi
80104360:	83 ec 08             	sub    $0x8,%esp
80104363:	56                   	push   %esi
80104364:	53                   	push   %ebx
80104365:	e8 56 fb ff ff       	call   80103ec0 <sleep>
8010436a:	8b 03                	mov    (%ebx),%eax
8010436c:	83 c4 10             	add    $0x10,%esp
8010436f:	85 c0                	test   %eax,%eax
80104371:	75 ed                	jne    80104360 <acquiresleep+0x20>
80104373:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80104379:	e8 22 f5 ff ff       	call   801038a0 <myproc>
8010437e:	8b 40 14             	mov    0x14(%eax),%eax
80104381:	89 43 3c             	mov    %eax,0x3c(%ebx)
80104384:	89 75 08             	mov    %esi,0x8(%ebp)
80104387:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010438a:	5b                   	pop    %ebx
8010438b:	5e                   	pop    %esi
8010438c:	5d                   	pop    %ebp
8010438d:	e9 9e 02 00 00       	jmp    80104630 <release>
80104392:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801043a0 <releasesleep>:
801043a0:	55                   	push   %ebp
801043a1:	89 e5                	mov    %esp,%ebp
801043a3:	56                   	push   %esi
801043a4:	53                   	push   %ebx
801043a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801043a8:	83 ec 0c             	sub    $0xc,%esp
801043ab:	8d 73 04             	lea    0x4(%ebx),%esi
801043ae:	56                   	push   %esi
801043af:	e8 bc 01 00 00       	call   80104570 <acquire>
801043b4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801043ba:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801043c1:	89 1c 24             	mov    %ebx,(%esp)
801043c4:	e8 b7 fc ff ff       	call   80104080 <wakeup>
801043c9:	89 75 08             	mov    %esi,0x8(%ebp)
801043cc:	83 c4 10             	add    $0x10,%esp
801043cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043d2:	5b                   	pop    %ebx
801043d3:	5e                   	pop    %esi
801043d4:	5d                   	pop    %ebp
801043d5:	e9 56 02 00 00       	jmp    80104630 <release>
801043da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801043e0 <holdingsleep>:
801043e0:	55                   	push   %ebp
801043e1:	89 e5                	mov    %esp,%ebp
801043e3:	57                   	push   %edi
801043e4:	56                   	push   %esi
801043e5:	53                   	push   %ebx
801043e6:	31 ff                	xor    %edi,%edi
801043e8:	83 ec 18             	sub    $0x18,%esp
801043eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801043ee:	8d 73 04             	lea    0x4(%ebx),%esi
801043f1:	56                   	push   %esi
801043f2:	e8 79 01 00 00       	call   80104570 <acquire>
801043f7:	8b 03                	mov    (%ebx),%eax
801043f9:	83 c4 10             	add    $0x10,%esp
801043fc:	85 c0                	test   %eax,%eax
801043fe:	74 13                	je     80104413 <holdingsleep+0x33>
80104400:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104403:	e8 98 f4 ff ff       	call   801038a0 <myproc>
80104408:	39 58 14             	cmp    %ebx,0x14(%eax)
8010440b:	0f 94 c0             	sete   %al
8010440e:	0f b6 c0             	movzbl %al,%eax
80104411:	89 c7                	mov    %eax,%edi
80104413:	83 ec 0c             	sub    $0xc,%esp
80104416:	56                   	push   %esi
80104417:	e8 14 02 00 00       	call   80104630 <release>
8010441c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010441f:	89 f8                	mov    %edi,%eax
80104421:	5b                   	pop    %ebx
80104422:	5e                   	pop    %esi
80104423:	5f                   	pop    %edi
80104424:	5d                   	pop    %ebp
80104425:	c3                   	ret    
80104426:	66 90                	xchg   %ax,%ax
80104428:	66 90                	xchg   %ax,%ax
8010442a:	66 90                	xchg   %ax,%ax
8010442c:	66 90                	xchg   %ax,%ax
8010442e:	66 90                	xchg   %ax,%ax

80104430 <initlock>:
80104430:	55                   	push   %ebp
80104431:	89 e5                	mov    %esp,%ebp
80104433:	8b 45 08             	mov    0x8(%ebp),%eax
80104436:	8b 55 0c             	mov    0xc(%ebp),%edx
80104439:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010443f:	89 50 04             	mov    %edx,0x4(%eax)
80104442:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104449:	5d                   	pop    %ebp
8010444a:	c3                   	ret    
8010444b:	90                   	nop
8010444c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104450 <getcallerpcs>:
80104450:	55                   	push   %ebp
80104451:	31 d2                	xor    %edx,%edx
80104453:	89 e5                	mov    %esp,%ebp
80104455:	53                   	push   %ebx
80104456:	8b 45 08             	mov    0x8(%ebp),%eax
80104459:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010445c:	83 e8 08             	sub    $0x8,%eax
8010445f:	90                   	nop
80104460:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80104466:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010446c:	77 1a                	ja     80104488 <getcallerpcs+0x38>
8010446e:	8b 58 04             	mov    0x4(%eax),%ebx
80104471:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
80104474:	83 c2 01             	add    $0x1,%edx
80104477:	8b 00                	mov    (%eax),%eax
80104479:	83 fa 0a             	cmp    $0xa,%edx
8010447c:	75 e2                	jne    80104460 <getcallerpcs+0x10>
8010447e:	5b                   	pop    %ebx
8010447f:	5d                   	pop    %ebp
80104480:	c3                   	ret    
80104481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104488:	8d 04 91             	lea    (%ecx,%edx,4),%eax
8010448b:	83 c1 28             	add    $0x28,%ecx
8010448e:	66 90                	xchg   %ax,%ax
80104490:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104496:	83 c0 04             	add    $0x4,%eax
80104499:	39 c1                	cmp    %eax,%ecx
8010449b:	75 f3                	jne    80104490 <getcallerpcs+0x40>
8010449d:	5b                   	pop    %ebx
8010449e:	5d                   	pop    %ebp
8010449f:	c3                   	ret    

801044a0 <pushcli>:
801044a0:	55                   	push   %ebp
801044a1:	89 e5                	mov    %esp,%ebp
801044a3:	53                   	push   %ebx
801044a4:	83 ec 04             	sub    $0x4,%esp
801044a7:	9c                   	pushf  
801044a8:	5b                   	pop    %ebx
801044a9:	fa                   	cli    
801044aa:	e8 51 f3 ff ff       	call   80103800 <mycpu>
801044af:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801044b5:	85 c0                	test   %eax,%eax
801044b7:	75 11                	jne    801044ca <pushcli+0x2a>
801044b9:	81 e3 00 02 00 00    	and    $0x200,%ebx
801044bf:	e8 3c f3 ff ff       	call   80103800 <mycpu>
801044c4:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
801044ca:	e8 31 f3 ff ff       	call   80103800 <mycpu>
801044cf:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
801044d6:	83 c4 04             	add    $0x4,%esp
801044d9:	5b                   	pop    %ebx
801044da:	5d                   	pop    %ebp
801044db:	c3                   	ret    
801044dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801044e0 <popcli>:
801044e0:	55                   	push   %ebp
801044e1:	89 e5                	mov    %esp,%ebp
801044e3:	83 ec 08             	sub    $0x8,%esp
801044e6:	9c                   	pushf  
801044e7:	58                   	pop    %eax
801044e8:	f6 c4 02             	test   $0x2,%ah
801044eb:	75 35                	jne    80104522 <popcli+0x42>
801044ed:	e8 0e f3 ff ff       	call   80103800 <mycpu>
801044f2:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
801044f9:	78 34                	js     8010452f <popcli+0x4f>
801044fb:	e8 00 f3 ff ff       	call   80103800 <mycpu>
80104500:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104506:	85 d2                	test   %edx,%edx
80104508:	74 06                	je     80104510 <popcli+0x30>
8010450a:	c9                   	leave  
8010450b:	c3                   	ret    
8010450c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104510:	e8 eb f2 ff ff       	call   80103800 <mycpu>
80104515:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010451b:	85 c0                	test   %eax,%eax
8010451d:	74 eb                	je     8010450a <popcli+0x2a>
8010451f:	fb                   	sti    
80104520:	c9                   	leave  
80104521:	c3                   	ret    
80104522:	83 ec 0c             	sub    $0xc,%esp
80104525:	68 87 7b 10 80       	push   $0x80107b87
8010452a:	e8 61 be ff ff       	call   80100390 <panic>
8010452f:	83 ec 0c             	sub    $0xc,%esp
80104532:	68 9e 7b 10 80       	push   $0x80107b9e
80104537:	e8 54 be ff ff       	call   80100390 <panic>
8010453c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104540 <holding>:
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	56                   	push   %esi
80104544:	53                   	push   %ebx
80104545:	8b 75 08             	mov    0x8(%ebp),%esi
80104548:	31 db                	xor    %ebx,%ebx
8010454a:	e8 51 ff ff ff       	call   801044a0 <pushcli>
8010454f:	8b 06                	mov    (%esi),%eax
80104551:	85 c0                	test   %eax,%eax
80104553:	74 10                	je     80104565 <holding+0x25>
80104555:	8b 5e 08             	mov    0x8(%esi),%ebx
80104558:	e8 a3 f2 ff ff       	call   80103800 <mycpu>
8010455d:	39 c3                	cmp    %eax,%ebx
8010455f:	0f 94 c3             	sete   %bl
80104562:	0f b6 db             	movzbl %bl,%ebx
80104565:	e8 76 ff ff ff       	call   801044e0 <popcli>
8010456a:	89 d8                	mov    %ebx,%eax
8010456c:	5b                   	pop    %ebx
8010456d:	5e                   	pop    %esi
8010456e:	5d                   	pop    %ebp
8010456f:	c3                   	ret    

80104570 <acquire>:
80104570:	55                   	push   %ebp
80104571:	89 e5                	mov    %esp,%ebp
80104573:	56                   	push   %esi
80104574:	53                   	push   %ebx
80104575:	e8 26 ff ff ff       	call   801044a0 <pushcli>
8010457a:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010457d:	83 ec 0c             	sub    $0xc,%esp
80104580:	53                   	push   %ebx
80104581:	e8 ba ff ff ff       	call   80104540 <holding>
80104586:	83 c4 10             	add    $0x10,%esp
80104589:	85 c0                	test   %eax,%eax
8010458b:	0f 85 83 00 00 00    	jne    80104614 <acquire+0xa4>
80104591:	89 c6                	mov    %eax,%esi
80104593:	ba 01 00 00 00       	mov    $0x1,%edx
80104598:	eb 09                	jmp    801045a3 <acquire+0x33>
8010459a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045a0:	8b 5d 08             	mov    0x8(%ebp),%ebx
801045a3:	89 d0                	mov    %edx,%eax
801045a5:	f0 87 03             	lock xchg %eax,(%ebx)
801045a8:	85 c0                	test   %eax,%eax
801045aa:	75 f4                	jne    801045a0 <acquire+0x30>
801045ac:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801045b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801045b4:	e8 47 f2 ff ff       	call   80103800 <mycpu>
801045b9:	8d 53 0c             	lea    0xc(%ebx),%edx
801045bc:	89 43 08             	mov    %eax,0x8(%ebx)
801045bf:	89 e8                	mov    %ebp,%eax
801045c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045c8:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
801045ce:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
801045d4:	77 1a                	ja     801045f0 <acquire+0x80>
801045d6:	8b 48 04             	mov    0x4(%eax),%ecx
801045d9:	89 0c b2             	mov    %ecx,(%edx,%esi,4)
801045dc:	83 c6 01             	add    $0x1,%esi
801045df:	8b 00                	mov    (%eax),%eax
801045e1:	83 fe 0a             	cmp    $0xa,%esi
801045e4:	75 e2                	jne    801045c8 <acquire+0x58>
801045e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801045e9:	5b                   	pop    %ebx
801045ea:	5e                   	pop    %esi
801045eb:	5d                   	pop    %ebp
801045ec:	c3                   	ret    
801045ed:	8d 76 00             	lea    0x0(%esi),%esi
801045f0:	8d 04 b2             	lea    (%edx,%esi,4),%eax
801045f3:	83 c2 28             	add    $0x28,%edx
801045f6:	8d 76 00             	lea    0x0(%esi),%esi
801045f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104600:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104606:	83 c0 04             	add    $0x4,%eax
80104609:	39 d0                	cmp    %edx,%eax
8010460b:	75 f3                	jne    80104600 <acquire+0x90>
8010460d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104610:	5b                   	pop    %ebx
80104611:	5e                   	pop    %esi
80104612:	5d                   	pop    %ebp
80104613:	c3                   	ret    
80104614:	83 ec 0c             	sub    $0xc,%esp
80104617:	68 a5 7b 10 80       	push   $0x80107ba5
8010461c:	e8 6f bd ff ff       	call   80100390 <panic>
80104621:	eb 0d                	jmp    80104630 <release>
80104623:	90                   	nop
80104624:	90                   	nop
80104625:	90                   	nop
80104626:	90                   	nop
80104627:	90                   	nop
80104628:	90                   	nop
80104629:	90                   	nop
8010462a:	90                   	nop
8010462b:	90                   	nop
8010462c:	90                   	nop
8010462d:	90                   	nop
8010462e:	90                   	nop
8010462f:	90                   	nop

80104630 <release>:
80104630:	55                   	push   %ebp
80104631:	89 e5                	mov    %esp,%ebp
80104633:	53                   	push   %ebx
80104634:	83 ec 10             	sub    $0x10,%esp
80104637:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010463a:	53                   	push   %ebx
8010463b:	e8 00 ff ff ff       	call   80104540 <holding>
80104640:	83 c4 10             	add    $0x10,%esp
80104643:	85 c0                	test   %eax,%eax
80104645:	74 22                	je     80104669 <release+0x39>
80104647:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
8010464e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80104655:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
8010465a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104660:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104663:	c9                   	leave  
80104664:	e9 77 fe ff ff       	jmp    801044e0 <popcli>
80104669:	83 ec 0c             	sub    $0xc,%esp
8010466c:	68 ad 7b 10 80       	push   $0x80107bad
80104671:	e8 1a bd ff ff       	call   80100390 <panic>
80104676:	66 90                	xchg   %ax,%ax
80104678:	66 90                	xchg   %ax,%ax
8010467a:	66 90                	xchg   %ax,%ax
8010467c:	66 90                	xchg   %ax,%ax
8010467e:	66 90                	xchg   %ax,%ax

80104680 <memset>:
80104680:	55                   	push   %ebp
80104681:	89 e5                	mov    %esp,%ebp
80104683:	57                   	push   %edi
80104684:	53                   	push   %ebx
80104685:	8b 55 08             	mov    0x8(%ebp),%edx
80104688:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010468b:	f6 c2 03             	test   $0x3,%dl
8010468e:	75 05                	jne    80104695 <memset+0x15>
80104690:	f6 c1 03             	test   $0x3,%cl
80104693:	74 13                	je     801046a8 <memset+0x28>
80104695:	89 d7                	mov    %edx,%edi
80104697:	8b 45 0c             	mov    0xc(%ebp),%eax
8010469a:	fc                   	cld    
8010469b:	f3 aa                	rep stos %al,%es:(%edi)
8010469d:	5b                   	pop    %ebx
8010469e:	89 d0                	mov    %edx,%eax
801046a0:	5f                   	pop    %edi
801046a1:	5d                   	pop    %ebp
801046a2:	c3                   	ret    
801046a3:	90                   	nop
801046a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046a8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
801046ac:	c1 e9 02             	shr    $0x2,%ecx
801046af:	89 f8                	mov    %edi,%eax
801046b1:	89 fb                	mov    %edi,%ebx
801046b3:	c1 e0 18             	shl    $0x18,%eax
801046b6:	c1 e3 10             	shl    $0x10,%ebx
801046b9:	09 d8                	or     %ebx,%eax
801046bb:	09 f8                	or     %edi,%eax
801046bd:	c1 e7 08             	shl    $0x8,%edi
801046c0:	09 f8                	or     %edi,%eax
801046c2:	89 d7                	mov    %edx,%edi
801046c4:	fc                   	cld    
801046c5:	f3 ab                	rep stos %eax,%es:(%edi)
801046c7:	5b                   	pop    %ebx
801046c8:	89 d0                	mov    %edx,%eax
801046ca:	5f                   	pop    %edi
801046cb:	5d                   	pop    %ebp
801046cc:	c3                   	ret    
801046cd:	8d 76 00             	lea    0x0(%esi),%esi

801046d0 <memcmp>:
801046d0:	55                   	push   %ebp
801046d1:	89 e5                	mov    %esp,%ebp
801046d3:	57                   	push   %edi
801046d4:	56                   	push   %esi
801046d5:	53                   	push   %ebx
801046d6:	8b 5d 10             	mov    0x10(%ebp),%ebx
801046d9:	8b 75 08             	mov    0x8(%ebp),%esi
801046dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801046df:	85 db                	test   %ebx,%ebx
801046e1:	74 29                	je     8010470c <memcmp+0x3c>
801046e3:	0f b6 16             	movzbl (%esi),%edx
801046e6:	0f b6 0f             	movzbl (%edi),%ecx
801046e9:	38 d1                	cmp    %dl,%cl
801046eb:	75 2b                	jne    80104718 <memcmp+0x48>
801046ed:	b8 01 00 00 00       	mov    $0x1,%eax
801046f2:	eb 14                	jmp    80104708 <memcmp+0x38>
801046f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046f8:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
801046fc:	83 c0 01             	add    $0x1,%eax
801046ff:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104704:	38 ca                	cmp    %cl,%dl
80104706:	75 10                	jne    80104718 <memcmp+0x48>
80104708:	39 d8                	cmp    %ebx,%eax
8010470a:	75 ec                	jne    801046f8 <memcmp+0x28>
8010470c:	5b                   	pop    %ebx
8010470d:	31 c0                	xor    %eax,%eax
8010470f:	5e                   	pop    %esi
80104710:	5f                   	pop    %edi
80104711:	5d                   	pop    %ebp
80104712:	c3                   	ret    
80104713:	90                   	nop
80104714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104718:	0f b6 c2             	movzbl %dl,%eax
8010471b:	5b                   	pop    %ebx
8010471c:	29 c8                	sub    %ecx,%eax
8010471e:	5e                   	pop    %esi
8010471f:	5f                   	pop    %edi
80104720:	5d                   	pop    %ebp
80104721:	c3                   	ret    
80104722:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104730 <memmove>:
80104730:	55                   	push   %ebp
80104731:	89 e5                	mov    %esp,%ebp
80104733:	56                   	push   %esi
80104734:	53                   	push   %ebx
80104735:	8b 45 08             	mov    0x8(%ebp),%eax
80104738:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010473b:	8b 75 10             	mov    0x10(%ebp),%esi
8010473e:	39 c3                	cmp    %eax,%ebx
80104740:	73 26                	jae    80104768 <memmove+0x38>
80104742:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
80104745:	39 c8                	cmp    %ecx,%eax
80104747:	73 1f                	jae    80104768 <memmove+0x38>
80104749:	85 f6                	test   %esi,%esi
8010474b:	8d 56 ff             	lea    -0x1(%esi),%edx
8010474e:	74 0f                	je     8010475f <memmove+0x2f>
80104750:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104754:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104757:	83 ea 01             	sub    $0x1,%edx
8010475a:	83 fa ff             	cmp    $0xffffffff,%edx
8010475d:	75 f1                	jne    80104750 <memmove+0x20>
8010475f:	5b                   	pop    %ebx
80104760:	5e                   	pop    %esi
80104761:	5d                   	pop    %ebp
80104762:	c3                   	ret    
80104763:	90                   	nop
80104764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104768:	31 d2                	xor    %edx,%edx
8010476a:	85 f6                	test   %esi,%esi
8010476c:	74 f1                	je     8010475f <memmove+0x2f>
8010476e:	66 90                	xchg   %ax,%ax
80104770:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104774:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104777:	83 c2 01             	add    $0x1,%edx
8010477a:	39 d6                	cmp    %edx,%esi
8010477c:	75 f2                	jne    80104770 <memmove+0x40>
8010477e:	5b                   	pop    %ebx
8010477f:	5e                   	pop    %esi
80104780:	5d                   	pop    %ebp
80104781:	c3                   	ret    
80104782:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104790 <memcpy>:
80104790:	55                   	push   %ebp
80104791:	89 e5                	mov    %esp,%ebp
80104793:	5d                   	pop    %ebp
80104794:	eb 9a                	jmp    80104730 <memmove>
80104796:	8d 76 00             	lea    0x0(%esi),%esi
80104799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047a0 <strncmp>:
801047a0:	55                   	push   %ebp
801047a1:	89 e5                	mov    %esp,%ebp
801047a3:	57                   	push   %edi
801047a4:	56                   	push   %esi
801047a5:	8b 7d 10             	mov    0x10(%ebp),%edi
801047a8:	53                   	push   %ebx
801047a9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801047ac:	8b 75 0c             	mov    0xc(%ebp),%esi
801047af:	85 ff                	test   %edi,%edi
801047b1:	74 2f                	je     801047e2 <strncmp+0x42>
801047b3:	0f b6 01             	movzbl (%ecx),%eax
801047b6:	0f b6 1e             	movzbl (%esi),%ebx
801047b9:	84 c0                	test   %al,%al
801047bb:	74 37                	je     801047f4 <strncmp+0x54>
801047bd:	38 c3                	cmp    %al,%bl
801047bf:	75 33                	jne    801047f4 <strncmp+0x54>
801047c1:	01 f7                	add    %esi,%edi
801047c3:	eb 13                	jmp    801047d8 <strncmp+0x38>
801047c5:	8d 76 00             	lea    0x0(%esi),%esi
801047c8:	0f b6 01             	movzbl (%ecx),%eax
801047cb:	84 c0                	test   %al,%al
801047cd:	74 21                	je     801047f0 <strncmp+0x50>
801047cf:	0f b6 1a             	movzbl (%edx),%ebx
801047d2:	89 d6                	mov    %edx,%esi
801047d4:	38 d8                	cmp    %bl,%al
801047d6:	75 1c                	jne    801047f4 <strncmp+0x54>
801047d8:	8d 56 01             	lea    0x1(%esi),%edx
801047db:	83 c1 01             	add    $0x1,%ecx
801047de:	39 fa                	cmp    %edi,%edx
801047e0:	75 e6                	jne    801047c8 <strncmp+0x28>
801047e2:	5b                   	pop    %ebx
801047e3:	31 c0                	xor    %eax,%eax
801047e5:	5e                   	pop    %esi
801047e6:	5f                   	pop    %edi
801047e7:	5d                   	pop    %ebp
801047e8:	c3                   	ret    
801047e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047f0:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
801047f4:	29 d8                	sub    %ebx,%eax
801047f6:	5b                   	pop    %ebx
801047f7:	5e                   	pop    %esi
801047f8:	5f                   	pop    %edi
801047f9:	5d                   	pop    %ebp
801047fa:	c3                   	ret    
801047fb:	90                   	nop
801047fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104800 <strncpy>:
80104800:	55                   	push   %ebp
80104801:	89 e5                	mov    %esp,%ebp
80104803:	56                   	push   %esi
80104804:	53                   	push   %ebx
80104805:	8b 45 08             	mov    0x8(%ebp),%eax
80104808:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010480b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010480e:	89 c2                	mov    %eax,%edx
80104810:	eb 19                	jmp    8010482b <strncpy+0x2b>
80104812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104818:	83 c3 01             	add    $0x1,%ebx
8010481b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010481f:	83 c2 01             	add    $0x1,%edx
80104822:	84 c9                	test   %cl,%cl
80104824:	88 4a ff             	mov    %cl,-0x1(%edx)
80104827:	74 09                	je     80104832 <strncpy+0x32>
80104829:	89 f1                	mov    %esi,%ecx
8010482b:	85 c9                	test   %ecx,%ecx
8010482d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104830:	7f e6                	jg     80104818 <strncpy+0x18>
80104832:	31 c9                	xor    %ecx,%ecx
80104834:	85 f6                	test   %esi,%esi
80104836:	7e 17                	jle    8010484f <strncpy+0x4f>
80104838:	90                   	nop
80104839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104840:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104844:	89 f3                	mov    %esi,%ebx
80104846:	83 c1 01             	add    $0x1,%ecx
80104849:	29 cb                	sub    %ecx,%ebx
8010484b:	85 db                	test   %ebx,%ebx
8010484d:	7f f1                	jg     80104840 <strncpy+0x40>
8010484f:	5b                   	pop    %ebx
80104850:	5e                   	pop    %esi
80104851:	5d                   	pop    %ebp
80104852:	c3                   	ret    
80104853:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104860 <safestrcpy>:
80104860:	55                   	push   %ebp
80104861:	89 e5                	mov    %esp,%ebp
80104863:	56                   	push   %esi
80104864:	53                   	push   %ebx
80104865:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104868:	8b 45 08             	mov    0x8(%ebp),%eax
8010486b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010486e:	85 c9                	test   %ecx,%ecx
80104870:	7e 26                	jle    80104898 <safestrcpy+0x38>
80104872:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104876:	89 c1                	mov    %eax,%ecx
80104878:	eb 17                	jmp    80104891 <safestrcpy+0x31>
8010487a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104880:	83 c2 01             	add    $0x1,%edx
80104883:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104887:	83 c1 01             	add    $0x1,%ecx
8010488a:	84 db                	test   %bl,%bl
8010488c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010488f:	74 04                	je     80104895 <safestrcpy+0x35>
80104891:	39 f2                	cmp    %esi,%edx
80104893:	75 eb                	jne    80104880 <safestrcpy+0x20>
80104895:	c6 01 00             	movb   $0x0,(%ecx)
80104898:	5b                   	pop    %ebx
80104899:	5e                   	pop    %esi
8010489a:	5d                   	pop    %ebp
8010489b:	c3                   	ret    
8010489c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801048a0 <strlen>:
801048a0:	55                   	push   %ebp
801048a1:	31 c0                	xor    %eax,%eax
801048a3:	89 e5                	mov    %esp,%ebp
801048a5:	8b 55 08             	mov    0x8(%ebp),%edx
801048a8:	80 3a 00             	cmpb   $0x0,(%edx)
801048ab:	74 0c                	je     801048b9 <strlen+0x19>
801048ad:	8d 76 00             	lea    0x0(%esi),%esi
801048b0:	83 c0 01             	add    $0x1,%eax
801048b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801048b7:	75 f7                	jne    801048b0 <strlen+0x10>
801048b9:	5d                   	pop    %ebp
801048ba:	c3                   	ret    

801048bb <swtch>:
801048bb:	8b 44 24 04          	mov    0x4(%esp),%eax
801048bf:	8b 54 24 08          	mov    0x8(%esp),%edx
801048c3:	55                   	push   %ebp
801048c4:	53                   	push   %ebx
801048c5:	56                   	push   %esi
801048c6:	57                   	push   %edi
801048c7:	89 20                	mov    %esp,(%eax)
801048c9:	89 d4                	mov    %edx,%esp
801048cb:	5f                   	pop    %edi
801048cc:	5e                   	pop    %esi
801048cd:	5b                   	pop    %ebx
801048ce:	5d                   	pop    %ebp
801048cf:	c3                   	ret    

801048d0 <fetchint>:
801048d0:	55                   	push   %ebp
801048d1:	89 e5                	mov    %esp,%ebp
801048d3:	53                   	push   %ebx
801048d4:	83 ec 04             	sub    $0x4,%esp
801048d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801048da:	e8 c1 ef ff ff       	call   801038a0 <myproc>
801048df:	8b 00                	mov    (%eax),%eax
801048e1:	39 d8                	cmp    %ebx,%eax
801048e3:	76 1b                	jbe    80104900 <fetchint+0x30>
801048e5:	8d 53 04             	lea    0x4(%ebx),%edx
801048e8:	39 d0                	cmp    %edx,%eax
801048ea:	72 14                	jb     80104900 <fetchint+0x30>
801048ec:	8b 45 0c             	mov    0xc(%ebp),%eax
801048ef:	8b 13                	mov    (%ebx),%edx
801048f1:	89 10                	mov    %edx,(%eax)
801048f3:	31 c0                	xor    %eax,%eax
801048f5:	83 c4 04             	add    $0x4,%esp
801048f8:	5b                   	pop    %ebx
801048f9:	5d                   	pop    %ebp
801048fa:	c3                   	ret    
801048fb:	90                   	nop
801048fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104900:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104905:	eb ee                	jmp    801048f5 <fetchint+0x25>
80104907:	89 f6                	mov    %esi,%esi
80104909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104910 <fetchstr>:
80104910:	55                   	push   %ebp
80104911:	89 e5                	mov    %esp,%ebp
80104913:	53                   	push   %ebx
80104914:	83 ec 04             	sub    $0x4,%esp
80104917:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010491a:	e8 81 ef ff ff       	call   801038a0 <myproc>
8010491f:	39 18                	cmp    %ebx,(%eax)
80104921:	76 29                	jbe    8010494c <fetchstr+0x3c>
80104923:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104926:	89 da                	mov    %ebx,%edx
80104928:	89 19                	mov    %ebx,(%ecx)
8010492a:	8b 00                	mov    (%eax),%eax
8010492c:	39 c3                	cmp    %eax,%ebx
8010492e:	73 1c                	jae    8010494c <fetchstr+0x3c>
80104930:	80 3b 00             	cmpb   $0x0,(%ebx)
80104933:	75 10                	jne    80104945 <fetchstr+0x35>
80104935:	eb 39                	jmp    80104970 <fetchstr+0x60>
80104937:	89 f6                	mov    %esi,%esi
80104939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104940:	80 3a 00             	cmpb   $0x0,(%edx)
80104943:	74 1b                	je     80104960 <fetchstr+0x50>
80104945:	83 c2 01             	add    $0x1,%edx
80104948:	39 d0                	cmp    %edx,%eax
8010494a:	77 f4                	ja     80104940 <fetchstr+0x30>
8010494c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104951:	83 c4 04             	add    $0x4,%esp
80104954:	5b                   	pop    %ebx
80104955:	5d                   	pop    %ebp
80104956:	c3                   	ret    
80104957:	89 f6                	mov    %esi,%esi
80104959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104960:	83 c4 04             	add    $0x4,%esp
80104963:	89 d0                	mov    %edx,%eax
80104965:	29 d8                	sub    %ebx,%eax
80104967:	5b                   	pop    %ebx
80104968:	5d                   	pop    %ebp
80104969:	c3                   	ret    
8010496a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104970:	31 c0                	xor    %eax,%eax
80104972:	eb dd                	jmp    80104951 <fetchstr+0x41>
80104974:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010497a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104980 <argint>:
80104980:	55                   	push   %ebp
80104981:	89 e5                	mov    %esp,%ebp
80104983:	56                   	push   %esi
80104984:	53                   	push   %ebx
80104985:	e8 16 ef ff ff       	call   801038a0 <myproc>
8010498a:	8b 40 1c             	mov    0x1c(%eax),%eax
8010498d:	8b 55 08             	mov    0x8(%ebp),%edx
80104990:	8b 40 44             	mov    0x44(%eax),%eax
80104993:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104996:	e8 05 ef ff ff       	call   801038a0 <myproc>
8010499b:	8b 00                	mov    (%eax),%eax
8010499d:	8d 73 04             	lea    0x4(%ebx),%esi
801049a0:	39 c6                	cmp    %eax,%esi
801049a2:	73 1c                	jae    801049c0 <argint+0x40>
801049a4:	8d 53 08             	lea    0x8(%ebx),%edx
801049a7:	39 d0                	cmp    %edx,%eax
801049a9:	72 15                	jb     801049c0 <argint+0x40>
801049ab:	8b 45 0c             	mov    0xc(%ebp),%eax
801049ae:	8b 53 04             	mov    0x4(%ebx),%edx
801049b1:	89 10                	mov    %edx,(%eax)
801049b3:	31 c0                	xor    %eax,%eax
801049b5:	5b                   	pop    %ebx
801049b6:	5e                   	pop    %esi
801049b7:	5d                   	pop    %ebp
801049b8:	c3                   	ret    
801049b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049c5:	eb ee                	jmp    801049b5 <argint+0x35>
801049c7:	89 f6                	mov    %esi,%esi
801049c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801049d0 <argptr>:
801049d0:	55                   	push   %ebp
801049d1:	89 e5                	mov    %esp,%ebp
801049d3:	56                   	push   %esi
801049d4:	53                   	push   %ebx
801049d5:	83 ec 10             	sub    $0x10,%esp
801049d8:	8b 5d 10             	mov    0x10(%ebp),%ebx
801049db:	e8 c0 ee ff ff       	call   801038a0 <myproc>
801049e0:	89 c6                	mov    %eax,%esi
801049e2:	8d 45 f4             	lea    -0xc(%ebp),%eax
801049e5:	83 ec 08             	sub    $0x8,%esp
801049e8:	50                   	push   %eax
801049e9:	ff 75 08             	pushl  0x8(%ebp)
801049ec:	e8 8f ff ff ff       	call   80104980 <argint>
801049f1:	83 c4 10             	add    $0x10,%esp
801049f4:	85 c0                	test   %eax,%eax
801049f6:	78 28                	js     80104a20 <argptr+0x50>
801049f8:	85 db                	test   %ebx,%ebx
801049fa:	78 24                	js     80104a20 <argptr+0x50>
801049fc:	8b 16                	mov    (%esi),%edx
801049fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a01:	39 c2                	cmp    %eax,%edx
80104a03:	76 1b                	jbe    80104a20 <argptr+0x50>
80104a05:	01 c3                	add    %eax,%ebx
80104a07:	39 da                	cmp    %ebx,%edx
80104a09:	72 15                	jb     80104a20 <argptr+0x50>
80104a0b:	8b 55 0c             	mov    0xc(%ebp),%edx
80104a0e:	89 02                	mov    %eax,(%edx)
80104a10:	31 c0                	xor    %eax,%eax
80104a12:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a15:	5b                   	pop    %ebx
80104a16:	5e                   	pop    %esi
80104a17:	5d                   	pop    %ebp
80104a18:	c3                   	ret    
80104a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a25:	eb eb                	jmp    80104a12 <argptr+0x42>
80104a27:	89 f6                	mov    %esi,%esi
80104a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a30 <argstr>:
80104a30:	55                   	push   %ebp
80104a31:	89 e5                	mov    %esp,%ebp
80104a33:	83 ec 20             	sub    $0x20,%esp
80104a36:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a39:	50                   	push   %eax
80104a3a:	ff 75 08             	pushl  0x8(%ebp)
80104a3d:	e8 3e ff ff ff       	call   80104980 <argint>
80104a42:	83 c4 10             	add    $0x10,%esp
80104a45:	85 c0                	test   %eax,%eax
80104a47:	78 17                	js     80104a60 <argstr+0x30>
80104a49:	83 ec 08             	sub    $0x8,%esp
80104a4c:	ff 75 0c             	pushl  0xc(%ebp)
80104a4f:	ff 75 f4             	pushl  -0xc(%ebp)
80104a52:	e8 b9 fe ff ff       	call   80104910 <fetchstr>
80104a57:	83 c4 10             	add    $0x10,%esp
80104a5a:	c9                   	leave  
80104a5b:	c3                   	ret    
80104a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a65:	c9                   	leave  
80104a66:	c3                   	ret    
80104a67:	89 f6                	mov    %esi,%esi
80104a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a70 <syscall>:
80104a70:	55                   	push   %ebp
80104a71:	89 e5                	mov    %esp,%ebp
80104a73:	53                   	push   %ebx
80104a74:	83 ec 04             	sub    $0x4,%esp
80104a77:	e8 24 ee ff ff       	call   801038a0 <myproc>
80104a7c:	89 c3                	mov    %eax,%ebx
80104a7e:	8b 40 1c             	mov    0x1c(%eax),%eax
80104a81:	8b 40 1c             	mov    0x1c(%eax),%eax
80104a84:	8d 50 ff             	lea    -0x1(%eax),%edx
80104a87:	83 fa 16             	cmp    $0x16,%edx
80104a8a:	77 1c                	ja     80104aa8 <syscall+0x38>
80104a8c:	8b 14 85 e0 7b 10 80 	mov    -0x7fef8420(,%eax,4),%edx
80104a93:	85 d2                	test   %edx,%edx
80104a95:	74 11                	je     80104aa8 <syscall+0x38>
80104a97:	ff d2                	call   *%edx
80104a99:	8b 53 1c             	mov    0x1c(%ebx),%edx
80104a9c:	89 42 1c             	mov    %eax,0x1c(%edx)
80104a9f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104aa2:	c9                   	leave  
80104aa3:	c3                   	ret    
80104aa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104aa8:	50                   	push   %eax
80104aa9:	8d 43 70             	lea    0x70(%ebx),%eax
80104aac:	50                   	push   %eax
80104aad:	ff 73 14             	pushl  0x14(%ebx)
80104ab0:	68 b5 7b 10 80       	push   $0x80107bb5
80104ab5:	e8 a6 bb ff ff       	call   80100660 <cprintf>
80104aba:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104abd:	83 c4 10             	add    $0x10,%esp
80104ac0:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80104ac7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104aca:	c9                   	leave  
80104acb:	c3                   	ret    
80104acc:	66 90                	xchg   %ax,%ax
80104ace:	66 90                	xchg   %ax,%ax

80104ad0 <create>:
80104ad0:	55                   	push   %ebp
80104ad1:	89 e5                	mov    %esp,%ebp
80104ad3:	57                   	push   %edi
80104ad4:	56                   	push   %esi
80104ad5:	53                   	push   %ebx
80104ad6:	8d 75 da             	lea    -0x26(%ebp),%esi
80104ad9:	83 ec 34             	sub    $0x34,%esp
80104adc:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104adf:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104ae2:	56                   	push   %esi
80104ae3:	50                   	push   %eax
80104ae4:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104ae7:	89 4d cc             	mov    %ecx,-0x34(%ebp)
80104aea:	e8 51 d4 ff ff       	call   80101f40 <nameiparent>
80104aef:	83 c4 10             	add    $0x10,%esp
80104af2:	85 c0                	test   %eax,%eax
80104af4:	0f 84 46 01 00 00    	je     80104c40 <create+0x170>
80104afa:	83 ec 0c             	sub    $0xc,%esp
80104afd:	89 c3                	mov    %eax,%ebx
80104aff:	50                   	push   %eax
80104b00:	e8 bb cb ff ff       	call   801016c0 <ilock>
80104b05:	83 c4 0c             	add    $0xc,%esp
80104b08:	6a 00                	push   $0x0
80104b0a:	56                   	push   %esi
80104b0b:	53                   	push   %ebx
80104b0c:	e8 df d0 ff ff       	call   80101bf0 <dirlookup>
80104b11:	83 c4 10             	add    $0x10,%esp
80104b14:	85 c0                	test   %eax,%eax
80104b16:	89 c7                	mov    %eax,%edi
80104b18:	74 36                	je     80104b50 <create+0x80>
80104b1a:	83 ec 0c             	sub    $0xc,%esp
80104b1d:	53                   	push   %ebx
80104b1e:	e8 2d ce ff ff       	call   80101950 <iunlockput>
80104b23:	89 3c 24             	mov    %edi,(%esp)
80104b26:	e8 95 cb ff ff       	call   801016c0 <ilock>
80104b2b:	83 c4 10             	add    $0x10,%esp
80104b2e:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104b33:	0f 85 97 00 00 00    	jne    80104bd0 <create+0x100>
80104b39:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104b3e:	0f 85 8c 00 00 00    	jne    80104bd0 <create+0x100>
80104b44:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b47:	89 f8                	mov    %edi,%eax
80104b49:	5b                   	pop    %ebx
80104b4a:	5e                   	pop    %esi
80104b4b:	5f                   	pop    %edi
80104b4c:	5d                   	pop    %ebp
80104b4d:	c3                   	ret    
80104b4e:	66 90                	xchg   %ax,%ax
80104b50:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104b54:	83 ec 08             	sub    $0x8,%esp
80104b57:	50                   	push   %eax
80104b58:	ff 33                	pushl  (%ebx)
80104b5a:	e8 f1 c9 ff ff       	call   80101550 <ialloc>
80104b5f:	83 c4 10             	add    $0x10,%esp
80104b62:	85 c0                	test   %eax,%eax
80104b64:	89 c7                	mov    %eax,%edi
80104b66:	0f 84 e8 00 00 00    	je     80104c54 <create+0x184>
80104b6c:	83 ec 0c             	sub    $0xc,%esp
80104b6f:	50                   	push   %eax
80104b70:	e8 4b cb ff ff       	call   801016c0 <ilock>
80104b75:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104b79:	66 89 47 52          	mov    %ax,0x52(%edi)
80104b7d:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104b81:	66 89 47 54          	mov    %ax,0x54(%edi)
80104b85:	b8 01 00 00 00       	mov    $0x1,%eax
80104b8a:	66 89 47 56          	mov    %ax,0x56(%edi)
80104b8e:	89 3c 24             	mov    %edi,(%esp)
80104b91:	e8 7a ca ff ff       	call   80101610 <iupdate>
80104b96:	83 c4 10             	add    $0x10,%esp
80104b99:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104b9e:	74 50                	je     80104bf0 <create+0x120>
80104ba0:	83 ec 04             	sub    $0x4,%esp
80104ba3:	ff 77 04             	pushl  0x4(%edi)
80104ba6:	56                   	push   %esi
80104ba7:	53                   	push   %ebx
80104ba8:	e8 b3 d2 ff ff       	call   80101e60 <dirlink>
80104bad:	83 c4 10             	add    $0x10,%esp
80104bb0:	85 c0                	test   %eax,%eax
80104bb2:	0f 88 8f 00 00 00    	js     80104c47 <create+0x177>
80104bb8:	83 ec 0c             	sub    $0xc,%esp
80104bbb:	53                   	push   %ebx
80104bbc:	e8 8f cd ff ff       	call   80101950 <iunlockput>
80104bc1:	83 c4 10             	add    $0x10,%esp
80104bc4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104bc7:	89 f8                	mov    %edi,%eax
80104bc9:	5b                   	pop    %ebx
80104bca:	5e                   	pop    %esi
80104bcb:	5f                   	pop    %edi
80104bcc:	5d                   	pop    %ebp
80104bcd:	c3                   	ret    
80104bce:	66 90                	xchg   %ax,%ax
80104bd0:	83 ec 0c             	sub    $0xc,%esp
80104bd3:	57                   	push   %edi
80104bd4:	31 ff                	xor    %edi,%edi
80104bd6:	e8 75 cd ff ff       	call   80101950 <iunlockput>
80104bdb:	83 c4 10             	add    $0x10,%esp
80104bde:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104be1:	89 f8                	mov    %edi,%eax
80104be3:	5b                   	pop    %ebx
80104be4:	5e                   	pop    %esi
80104be5:	5f                   	pop    %edi
80104be6:	5d                   	pop    %ebp
80104be7:	c3                   	ret    
80104be8:	90                   	nop
80104be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104bf0:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104bf5:	83 ec 0c             	sub    $0xc,%esp
80104bf8:	53                   	push   %ebx
80104bf9:	e8 12 ca ff ff       	call   80101610 <iupdate>
80104bfe:	83 c4 0c             	add    $0xc,%esp
80104c01:	ff 77 04             	pushl  0x4(%edi)
80104c04:	68 5c 7c 10 80       	push   $0x80107c5c
80104c09:	57                   	push   %edi
80104c0a:	e8 51 d2 ff ff       	call   80101e60 <dirlink>
80104c0f:	83 c4 10             	add    $0x10,%esp
80104c12:	85 c0                	test   %eax,%eax
80104c14:	78 1c                	js     80104c32 <create+0x162>
80104c16:	83 ec 04             	sub    $0x4,%esp
80104c19:	ff 73 04             	pushl  0x4(%ebx)
80104c1c:	68 5b 7c 10 80       	push   $0x80107c5b
80104c21:	57                   	push   %edi
80104c22:	e8 39 d2 ff ff       	call   80101e60 <dirlink>
80104c27:	83 c4 10             	add    $0x10,%esp
80104c2a:	85 c0                	test   %eax,%eax
80104c2c:	0f 89 6e ff ff ff    	jns    80104ba0 <create+0xd0>
80104c32:	83 ec 0c             	sub    $0xc,%esp
80104c35:	68 4f 7c 10 80       	push   $0x80107c4f
80104c3a:	e8 51 b7 ff ff       	call   80100390 <panic>
80104c3f:	90                   	nop
80104c40:	31 ff                	xor    %edi,%edi
80104c42:	e9 fd fe ff ff       	jmp    80104b44 <create+0x74>
80104c47:	83 ec 0c             	sub    $0xc,%esp
80104c4a:	68 5e 7c 10 80       	push   $0x80107c5e
80104c4f:	e8 3c b7 ff ff       	call   80100390 <panic>
80104c54:	83 ec 0c             	sub    $0xc,%esp
80104c57:	68 40 7c 10 80       	push   $0x80107c40
80104c5c:	e8 2f b7 ff ff       	call   80100390 <panic>
80104c61:	eb 0d                	jmp    80104c70 <argfd.constprop.0>
80104c63:	90                   	nop
80104c64:	90                   	nop
80104c65:	90                   	nop
80104c66:	90                   	nop
80104c67:	90                   	nop
80104c68:	90                   	nop
80104c69:	90                   	nop
80104c6a:	90                   	nop
80104c6b:	90                   	nop
80104c6c:	90                   	nop
80104c6d:	90                   	nop
80104c6e:	90                   	nop
80104c6f:	90                   	nop

80104c70 <argfd.constprop.0>:
80104c70:	55                   	push   %ebp
80104c71:	89 e5                	mov    %esp,%ebp
80104c73:	56                   	push   %esi
80104c74:	53                   	push   %ebx
80104c75:	89 c3                	mov    %eax,%ebx
80104c77:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c7a:	89 d6                	mov    %edx,%esi
80104c7c:	83 ec 18             	sub    $0x18,%esp
80104c7f:	50                   	push   %eax
80104c80:	6a 00                	push   $0x0
80104c82:	e8 f9 fc ff ff       	call   80104980 <argint>
80104c87:	83 c4 10             	add    $0x10,%esp
80104c8a:	85 c0                	test   %eax,%eax
80104c8c:	78 2a                	js     80104cb8 <argfd.constprop.0+0x48>
80104c8e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104c92:	77 24                	ja     80104cb8 <argfd.constprop.0+0x48>
80104c94:	e8 07 ec ff ff       	call   801038a0 <myproc>
80104c99:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104c9c:	8b 44 90 2c          	mov    0x2c(%eax,%edx,4),%eax
80104ca0:	85 c0                	test   %eax,%eax
80104ca2:	74 14                	je     80104cb8 <argfd.constprop.0+0x48>
80104ca4:	85 db                	test   %ebx,%ebx
80104ca6:	74 02                	je     80104caa <argfd.constprop.0+0x3a>
80104ca8:	89 13                	mov    %edx,(%ebx)
80104caa:	89 06                	mov    %eax,(%esi)
80104cac:	31 c0                	xor    %eax,%eax
80104cae:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104cb1:	5b                   	pop    %ebx
80104cb2:	5e                   	pop    %esi
80104cb3:	5d                   	pop    %ebp
80104cb4:	c3                   	ret    
80104cb5:	8d 76 00             	lea    0x0(%esi),%esi
80104cb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cbd:	eb ef                	jmp    80104cae <argfd.constprop.0+0x3e>
80104cbf:	90                   	nop

80104cc0 <sys_dup>:
80104cc0:	55                   	push   %ebp
80104cc1:	31 c0                	xor    %eax,%eax
80104cc3:	89 e5                	mov    %esp,%ebp
80104cc5:	56                   	push   %esi
80104cc6:	53                   	push   %ebx
80104cc7:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104cca:	83 ec 10             	sub    $0x10,%esp
80104ccd:	e8 9e ff ff ff       	call   80104c70 <argfd.constprop.0>
80104cd2:	85 c0                	test   %eax,%eax
80104cd4:	78 42                	js     80104d18 <sys_dup+0x58>
80104cd6:	8b 75 f4             	mov    -0xc(%ebp),%esi
80104cd9:	31 db                	xor    %ebx,%ebx
80104cdb:	e8 c0 eb ff ff       	call   801038a0 <myproc>
80104ce0:	eb 0e                	jmp    80104cf0 <sys_dup+0x30>
80104ce2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104ce8:	83 c3 01             	add    $0x1,%ebx
80104ceb:	83 fb 10             	cmp    $0x10,%ebx
80104cee:	74 28                	je     80104d18 <sys_dup+0x58>
80104cf0:	8b 54 98 2c          	mov    0x2c(%eax,%ebx,4),%edx
80104cf4:	85 d2                	test   %edx,%edx
80104cf6:	75 f0                	jne    80104ce8 <sys_dup+0x28>
80104cf8:	89 74 98 2c          	mov    %esi,0x2c(%eax,%ebx,4)
80104cfc:	83 ec 0c             	sub    $0xc,%esp
80104cff:	ff 75 f4             	pushl  -0xc(%ebp)
80104d02:	e8 29 c1 ff ff       	call   80100e30 <filedup>
80104d07:	83 c4 10             	add    $0x10,%esp
80104d0a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d0d:	89 d8                	mov    %ebx,%eax
80104d0f:	5b                   	pop    %ebx
80104d10:	5e                   	pop    %esi
80104d11:	5d                   	pop    %ebp
80104d12:	c3                   	ret    
80104d13:	90                   	nop
80104d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104d18:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d1b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104d20:	89 d8                	mov    %ebx,%eax
80104d22:	5b                   	pop    %ebx
80104d23:	5e                   	pop    %esi
80104d24:	5d                   	pop    %ebp
80104d25:	c3                   	ret    
80104d26:	8d 76 00             	lea    0x0(%esi),%esi
80104d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d30 <sys_getreadcount>:
80104d30:	55                   	push   %ebp
80104d31:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
80104d36:	89 e5                	mov    %esp,%ebp
80104d38:	5d                   	pop    %ebp
80104d39:	c3                   	ret    
80104d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104d40 <sys_read>:
80104d40:	55                   	push   %ebp
80104d41:	31 c0                	xor    %eax,%eax
80104d43:	89 e5                	mov    %esp,%ebp
80104d45:	83 ec 18             	sub    $0x18,%esp
80104d48:	83 05 bc a5 10 80 01 	addl   $0x1,0x8010a5bc
80104d4f:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104d52:	e8 19 ff ff ff       	call   80104c70 <argfd.constprop.0>
80104d57:	85 c0                	test   %eax,%eax
80104d59:	78 45                	js     80104da0 <sys_read+0x60>
80104d5b:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d5e:	83 ec 08             	sub    $0x8,%esp
80104d61:	50                   	push   %eax
80104d62:	6a 02                	push   $0x2
80104d64:	e8 17 fc ff ff       	call   80104980 <argint>
80104d69:	83 c4 10             	add    $0x10,%esp
80104d6c:	85 c0                	test   %eax,%eax
80104d6e:	78 30                	js     80104da0 <sys_read+0x60>
80104d70:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d73:	83 ec 04             	sub    $0x4,%esp
80104d76:	ff 75 f0             	pushl  -0x10(%ebp)
80104d79:	50                   	push   %eax
80104d7a:	6a 01                	push   $0x1
80104d7c:	e8 4f fc ff ff       	call   801049d0 <argptr>
80104d81:	83 c4 10             	add    $0x10,%esp
80104d84:	85 c0                	test   %eax,%eax
80104d86:	78 18                	js     80104da0 <sys_read+0x60>
80104d88:	83 ec 04             	sub    $0x4,%esp
80104d8b:	ff 75 f0             	pushl  -0x10(%ebp)
80104d8e:	ff 75 f4             	pushl  -0xc(%ebp)
80104d91:	ff 75 ec             	pushl  -0x14(%ebp)
80104d94:	e8 07 c2 ff ff       	call   80100fa0 <fileread>
80104d99:	83 c4 10             	add    $0x10,%esp
80104d9c:	c9                   	leave  
80104d9d:	c3                   	ret    
80104d9e:	66 90                	xchg   %ax,%ax
80104da0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104da5:	c9                   	leave  
80104da6:	c3                   	ret    
80104da7:	89 f6                	mov    %esi,%esi
80104da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104db0 <sys_write>:
80104db0:	55                   	push   %ebp
80104db1:	31 c0                	xor    %eax,%eax
80104db3:	89 e5                	mov    %esp,%ebp
80104db5:	83 ec 18             	sub    $0x18,%esp
80104db8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104dbb:	e8 b0 fe ff ff       	call   80104c70 <argfd.constprop.0>
80104dc0:	85 c0                	test   %eax,%eax
80104dc2:	78 4c                	js     80104e10 <sys_write+0x60>
80104dc4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104dc7:	83 ec 08             	sub    $0x8,%esp
80104dca:	50                   	push   %eax
80104dcb:	6a 02                	push   $0x2
80104dcd:	e8 ae fb ff ff       	call   80104980 <argint>
80104dd2:	83 c4 10             	add    $0x10,%esp
80104dd5:	85 c0                	test   %eax,%eax
80104dd7:	78 37                	js     80104e10 <sys_write+0x60>
80104dd9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104ddc:	83 ec 04             	sub    $0x4,%esp
80104ddf:	ff 75 f0             	pushl  -0x10(%ebp)
80104de2:	50                   	push   %eax
80104de3:	6a 01                	push   $0x1
80104de5:	e8 e6 fb ff ff       	call   801049d0 <argptr>
80104dea:	83 c4 10             	add    $0x10,%esp
80104ded:	85 c0                	test   %eax,%eax
80104def:	78 1f                	js     80104e10 <sys_write+0x60>
80104df1:	83 ec 04             	sub    $0x4,%esp
80104df4:	ff 75 f0             	pushl  -0x10(%ebp)
80104df7:	ff 75 f4             	pushl  -0xc(%ebp)
80104dfa:	ff 75 ec             	pushl  -0x14(%ebp)
80104dfd:	e8 2e c2 ff ff       	call   80101030 <filewrite>
80104e02:	83 c4 10             	add    $0x10,%esp
80104e05:	c9                   	leave  
80104e06:	c3                   	ret    
80104e07:	89 f6                	mov    %esi,%esi
80104e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104e10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e15:	c9                   	leave  
80104e16:	c3                   	ret    
80104e17:	89 f6                	mov    %esi,%esi
80104e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e20 <sys_close>:
80104e20:	55                   	push   %ebp
80104e21:	89 e5                	mov    %esp,%ebp
80104e23:	83 ec 18             	sub    $0x18,%esp
80104e26:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104e29:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e2c:	e8 3f fe ff ff       	call   80104c70 <argfd.constprop.0>
80104e31:	85 c0                	test   %eax,%eax
80104e33:	78 2b                	js     80104e60 <sys_close+0x40>
80104e35:	e8 66 ea ff ff       	call   801038a0 <myproc>
80104e3a:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104e3d:	83 ec 0c             	sub    $0xc,%esp
80104e40:	c7 44 90 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edx,4)
80104e47:	00 
80104e48:	ff 75 f4             	pushl  -0xc(%ebp)
80104e4b:	e8 30 c0 ff ff       	call   80100e80 <fileclose>
80104e50:	83 c4 10             	add    $0x10,%esp
80104e53:	31 c0                	xor    %eax,%eax
80104e55:	c9                   	leave  
80104e56:	c3                   	ret    
80104e57:	89 f6                	mov    %esi,%esi
80104e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104e60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e65:	c9                   	leave  
80104e66:	c3                   	ret    
80104e67:	89 f6                	mov    %esi,%esi
80104e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e70 <sys_fstat>:
80104e70:	55                   	push   %ebp
80104e71:	31 c0                	xor    %eax,%eax
80104e73:	89 e5                	mov    %esp,%ebp
80104e75:	83 ec 18             	sub    $0x18,%esp
80104e78:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104e7b:	e8 f0 fd ff ff       	call   80104c70 <argfd.constprop.0>
80104e80:	85 c0                	test   %eax,%eax
80104e82:	78 2c                	js     80104eb0 <sys_fstat+0x40>
80104e84:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e87:	83 ec 04             	sub    $0x4,%esp
80104e8a:	6a 14                	push   $0x14
80104e8c:	50                   	push   %eax
80104e8d:	6a 01                	push   $0x1
80104e8f:	e8 3c fb ff ff       	call   801049d0 <argptr>
80104e94:	83 c4 10             	add    $0x10,%esp
80104e97:	85 c0                	test   %eax,%eax
80104e99:	78 15                	js     80104eb0 <sys_fstat+0x40>
80104e9b:	83 ec 08             	sub    $0x8,%esp
80104e9e:	ff 75 f4             	pushl  -0xc(%ebp)
80104ea1:	ff 75 f0             	pushl  -0x10(%ebp)
80104ea4:	e8 a7 c0 ff ff       	call   80100f50 <filestat>
80104ea9:	83 c4 10             	add    $0x10,%esp
80104eac:	c9                   	leave  
80104ead:	c3                   	ret    
80104eae:	66 90                	xchg   %ax,%ax
80104eb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104eb5:	c9                   	leave  
80104eb6:	c3                   	ret    
80104eb7:	89 f6                	mov    %esi,%esi
80104eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ec0 <sys_link>:
80104ec0:	55                   	push   %ebp
80104ec1:	89 e5                	mov    %esp,%ebp
80104ec3:	57                   	push   %edi
80104ec4:	56                   	push   %esi
80104ec5:	53                   	push   %ebx
80104ec6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104ec9:	83 ec 34             	sub    $0x34,%esp
80104ecc:	50                   	push   %eax
80104ecd:	6a 00                	push   $0x0
80104ecf:	e8 5c fb ff ff       	call   80104a30 <argstr>
80104ed4:	83 c4 10             	add    $0x10,%esp
80104ed7:	85 c0                	test   %eax,%eax
80104ed9:	0f 88 fb 00 00 00    	js     80104fda <sys_link+0x11a>
80104edf:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104ee2:	83 ec 08             	sub    $0x8,%esp
80104ee5:	50                   	push   %eax
80104ee6:	6a 01                	push   $0x1
80104ee8:	e8 43 fb ff ff       	call   80104a30 <argstr>
80104eed:	83 c4 10             	add    $0x10,%esp
80104ef0:	85 c0                	test   %eax,%eax
80104ef2:	0f 88 e2 00 00 00    	js     80104fda <sys_link+0x11a>
80104ef8:	e8 33 dd ff ff       	call   80102c30 <begin_op>
80104efd:	83 ec 0c             	sub    $0xc,%esp
80104f00:	ff 75 d4             	pushl  -0x2c(%ebp)
80104f03:	e8 18 d0 ff ff       	call   80101f20 <namei>
80104f08:	83 c4 10             	add    $0x10,%esp
80104f0b:	85 c0                	test   %eax,%eax
80104f0d:	89 c3                	mov    %eax,%ebx
80104f0f:	0f 84 ea 00 00 00    	je     80104fff <sys_link+0x13f>
80104f15:	83 ec 0c             	sub    $0xc,%esp
80104f18:	50                   	push   %eax
80104f19:	e8 a2 c7 ff ff       	call   801016c0 <ilock>
80104f1e:	83 c4 10             	add    $0x10,%esp
80104f21:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f26:	0f 84 bb 00 00 00    	je     80104fe7 <sys_link+0x127>
80104f2c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104f31:	83 ec 0c             	sub    $0xc,%esp
80104f34:	8d 7d da             	lea    -0x26(%ebp),%edi
80104f37:	53                   	push   %ebx
80104f38:	e8 d3 c6 ff ff       	call   80101610 <iupdate>
80104f3d:	89 1c 24             	mov    %ebx,(%esp)
80104f40:	e8 5b c8 ff ff       	call   801017a0 <iunlock>
80104f45:	58                   	pop    %eax
80104f46:	5a                   	pop    %edx
80104f47:	57                   	push   %edi
80104f48:	ff 75 d0             	pushl  -0x30(%ebp)
80104f4b:	e8 f0 cf ff ff       	call   80101f40 <nameiparent>
80104f50:	83 c4 10             	add    $0x10,%esp
80104f53:	85 c0                	test   %eax,%eax
80104f55:	89 c6                	mov    %eax,%esi
80104f57:	74 5b                	je     80104fb4 <sys_link+0xf4>
80104f59:	83 ec 0c             	sub    $0xc,%esp
80104f5c:	50                   	push   %eax
80104f5d:	e8 5e c7 ff ff       	call   801016c0 <ilock>
80104f62:	83 c4 10             	add    $0x10,%esp
80104f65:	8b 03                	mov    (%ebx),%eax
80104f67:	39 06                	cmp    %eax,(%esi)
80104f69:	75 3d                	jne    80104fa8 <sys_link+0xe8>
80104f6b:	83 ec 04             	sub    $0x4,%esp
80104f6e:	ff 73 04             	pushl  0x4(%ebx)
80104f71:	57                   	push   %edi
80104f72:	56                   	push   %esi
80104f73:	e8 e8 ce ff ff       	call   80101e60 <dirlink>
80104f78:	83 c4 10             	add    $0x10,%esp
80104f7b:	85 c0                	test   %eax,%eax
80104f7d:	78 29                	js     80104fa8 <sys_link+0xe8>
80104f7f:	83 ec 0c             	sub    $0xc,%esp
80104f82:	56                   	push   %esi
80104f83:	e8 c8 c9 ff ff       	call   80101950 <iunlockput>
80104f88:	89 1c 24             	mov    %ebx,(%esp)
80104f8b:	e8 60 c8 ff ff       	call   801017f0 <iput>
80104f90:	e8 0b dd ff ff       	call   80102ca0 <end_op>
80104f95:	83 c4 10             	add    $0x10,%esp
80104f98:	31 c0                	xor    %eax,%eax
80104f9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f9d:	5b                   	pop    %ebx
80104f9e:	5e                   	pop    %esi
80104f9f:	5f                   	pop    %edi
80104fa0:	5d                   	pop    %ebp
80104fa1:	c3                   	ret    
80104fa2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104fa8:	83 ec 0c             	sub    $0xc,%esp
80104fab:	56                   	push   %esi
80104fac:	e8 9f c9 ff ff       	call   80101950 <iunlockput>
80104fb1:	83 c4 10             	add    $0x10,%esp
80104fb4:	83 ec 0c             	sub    $0xc,%esp
80104fb7:	53                   	push   %ebx
80104fb8:	e8 03 c7 ff ff       	call   801016c0 <ilock>
80104fbd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104fc2:	89 1c 24             	mov    %ebx,(%esp)
80104fc5:	e8 46 c6 ff ff       	call   80101610 <iupdate>
80104fca:	89 1c 24             	mov    %ebx,(%esp)
80104fcd:	e8 7e c9 ff ff       	call   80101950 <iunlockput>
80104fd2:	e8 c9 dc ff ff       	call   80102ca0 <end_op>
80104fd7:	83 c4 10             	add    $0x10,%esp
80104fda:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fdd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fe2:	5b                   	pop    %ebx
80104fe3:	5e                   	pop    %esi
80104fe4:	5f                   	pop    %edi
80104fe5:	5d                   	pop    %ebp
80104fe6:	c3                   	ret    
80104fe7:	83 ec 0c             	sub    $0xc,%esp
80104fea:	53                   	push   %ebx
80104feb:	e8 60 c9 ff ff       	call   80101950 <iunlockput>
80104ff0:	e8 ab dc ff ff       	call   80102ca0 <end_op>
80104ff5:	83 c4 10             	add    $0x10,%esp
80104ff8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ffd:	eb 9b                	jmp    80104f9a <sys_link+0xda>
80104fff:	e8 9c dc ff ff       	call   80102ca0 <end_op>
80105004:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105009:	eb 8f                	jmp    80104f9a <sys_link+0xda>
8010500b:	90                   	nop
8010500c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105010 <sys_unlink>:
80105010:	55                   	push   %ebp
80105011:	89 e5                	mov    %esp,%ebp
80105013:	57                   	push   %edi
80105014:	56                   	push   %esi
80105015:	53                   	push   %ebx
80105016:	8d 45 c0             	lea    -0x40(%ebp),%eax
80105019:	83 ec 44             	sub    $0x44,%esp
8010501c:	50                   	push   %eax
8010501d:	6a 00                	push   $0x0
8010501f:	e8 0c fa ff ff       	call   80104a30 <argstr>
80105024:	83 c4 10             	add    $0x10,%esp
80105027:	85 c0                	test   %eax,%eax
80105029:	0f 88 77 01 00 00    	js     801051a6 <sys_unlink+0x196>
8010502f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80105032:	e8 f9 db ff ff       	call   80102c30 <begin_op>
80105037:	83 ec 08             	sub    $0x8,%esp
8010503a:	53                   	push   %ebx
8010503b:	ff 75 c0             	pushl  -0x40(%ebp)
8010503e:	e8 fd ce ff ff       	call   80101f40 <nameiparent>
80105043:	83 c4 10             	add    $0x10,%esp
80105046:	85 c0                	test   %eax,%eax
80105048:	89 c6                	mov    %eax,%esi
8010504a:	0f 84 60 01 00 00    	je     801051b0 <sys_unlink+0x1a0>
80105050:	83 ec 0c             	sub    $0xc,%esp
80105053:	50                   	push   %eax
80105054:	e8 67 c6 ff ff       	call   801016c0 <ilock>
80105059:	58                   	pop    %eax
8010505a:	5a                   	pop    %edx
8010505b:	68 5c 7c 10 80       	push   $0x80107c5c
80105060:	53                   	push   %ebx
80105061:	e8 6a cb ff ff       	call   80101bd0 <namecmp>
80105066:	83 c4 10             	add    $0x10,%esp
80105069:	85 c0                	test   %eax,%eax
8010506b:	0f 84 03 01 00 00    	je     80105174 <sys_unlink+0x164>
80105071:	83 ec 08             	sub    $0x8,%esp
80105074:	68 5b 7c 10 80       	push   $0x80107c5b
80105079:	53                   	push   %ebx
8010507a:	e8 51 cb ff ff       	call   80101bd0 <namecmp>
8010507f:	83 c4 10             	add    $0x10,%esp
80105082:	85 c0                	test   %eax,%eax
80105084:	0f 84 ea 00 00 00    	je     80105174 <sys_unlink+0x164>
8010508a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
8010508d:	83 ec 04             	sub    $0x4,%esp
80105090:	50                   	push   %eax
80105091:	53                   	push   %ebx
80105092:	56                   	push   %esi
80105093:	e8 58 cb ff ff       	call   80101bf0 <dirlookup>
80105098:	83 c4 10             	add    $0x10,%esp
8010509b:	85 c0                	test   %eax,%eax
8010509d:	89 c3                	mov    %eax,%ebx
8010509f:	0f 84 cf 00 00 00    	je     80105174 <sys_unlink+0x164>
801050a5:	83 ec 0c             	sub    $0xc,%esp
801050a8:	50                   	push   %eax
801050a9:	e8 12 c6 ff ff       	call   801016c0 <ilock>
801050ae:	83 c4 10             	add    $0x10,%esp
801050b1:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801050b6:	0f 8e 10 01 00 00    	jle    801051cc <sys_unlink+0x1bc>
801050bc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801050c1:	74 6d                	je     80105130 <sys_unlink+0x120>
801050c3:	8d 45 d8             	lea    -0x28(%ebp),%eax
801050c6:	83 ec 04             	sub    $0x4,%esp
801050c9:	6a 10                	push   $0x10
801050cb:	6a 00                	push   $0x0
801050cd:	50                   	push   %eax
801050ce:	e8 ad f5 ff ff       	call   80104680 <memset>
801050d3:	8d 45 d8             	lea    -0x28(%ebp),%eax
801050d6:	6a 10                	push   $0x10
801050d8:	ff 75 c4             	pushl  -0x3c(%ebp)
801050db:	50                   	push   %eax
801050dc:	56                   	push   %esi
801050dd:	e8 be c9 ff ff       	call   80101aa0 <writei>
801050e2:	83 c4 20             	add    $0x20,%esp
801050e5:	83 f8 10             	cmp    $0x10,%eax
801050e8:	0f 85 eb 00 00 00    	jne    801051d9 <sys_unlink+0x1c9>
801050ee:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801050f3:	0f 84 97 00 00 00    	je     80105190 <sys_unlink+0x180>
801050f9:	83 ec 0c             	sub    $0xc,%esp
801050fc:	56                   	push   %esi
801050fd:	e8 4e c8 ff ff       	call   80101950 <iunlockput>
80105102:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80105107:	89 1c 24             	mov    %ebx,(%esp)
8010510a:	e8 01 c5 ff ff       	call   80101610 <iupdate>
8010510f:	89 1c 24             	mov    %ebx,(%esp)
80105112:	e8 39 c8 ff ff       	call   80101950 <iunlockput>
80105117:	e8 84 db ff ff       	call   80102ca0 <end_op>
8010511c:	83 c4 10             	add    $0x10,%esp
8010511f:	31 c0                	xor    %eax,%eax
80105121:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105124:	5b                   	pop    %ebx
80105125:	5e                   	pop    %esi
80105126:	5f                   	pop    %edi
80105127:	5d                   	pop    %ebp
80105128:	c3                   	ret    
80105129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105130:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105134:	76 8d                	jbe    801050c3 <sys_unlink+0xb3>
80105136:	bf 20 00 00 00       	mov    $0x20,%edi
8010513b:	eb 0f                	jmp    8010514c <sys_unlink+0x13c>
8010513d:	8d 76 00             	lea    0x0(%esi),%esi
80105140:	83 c7 10             	add    $0x10,%edi
80105143:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105146:	0f 83 77 ff ff ff    	jae    801050c3 <sys_unlink+0xb3>
8010514c:	8d 45 d8             	lea    -0x28(%ebp),%eax
8010514f:	6a 10                	push   $0x10
80105151:	57                   	push   %edi
80105152:	50                   	push   %eax
80105153:	53                   	push   %ebx
80105154:	e8 47 c8 ff ff       	call   801019a0 <readi>
80105159:	83 c4 10             	add    $0x10,%esp
8010515c:	83 f8 10             	cmp    $0x10,%eax
8010515f:	75 5e                	jne    801051bf <sys_unlink+0x1af>
80105161:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105166:	74 d8                	je     80105140 <sys_unlink+0x130>
80105168:	83 ec 0c             	sub    $0xc,%esp
8010516b:	53                   	push   %ebx
8010516c:	e8 df c7 ff ff       	call   80101950 <iunlockput>
80105171:	83 c4 10             	add    $0x10,%esp
80105174:	83 ec 0c             	sub    $0xc,%esp
80105177:	56                   	push   %esi
80105178:	e8 d3 c7 ff ff       	call   80101950 <iunlockput>
8010517d:	e8 1e db ff ff       	call   80102ca0 <end_op>
80105182:	83 c4 10             	add    $0x10,%esp
80105185:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010518a:	eb 95                	jmp    80105121 <sys_unlink+0x111>
8010518c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105190:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
80105195:	83 ec 0c             	sub    $0xc,%esp
80105198:	56                   	push   %esi
80105199:	e8 72 c4 ff ff       	call   80101610 <iupdate>
8010519e:	83 c4 10             	add    $0x10,%esp
801051a1:	e9 53 ff ff ff       	jmp    801050f9 <sys_unlink+0xe9>
801051a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051ab:	e9 71 ff ff ff       	jmp    80105121 <sys_unlink+0x111>
801051b0:	e8 eb da ff ff       	call   80102ca0 <end_op>
801051b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051ba:	e9 62 ff ff ff       	jmp    80105121 <sys_unlink+0x111>
801051bf:	83 ec 0c             	sub    $0xc,%esp
801051c2:	68 80 7c 10 80       	push   $0x80107c80
801051c7:	e8 c4 b1 ff ff       	call   80100390 <panic>
801051cc:	83 ec 0c             	sub    $0xc,%esp
801051cf:	68 6e 7c 10 80       	push   $0x80107c6e
801051d4:	e8 b7 b1 ff ff       	call   80100390 <panic>
801051d9:	83 ec 0c             	sub    $0xc,%esp
801051dc:	68 92 7c 10 80       	push   $0x80107c92
801051e1:	e8 aa b1 ff ff       	call   80100390 <panic>
801051e6:	8d 76 00             	lea    0x0(%esi),%esi
801051e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801051f0 <sys_open>:
801051f0:	55                   	push   %ebp
801051f1:	89 e5                	mov    %esp,%ebp
801051f3:	57                   	push   %edi
801051f4:	56                   	push   %esi
801051f5:	53                   	push   %ebx
801051f6:	8d 45 e0             	lea    -0x20(%ebp),%eax
801051f9:	83 ec 24             	sub    $0x24,%esp
801051fc:	50                   	push   %eax
801051fd:	6a 00                	push   $0x0
801051ff:	e8 2c f8 ff ff       	call   80104a30 <argstr>
80105204:	83 c4 10             	add    $0x10,%esp
80105207:	85 c0                	test   %eax,%eax
80105209:	0f 88 1d 01 00 00    	js     8010532c <sys_open+0x13c>
8010520f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105212:	83 ec 08             	sub    $0x8,%esp
80105215:	50                   	push   %eax
80105216:	6a 01                	push   $0x1
80105218:	e8 63 f7 ff ff       	call   80104980 <argint>
8010521d:	83 c4 10             	add    $0x10,%esp
80105220:	85 c0                	test   %eax,%eax
80105222:	0f 88 04 01 00 00    	js     8010532c <sys_open+0x13c>
80105228:	e8 03 da ff ff       	call   80102c30 <begin_op>
8010522d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105231:	0f 85 a9 00 00 00    	jne    801052e0 <sys_open+0xf0>
80105237:	83 ec 0c             	sub    $0xc,%esp
8010523a:	ff 75 e0             	pushl  -0x20(%ebp)
8010523d:	e8 de cc ff ff       	call   80101f20 <namei>
80105242:	83 c4 10             	add    $0x10,%esp
80105245:	85 c0                	test   %eax,%eax
80105247:	89 c6                	mov    %eax,%esi
80105249:	0f 84 b2 00 00 00    	je     80105301 <sys_open+0x111>
8010524f:	83 ec 0c             	sub    $0xc,%esp
80105252:	50                   	push   %eax
80105253:	e8 68 c4 ff ff       	call   801016c0 <ilock>
80105258:	83 c4 10             	add    $0x10,%esp
8010525b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105260:	0f 84 aa 00 00 00    	je     80105310 <sys_open+0x120>
80105266:	e8 55 bb ff ff       	call   80100dc0 <filealloc>
8010526b:	85 c0                	test   %eax,%eax
8010526d:	89 c7                	mov    %eax,%edi
8010526f:	0f 84 a6 00 00 00    	je     8010531b <sys_open+0x12b>
80105275:	e8 26 e6 ff ff       	call   801038a0 <myproc>
8010527a:	31 db                	xor    %ebx,%ebx
8010527c:	eb 0e                	jmp    8010528c <sys_open+0x9c>
8010527e:	66 90                	xchg   %ax,%ax
80105280:	83 c3 01             	add    $0x1,%ebx
80105283:	83 fb 10             	cmp    $0x10,%ebx
80105286:	0f 84 ac 00 00 00    	je     80105338 <sys_open+0x148>
8010528c:	8b 54 98 2c          	mov    0x2c(%eax,%ebx,4),%edx
80105290:	85 d2                	test   %edx,%edx
80105292:	75 ec                	jne    80105280 <sys_open+0x90>
80105294:	83 ec 0c             	sub    $0xc,%esp
80105297:	89 7c 98 2c          	mov    %edi,0x2c(%eax,%ebx,4)
8010529b:	56                   	push   %esi
8010529c:	e8 ff c4 ff ff       	call   801017a0 <iunlock>
801052a1:	e8 fa d9 ff ff       	call   80102ca0 <end_op>
801052a6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
801052ac:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801052af:	83 c4 10             	add    $0x10,%esp
801052b2:	89 77 10             	mov    %esi,0x10(%edi)
801052b5:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
801052bc:	89 d0                	mov    %edx,%eax
801052be:	f7 d0                	not    %eax
801052c0:	83 e0 01             	and    $0x1,%eax
801052c3:	83 e2 03             	and    $0x3,%edx
801052c6:	88 47 08             	mov    %al,0x8(%edi)
801052c9:	0f 95 47 09          	setne  0x9(%edi)
801052cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801052d0:	89 d8                	mov    %ebx,%eax
801052d2:	5b                   	pop    %ebx
801052d3:	5e                   	pop    %esi
801052d4:	5f                   	pop    %edi
801052d5:	5d                   	pop    %ebp
801052d6:	c3                   	ret    
801052d7:	89 f6                	mov    %esi,%esi
801052d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801052e0:	83 ec 0c             	sub    $0xc,%esp
801052e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801052e6:	31 c9                	xor    %ecx,%ecx
801052e8:	6a 00                	push   $0x0
801052ea:	ba 02 00 00 00       	mov    $0x2,%edx
801052ef:	e8 dc f7 ff ff       	call   80104ad0 <create>
801052f4:	83 c4 10             	add    $0x10,%esp
801052f7:	85 c0                	test   %eax,%eax
801052f9:	89 c6                	mov    %eax,%esi
801052fb:	0f 85 65 ff ff ff    	jne    80105266 <sys_open+0x76>
80105301:	e8 9a d9 ff ff       	call   80102ca0 <end_op>
80105306:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010530b:	eb c0                	jmp    801052cd <sys_open+0xdd>
8010530d:	8d 76 00             	lea    0x0(%esi),%esi
80105310:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105313:	85 c9                	test   %ecx,%ecx
80105315:	0f 84 4b ff ff ff    	je     80105266 <sys_open+0x76>
8010531b:	83 ec 0c             	sub    $0xc,%esp
8010531e:	56                   	push   %esi
8010531f:	e8 2c c6 ff ff       	call   80101950 <iunlockput>
80105324:	e8 77 d9 ff ff       	call   80102ca0 <end_op>
80105329:	83 c4 10             	add    $0x10,%esp
8010532c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105331:	eb 9a                	jmp    801052cd <sys_open+0xdd>
80105333:	90                   	nop
80105334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105338:	83 ec 0c             	sub    $0xc,%esp
8010533b:	57                   	push   %edi
8010533c:	e8 3f bb ff ff       	call   80100e80 <fileclose>
80105341:	83 c4 10             	add    $0x10,%esp
80105344:	eb d5                	jmp    8010531b <sys_open+0x12b>
80105346:	8d 76 00             	lea    0x0(%esi),%esi
80105349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105350 <sys_mkdir>:
80105350:	55                   	push   %ebp
80105351:	89 e5                	mov    %esp,%ebp
80105353:	83 ec 18             	sub    $0x18,%esp
80105356:	e8 d5 d8 ff ff       	call   80102c30 <begin_op>
8010535b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010535e:	83 ec 08             	sub    $0x8,%esp
80105361:	50                   	push   %eax
80105362:	6a 00                	push   $0x0
80105364:	e8 c7 f6 ff ff       	call   80104a30 <argstr>
80105369:	83 c4 10             	add    $0x10,%esp
8010536c:	85 c0                	test   %eax,%eax
8010536e:	78 30                	js     801053a0 <sys_mkdir+0x50>
80105370:	83 ec 0c             	sub    $0xc,%esp
80105373:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105376:	31 c9                	xor    %ecx,%ecx
80105378:	6a 00                	push   $0x0
8010537a:	ba 01 00 00 00       	mov    $0x1,%edx
8010537f:	e8 4c f7 ff ff       	call   80104ad0 <create>
80105384:	83 c4 10             	add    $0x10,%esp
80105387:	85 c0                	test   %eax,%eax
80105389:	74 15                	je     801053a0 <sys_mkdir+0x50>
8010538b:	83 ec 0c             	sub    $0xc,%esp
8010538e:	50                   	push   %eax
8010538f:	e8 bc c5 ff ff       	call   80101950 <iunlockput>
80105394:	e8 07 d9 ff ff       	call   80102ca0 <end_op>
80105399:	83 c4 10             	add    $0x10,%esp
8010539c:	31 c0                	xor    %eax,%eax
8010539e:	c9                   	leave  
8010539f:	c3                   	ret    
801053a0:	e8 fb d8 ff ff       	call   80102ca0 <end_op>
801053a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053aa:	c9                   	leave  
801053ab:	c3                   	ret    
801053ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053b0 <sys_mknod>:
801053b0:	55                   	push   %ebp
801053b1:	89 e5                	mov    %esp,%ebp
801053b3:	83 ec 18             	sub    $0x18,%esp
801053b6:	e8 75 d8 ff ff       	call   80102c30 <begin_op>
801053bb:	8d 45 ec             	lea    -0x14(%ebp),%eax
801053be:	83 ec 08             	sub    $0x8,%esp
801053c1:	50                   	push   %eax
801053c2:	6a 00                	push   $0x0
801053c4:	e8 67 f6 ff ff       	call   80104a30 <argstr>
801053c9:	83 c4 10             	add    $0x10,%esp
801053cc:	85 c0                	test   %eax,%eax
801053ce:	78 60                	js     80105430 <sys_mknod+0x80>
801053d0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801053d3:	83 ec 08             	sub    $0x8,%esp
801053d6:	50                   	push   %eax
801053d7:	6a 01                	push   $0x1
801053d9:	e8 a2 f5 ff ff       	call   80104980 <argint>
801053de:	83 c4 10             	add    $0x10,%esp
801053e1:	85 c0                	test   %eax,%eax
801053e3:	78 4b                	js     80105430 <sys_mknod+0x80>
801053e5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053e8:	83 ec 08             	sub    $0x8,%esp
801053eb:	50                   	push   %eax
801053ec:	6a 02                	push   $0x2
801053ee:	e8 8d f5 ff ff       	call   80104980 <argint>
801053f3:	83 c4 10             	add    $0x10,%esp
801053f6:	85 c0                	test   %eax,%eax
801053f8:	78 36                	js     80105430 <sys_mknod+0x80>
801053fa:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801053fe:	83 ec 0c             	sub    $0xc,%esp
80105401:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105405:	ba 03 00 00 00       	mov    $0x3,%edx
8010540a:	50                   	push   %eax
8010540b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010540e:	e8 bd f6 ff ff       	call   80104ad0 <create>
80105413:	83 c4 10             	add    $0x10,%esp
80105416:	85 c0                	test   %eax,%eax
80105418:	74 16                	je     80105430 <sys_mknod+0x80>
8010541a:	83 ec 0c             	sub    $0xc,%esp
8010541d:	50                   	push   %eax
8010541e:	e8 2d c5 ff ff       	call   80101950 <iunlockput>
80105423:	e8 78 d8 ff ff       	call   80102ca0 <end_op>
80105428:	83 c4 10             	add    $0x10,%esp
8010542b:	31 c0                	xor    %eax,%eax
8010542d:	c9                   	leave  
8010542e:	c3                   	ret    
8010542f:	90                   	nop
80105430:	e8 6b d8 ff ff       	call   80102ca0 <end_op>
80105435:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010543a:	c9                   	leave  
8010543b:	c3                   	ret    
8010543c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105440 <sys_chdir>:
80105440:	55                   	push   %ebp
80105441:	89 e5                	mov    %esp,%ebp
80105443:	56                   	push   %esi
80105444:	53                   	push   %ebx
80105445:	83 ec 10             	sub    $0x10,%esp
80105448:	e8 53 e4 ff ff       	call   801038a0 <myproc>
8010544d:	89 c6                	mov    %eax,%esi
8010544f:	e8 dc d7 ff ff       	call   80102c30 <begin_op>
80105454:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105457:	83 ec 08             	sub    $0x8,%esp
8010545a:	50                   	push   %eax
8010545b:	6a 00                	push   $0x0
8010545d:	e8 ce f5 ff ff       	call   80104a30 <argstr>
80105462:	83 c4 10             	add    $0x10,%esp
80105465:	85 c0                	test   %eax,%eax
80105467:	78 77                	js     801054e0 <sys_chdir+0xa0>
80105469:	83 ec 0c             	sub    $0xc,%esp
8010546c:	ff 75 f4             	pushl  -0xc(%ebp)
8010546f:	e8 ac ca ff ff       	call   80101f20 <namei>
80105474:	83 c4 10             	add    $0x10,%esp
80105477:	85 c0                	test   %eax,%eax
80105479:	89 c3                	mov    %eax,%ebx
8010547b:	74 63                	je     801054e0 <sys_chdir+0xa0>
8010547d:	83 ec 0c             	sub    $0xc,%esp
80105480:	50                   	push   %eax
80105481:	e8 3a c2 ff ff       	call   801016c0 <ilock>
80105486:	83 c4 10             	add    $0x10,%esp
80105489:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010548e:	75 30                	jne    801054c0 <sys_chdir+0x80>
80105490:	83 ec 0c             	sub    $0xc,%esp
80105493:	53                   	push   %ebx
80105494:	e8 07 c3 ff ff       	call   801017a0 <iunlock>
80105499:	58                   	pop    %eax
8010549a:	ff 76 6c             	pushl  0x6c(%esi)
8010549d:	e8 4e c3 ff ff       	call   801017f0 <iput>
801054a2:	e8 f9 d7 ff ff       	call   80102ca0 <end_op>
801054a7:	89 5e 6c             	mov    %ebx,0x6c(%esi)
801054aa:	83 c4 10             	add    $0x10,%esp
801054ad:	31 c0                	xor    %eax,%eax
801054af:	8d 65 f8             	lea    -0x8(%ebp),%esp
801054b2:	5b                   	pop    %ebx
801054b3:	5e                   	pop    %esi
801054b4:	5d                   	pop    %ebp
801054b5:	c3                   	ret    
801054b6:	8d 76 00             	lea    0x0(%esi),%esi
801054b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801054c0:	83 ec 0c             	sub    $0xc,%esp
801054c3:	53                   	push   %ebx
801054c4:	e8 87 c4 ff ff       	call   80101950 <iunlockput>
801054c9:	e8 d2 d7 ff ff       	call   80102ca0 <end_op>
801054ce:	83 c4 10             	add    $0x10,%esp
801054d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054d6:	eb d7                	jmp    801054af <sys_chdir+0x6f>
801054d8:	90                   	nop
801054d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801054e0:	e8 bb d7 ff ff       	call   80102ca0 <end_op>
801054e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054ea:	eb c3                	jmp    801054af <sys_chdir+0x6f>
801054ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054f0 <sys_exec>:
801054f0:	55                   	push   %ebp
801054f1:	89 e5                	mov    %esp,%ebp
801054f3:	57                   	push   %edi
801054f4:	56                   	push   %esi
801054f5:	53                   	push   %ebx
801054f6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
801054fc:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80105502:	50                   	push   %eax
80105503:	6a 00                	push   $0x0
80105505:	e8 26 f5 ff ff       	call   80104a30 <argstr>
8010550a:	83 c4 10             	add    $0x10,%esp
8010550d:	85 c0                	test   %eax,%eax
8010550f:	0f 88 87 00 00 00    	js     8010559c <sys_exec+0xac>
80105515:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010551b:	83 ec 08             	sub    $0x8,%esp
8010551e:	50                   	push   %eax
8010551f:	6a 01                	push   $0x1
80105521:	e8 5a f4 ff ff       	call   80104980 <argint>
80105526:	83 c4 10             	add    $0x10,%esp
80105529:	85 c0                	test   %eax,%eax
8010552b:	78 6f                	js     8010559c <sys_exec+0xac>
8010552d:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105533:	83 ec 04             	sub    $0x4,%esp
80105536:	31 db                	xor    %ebx,%ebx
80105538:	68 80 00 00 00       	push   $0x80
8010553d:	6a 00                	push   $0x0
8010553f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105545:	50                   	push   %eax
80105546:	e8 35 f1 ff ff       	call   80104680 <memset>
8010554b:	83 c4 10             	add    $0x10,%esp
8010554e:	eb 2c                	jmp    8010557c <sys_exec+0x8c>
80105550:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105556:	85 c0                	test   %eax,%eax
80105558:	74 56                	je     801055b0 <sys_exec+0xc0>
8010555a:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
80105560:	83 ec 08             	sub    $0x8,%esp
80105563:	8d 14 31             	lea    (%ecx,%esi,1),%edx
80105566:	52                   	push   %edx
80105567:	50                   	push   %eax
80105568:	e8 a3 f3 ff ff       	call   80104910 <fetchstr>
8010556d:	83 c4 10             	add    $0x10,%esp
80105570:	85 c0                	test   %eax,%eax
80105572:	78 28                	js     8010559c <sys_exec+0xac>
80105574:	83 c3 01             	add    $0x1,%ebx
80105577:	83 fb 20             	cmp    $0x20,%ebx
8010557a:	74 20                	je     8010559c <sys_exec+0xac>
8010557c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105582:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
80105589:	83 ec 08             	sub    $0x8,%esp
8010558c:	57                   	push   %edi
8010558d:	01 f0                	add    %esi,%eax
8010558f:	50                   	push   %eax
80105590:	e8 3b f3 ff ff       	call   801048d0 <fetchint>
80105595:	83 c4 10             	add    $0x10,%esp
80105598:	85 c0                	test   %eax,%eax
8010559a:	79 b4                	jns    80105550 <sys_exec+0x60>
8010559c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010559f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055a4:	5b                   	pop    %ebx
801055a5:	5e                   	pop    %esi
801055a6:	5f                   	pop    %edi
801055a7:	5d                   	pop    %ebp
801055a8:	c3                   	ret    
801055a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801055b0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801055b6:	83 ec 08             	sub    $0x8,%esp
801055b9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801055c0:	00 00 00 00 
801055c4:	50                   	push   %eax
801055c5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801055cb:	e8 80 b4 ff ff       	call   80100a50 <exec>
801055d0:	83 c4 10             	add    $0x10,%esp
801055d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801055d6:	5b                   	pop    %ebx
801055d7:	5e                   	pop    %esi
801055d8:	5f                   	pop    %edi
801055d9:	5d                   	pop    %ebp
801055da:	c3                   	ret    
801055db:	90                   	nop
801055dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801055e0 <sys_pipe>:
801055e0:	55                   	push   %ebp
801055e1:	89 e5                	mov    %esp,%ebp
801055e3:	57                   	push   %edi
801055e4:	56                   	push   %esi
801055e5:	53                   	push   %ebx
801055e6:	8d 45 dc             	lea    -0x24(%ebp),%eax
801055e9:	83 ec 20             	sub    $0x20,%esp
801055ec:	6a 08                	push   $0x8
801055ee:	50                   	push   %eax
801055ef:	6a 00                	push   $0x0
801055f1:	e8 da f3 ff ff       	call   801049d0 <argptr>
801055f6:	83 c4 10             	add    $0x10,%esp
801055f9:	85 c0                	test   %eax,%eax
801055fb:	0f 88 ae 00 00 00    	js     801056af <sys_pipe+0xcf>
80105601:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105604:	83 ec 08             	sub    $0x8,%esp
80105607:	50                   	push   %eax
80105608:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010560b:	50                   	push   %eax
8010560c:	e8 bf dc ff ff       	call   801032d0 <pipealloc>
80105611:	83 c4 10             	add    $0x10,%esp
80105614:	85 c0                	test   %eax,%eax
80105616:	0f 88 93 00 00 00    	js     801056af <sys_pipe+0xcf>
8010561c:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010561f:	31 db                	xor    %ebx,%ebx
80105621:	e8 7a e2 ff ff       	call   801038a0 <myproc>
80105626:	eb 10                	jmp    80105638 <sys_pipe+0x58>
80105628:	90                   	nop
80105629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105630:	83 c3 01             	add    $0x1,%ebx
80105633:	83 fb 10             	cmp    $0x10,%ebx
80105636:	74 60                	je     80105698 <sys_pipe+0xb8>
80105638:	8b 74 98 2c          	mov    0x2c(%eax,%ebx,4),%esi
8010563c:	85 f6                	test   %esi,%esi
8010563e:	75 f0                	jne    80105630 <sys_pipe+0x50>
80105640:	8d 73 08             	lea    0x8(%ebx),%esi
80105643:	89 7c b0 0c          	mov    %edi,0xc(%eax,%esi,4)
80105647:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010564a:	e8 51 e2 ff ff       	call   801038a0 <myproc>
8010564f:	31 d2                	xor    %edx,%edx
80105651:	eb 0d                	jmp    80105660 <sys_pipe+0x80>
80105653:	90                   	nop
80105654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105658:	83 c2 01             	add    $0x1,%edx
8010565b:	83 fa 10             	cmp    $0x10,%edx
8010565e:	74 28                	je     80105688 <sys_pipe+0xa8>
80105660:	8b 4c 90 2c          	mov    0x2c(%eax,%edx,4),%ecx
80105664:	85 c9                	test   %ecx,%ecx
80105666:	75 f0                	jne    80105658 <sys_pipe+0x78>
80105668:	89 7c 90 2c          	mov    %edi,0x2c(%eax,%edx,4)
8010566c:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010566f:	89 18                	mov    %ebx,(%eax)
80105671:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105674:	89 50 04             	mov    %edx,0x4(%eax)
80105677:	31 c0                	xor    %eax,%eax
80105679:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010567c:	5b                   	pop    %ebx
8010567d:	5e                   	pop    %esi
8010567e:	5f                   	pop    %edi
8010567f:	5d                   	pop    %ebp
80105680:	c3                   	ret    
80105681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105688:	e8 13 e2 ff ff       	call   801038a0 <myproc>
8010568d:	c7 44 b0 0c 00 00 00 	movl   $0x0,0xc(%eax,%esi,4)
80105694:	00 
80105695:	8d 76 00             	lea    0x0(%esi),%esi
80105698:	83 ec 0c             	sub    $0xc,%esp
8010569b:	ff 75 e0             	pushl  -0x20(%ebp)
8010569e:	e8 dd b7 ff ff       	call   80100e80 <fileclose>
801056a3:	58                   	pop    %eax
801056a4:	ff 75 e4             	pushl  -0x1c(%ebp)
801056a7:	e8 d4 b7 ff ff       	call   80100e80 <fileclose>
801056ac:	83 c4 10             	add    $0x10,%esp
801056af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056b4:	eb c3                	jmp    80105679 <sys_pipe+0x99>
801056b6:	66 90                	xchg   %ax,%ax
801056b8:	66 90                	xchg   %ax,%ax
801056ba:	66 90                	xchg   %ax,%ax
801056bc:	66 90                	xchg   %ax,%ax
801056be:	66 90                	xchg   %ax,%ax

801056c0 <sys_fork>:
801056c0:	55                   	push   %ebp
801056c1:	89 e5                	mov    %esp,%ebp
801056c3:	5d                   	pop    %ebp
801056c4:	e9 77 e3 ff ff       	jmp    80103a40 <fork>
801056c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801056d0 <sys_exit>:
801056d0:	55                   	push   %ebp
801056d1:	89 e5                	mov    %esp,%ebp
801056d3:	83 ec 08             	sub    $0x8,%esp
801056d6:	e8 65 e6 ff ff       	call   80103d40 <exit>
801056db:	31 c0                	xor    %eax,%eax
801056dd:	c9                   	leave  
801056de:	c3                   	ret    
801056df:	90                   	nop

801056e0 <sys_wait>:
801056e0:	55                   	push   %ebp
801056e1:	89 e5                	mov    %esp,%ebp
801056e3:	5d                   	pop    %ebp
801056e4:	e9 97 e8 ff ff       	jmp    80103f80 <wait>
801056e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801056f0 <sys_kill>:
801056f0:	55                   	push   %ebp
801056f1:	89 e5                	mov    %esp,%ebp
801056f3:	83 ec 20             	sub    $0x20,%esp
801056f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801056f9:	50                   	push   %eax
801056fa:	6a 00                	push   $0x0
801056fc:	e8 7f f2 ff ff       	call   80104980 <argint>
80105701:	83 c4 10             	add    $0x10,%esp
80105704:	85 c0                	test   %eax,%eax
80105706:	78 18                	js     80105720 <sys_kill+0x30>
80105708:	83 ec 0c             	sub    $0xc,%esp
8010570b:	ff 75 f4             	pushl  -0xc(%ebp)
8010570e:	e8 cd e9 ff ff       	call   801040e0 <kill>
80105713:	83 c4 10             	add    $0x10,%esp
80105716:	c9                   	leave  
80105717:	c3                   	ret    
80105718:	90                   	nop
80105719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105720:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105725:	c9                   	leave  
80105726:	c3                   	ret    
80105727:	89 f6                	mov    %esi,%esi
80105729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105730 <sys_getpid>:
80105730:	55                   	push   %ebp
80105731:	89 e5                	mov    %esp,%ebp
80105733:	83 ec 08             	sub    $0x8,%esp
80105736:	e8 65 e1 ff ff       	call   801038a0 <myproc>
8010573b:	8b 40 14             	mov    0x14(%eax),%eax
8010573e:	c9                   	leave  
8010573f:	c3                   	ret    

80105740 <sys_sbrk>:
80105740:	55                   	push   %ebp
80105741:	89 e5                	mov    %esp,%ebp
80105743:	53                   	push   %ebx
80105744:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105747:	83 ec 1c             	sub    $0x1c,%esp
8010574a:	50                   	push   %eax
8010574b:	6a 00                	push   $0x0
8010574d:	e8 2e f2 ff ff       	call   80104980 <argint>
80105752:	83 c4 10             	add    $0x10,%esp
80105755:	85 c0                	test   %eax,%eax
80105757:	78 27                	js     80105780 <sys_sbrk+0x40>
80105759:	e8 42 e1 ff ff       	call   801038a0 <myproc>
8010575e:	83 ec 0c             	sub    $0xc,%esp
80105761:	8b 18                	mov    (%eax),%ebx
80105763:	ff 75 f4             	pushl  -0xc(%ebp)
80105766:	e8 55 e2 ff ff       	call   801039c0 <growproc>
8010576b:	83 c4 10             	add    $0x10,%esp
8010576e:	85 c0                	test   %eax,%eax
80105770:	78 0e                	js     80105780 <sys_sbrk+0x40>
80105772:	89 d8                	mov    %ebx,%eax
80105774:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105777:	c9                   	leave  
80105778:	c3                   	ret    
80105779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105780:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105785:	eb eb                	jmp    80105772 <sys_sbrk+0x32>
80105787:	89 f6                	mov    %esi,%esi
80105789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105790 <sys_sleep>:
80105790:	55                   	push   %ebp
80105791:	89 e5                	mov    %esp,%ebp
80105793:	53                   	push   %ebx
80105794:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105797:	83 ec 1c             	sub    $0x1c,%esp
8010579a:	50                   	push   %eax
8010579b:	6a 00                	push   $0x0
8010579d:	e8 de f1 ff ff       	call   80104980 <argint>
801057a2:	83 c4 10             	add    $0x10,%esp
801057a5:	85 c0                	test   %eax,%eax
801057a7:	0f 88 8a 00 00 00    	js     80105837 <sys_sleep+0xa7>
801057ad:	83 ec 0c             	sub    $0xc,%esp
801057b0:	68 40 59 11 80       	push   $0x80115940
801057b5:	e8 b6 ed ff ff       	call   80104570 <acquire>
801057ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
801057bd:	83 c4 10             	add    $0x10,%esp
801057c0:	8b 1d 80 61 11 80    	mov    0x80116180,%ebx
801057c6:	85 d2                	test   %edx,%edx
801057c8:	75 27                	jne    801057f1 <sys_sleep+0x61>
801057ca:	eb 54                	jmp    80105820 <sys_sleep+0x90>
801057cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801057d0:	83 ec 08             	sub    $0x8,%esp
801057d3:	68 40 59 11 80       	push   $0x80115940
801057d8:	68 80 61 11 80       	push   $0x80116180
801057dd:	e8 de e6 ff ff       	call   80103ec0 <sleep>
801057e2:	a1 80 61 11 80       	mov    0x80116180,%eax
801057e7:	83 c4 10             	add    $0x10,%esp
801057ea:	29 d8                	sub    %ebx,%eax
801057ec:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801057ef:	73 2f                	jae    80105820 <sys_sleep+0x90>
801057f1:	e8 aa e0 ff ff       	call   801038a0 <myproc>
801057f6:	8b 40 28             	mov    0x28(%eax),%eax
801057f9:	85 c0                	test   %eax,%eax
801057fb:	74 d3                	je     801057d0 <sys_sleep+0x40>
801057fd:	83 ec 0c             	sub    $0xc,%esp
80105800:	68 40 59 11 80       	push   $0x80115940
80105805:	e8 26 ee ff ff       	call   80104630 <release>
8010580a:	83 c4 10             	add    $0x10,%esp
8010580d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105812:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105815:	c9                   	leave  
80105816:	c3                   	ret    
80105817:	89 f6                	mov    %esi,%esi
80105819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105820:	83 ec 0c             	sub    $0xc,%esp
80105823:	68 40 59 11 80       	push   $0x80115940
80105828:	e8 03 ee ff ff       	call   80104630 <release>
8010582d:	83 c4 10             	add    $0x10,%esp
80105830:	31 c0                	xor    %eax,%eax
80105832:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105835:	c9                   	leave  
80105836:	c3                   	ret    
80105837:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010583c:	eb f4                	jmp    80105832 <sys_sleep+0xa2>
8010583e:	66 90                	xchg   %ax,%ax

80105840 <sys_uptime>:
80105840:	55                   	push   %ebp
80105841:	89 e5                	mov    %esp,%ebp
80105843:	53                   	push   %ebx
80105844:	83 ec 10             	sub    $0x10,%esp
80105847:	68 40 59 11 80       	push   $0x80115940
8010584c:	e8 1f ed ff ff       	call   80104570 <acquire>
80105851:	8b 1d 80 61 11 80    	mov    0x80116180,%ebx
80105857:	c7 04 24 40 59 11 80 	movl   $0x80115940,(%esp)
8010585e:	e8 cd ed ff ff       	call   80104630 <release>
80105863:	89 d8                	mov    %ebx,%eax
80105865:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105868:	c9                   	leave  
80105869:	c3                   	ret    
8010586a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105870 <sys_settickets>:
80105870:	55                   	push   %ebp
80105871:	89 e5                	mov    %esp,%ebp
80105873:	83 ec 20             	sub    $0x20,%esp
80105876:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105879:	50                   	push   %eax
8010587a:	6a 00                	push   $0x0
8010587c:	e8 ff f0 ff ff       	call   80104980 <argint>
80105881:	83 c4 10             	add    $0x10,%esp
80105884:	85 c0                	test   %eax,%eax
80105886:	78 18                	js     801058a0 <sys_settickets+0x30>
80105888:	83 ec 0c             	sub    $0xc,%esp
8010588b:	ff 75 f4             	pushl  -0xc(%ebp)
8010588e:	e8 cd e8 ff ff       	call   80104160 <settickets>
80105893:	83 c4 10             	add    $0x10,%esp
80105896:	31 c0                	xor    %eax,%eax
80105898:	c9                   	leave  
80105899:	c3                   	ret    
8010589a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801058a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058a5:	c9                   	leave  
801058a6:	c3                   	ret    
801058a7:	89 f6                	mov    %esi,%esi
801058a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801058b0 <sys_getpinfo>:
801058b0:	55                   	push   %ebp
801058b1:	89 e5                	mov    %esp,%ebp
801058b3:	83 ec 1c             	sub    $0x1c,%esp
801058b6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801058b9:	68 00 04 00 00       	push   $0x400
801058be:	50                   	push   %eax
801058bf:	6a 00                	push   $0x0
801058c1:	e8 0a f1 ff ff       	call   801049d0 <argptr>
801058c6:	83 c4 10             	add    $0x10,%esp
801058c9:	85 c0                	test   %eax,%eax
801058cb:	78 13                	js     801058e0 <sys_getpinfo+0x30>
801058cd:	83 ec 0c             	sub    $0xc,%esp
801058d0:	ff 75 f4             	pushl  -0xc(%ebp)
801058d3:	e8 d8 e8 ff ff       	call   801041b0 <getpinfo>
801058d8:	83 c4 10             	add    $0x10,%esp
801058db:	31 c0                	xor    %eax,%eax
801058dd:	c9                   	leave  
801058de:	c3                   	ret    
801058df:	90                   	nop
801058e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058e5:	c9                   	leave  
801058e6:	c3                   	ret    

801058e7 <alltraps>:
801058e7:	1e                   	push   %ds
801058e8:	06                   	push   %es
801058e9:	0f a0                	push   %fs
801058eb:	0f a8                	push   %gs
801058ed:	60                   	pusha  
801058ee:	66 b8 10 00          	mov    $0x10,%ax
801058f2:	8e d8                	mov    %eax,%ds
801058f4:	8e c0                	mov    %eax,%es
801058f6:	54                   	push   %esp
801058f7:	e8 c4 00 00 00       	call   801059c0 <trap>
801058fc:	83 c4 04             	add    $0x4,%esp

801058ff <trapret>:
801058ff:	61                   	popa   
80105900:	0f a9                	pop    %gs
80105902:	0f a1                	pop    %fs
80105904:	07                   	pop    %es
80105905:	1f                   	pop    %ds
80105906:	83 c4 08             	add    $0x8,%esp
80105909:	cf                   	iret   
8010590a:	66 90                	xchg   %ax,%ax
8010590c:	66 90                	xchg   %ax,%ax
8010590e:	66 90                	xchg   %ax,%ax

80105910 <tvinit>:
80105910:	55                   	push   %ebp
80105911:	31 c0                	xor    %eax,%eax
80105913:	89 e5                	mov    %esp,%ebp
80105915:	83 ec 08             	sub    $0x8,%esp
80105918:	90                   	nop
80105919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105920:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
80105927:	c7 04 c5 82 59 11 80 	movl   $0x8e000008,-0x7feea67e(,%eax,8)
8010592e:	08 00 00 8e 
80105932:	66 89 14 c5 80 59 11 	mov    %dx,-0x7feea680(,%eax,8)
80105939:	80 
8010593a:	c1 ea 10             	shr    $0x10,%edx
8010593d:	66 89 14 c5 86 59 11 	mov    %dx,-0x7feea67a(,%eax,8)
80105944:	80 
80105945:	83 c0 01             	add    $0x1,%eax
80105948:	3d 00 01 00 00       	cmp    $0x100,%eax
8010594d:	75 d1                	jne    80105920 <tvinit+0x10>
8010594f:	a1 08 a1 10 80       	mov    0x8010a108,%eax
80105954:	83 ec 08             	sub    $0x8,%esp
80105957:	c7 05 82 5b 11 80 08 	movl   $0xef000008,0x80115b82
8010595e:	00 00 ef 
80105961:	68 a1 7c 10 80       	push   $0x80107ca1
80105966:	68 40 59 11 80       	push   $0x80115940
8010596b:	66 a3 80 5b 11 80    	mov    %ax,0x80115b80
80105971:	c1 e8 10             	shr    $0x10,%eax
80105974:	66 a3 86 5b 11 80    	mov    %ax,0x80115b86
8010597a:	e8 b1 ea ff ff       	call   80104430 <initlock>
8010597f:	83 c4 10             	add    $0x10,%esp
80105982:	c9                   	leave  
80105983:	c3                   	ret    
80105984:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010598a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105990 <idtinit>:
80105990:	55                   	push   %ebp
80105991:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105996:	89 e5                	mov    %esp,%ebp
80105998:	83 ec 10             	sub    $0x10,%esp
8010599b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
8010599f:	b8 80 59 11 80       	mov    $0x80115980,%eax
801059a4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
801059a8:	c1 e8 10             	shr    $0x10,%eax
801059ab:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
801059af:	8d 45 fa             	lea    -0x6(%ebp),%eax
801059b2:	0f 01 18             	lidtl  (%eax)
801059b5:	c9                   	leave  
801059b6:	c3                   	ret    
801059b7:	89 f6                	mov    %esi,%esi
801059b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801059c0 <trap>:
801059c0:	55                   	push   %ebp
801059c1:	89 e5                	mov    %esp,%ebp
801059c3:	57                   	push   %edi
801059c4:	56                   	push   %esi
801059c5:	53                   	push   %ebx
801059c6:	83 ec 1c             	sub    $0x1c,%esp
801059c9:	8b 7d 08             	mov    0x8(%ebp),%edi
801059cc:	8b 47 30             	mov    0x30(%edi),%eax
801059cf:	83 f8 40             	cmp    $0x40,%eax
801059d2:	0f 84 f0 00 00 00    	je     80105ac8 <trap+0x108>
801059d8:	83 e8 20             	sub    $0x20,%eax
801059db:	83 f8 1f             	cmp    $0x1f,%eax
801059de:	77 10                	ja     801059f0 <trap+0x30>
801059e0:	ff 24 85 48 7d 10 80 	jmp    *-0x7fef82b8(,%eax,4)
801059e7:	89 f6                	mov    %esi,%esi
801059e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801059f0:	e8 ab de ff ff       	call   801038a0 <myproc>
801059f5:	85 c0                	test   %eax,%eax
801059f7:	8b 5f 38             	mov    0x38(%edi),%ebx
801059fa:	0f 84 14 02 00 00    	je     80105c14 <trap+0x254>
80105a00:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105a04:	0f 84 0a 02 00 00    	je     80105c14 <trap+0x254>
80105a0a:	0f 20 d1             	mov    %cr2,%ecx
80105a0d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105a10:	e8 6b de ff ff       	call   80103880 <cpuid>
80105a15:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105a18:	8b 47 34             	mov    0x34(%edi),%eax
80105a1b:	8b 77 30             	mov    0x30(%edi),%esi
80105a1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105a21:	e8 7a de ff ff       	call   801038a0 <myproc>
80105a26:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105a29:	e8 72 de ff ff       	call   801038a0 <myproc>
80105a2e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105a31:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105a34:	51                   	push   %ecx
80105a35:	53                   	push   %ebx
80105a36:	52                   	push   %edx
80105a37:	8b 55 e0             	mov    -0x20(%ebp),%edx
80105a3a:	ff 75 e4             	pushl  -0x1c(%ebp)
80105a3d:	56                   	push   %esi
80105a3e:	83 c2 70             	add    $0x70,%edx
80105a41:	52                   	push   %edx
80105a42:	ff 70 14             	pushl  0x14(%eax)
80105a45:	68 04 7d 10 80       	push   $0x80107d04
80105a4a:	e8 11 ac ff ff       	call   80100660 <cprintf>
80105a4f:	83 c4 20             	add    $0x20,%esp
80105a52:	e8 49 de ff ff       	call   801038a0 <myproc>
80105a57:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
80105a5e:	e8 3d de ff ff       	call   801038a0 <myproc>
80105a63:	85 c0                	test   %eax,%eax
80105a65:	74 1d                	je     80105a84 <trap+0xc4>
80105a67:	e8 34 de ff ff       	call   801038a0 <myproc>
80105a6c:	8b 50 28             	mov    0x28(%eax),%edx
80105a6f:	85 d2                	test   %edx,%edx
80105a71:	74 11                	je     80105a84 <trap+0xc4>
80105a73:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105a77:	83 e0 03             	and    $0x3,%eax
80105a7a:	66 83 f8 03          	cmp    $0x3,%ax
80105a7e:	0f 84 4c 01 00 00    	je     80105bd0 <trap+0x210>
80105a84:	e8 17 de ff ff       	call   801038a0 <myproc>
80105a89:	85 c0                	test   %eax,%eax
80105a8b:	74 0b                	je     80105a98 <trap+0xd8>
80105a8d:	e8 0e de ff ff       	call   801038a0 <myproc>
80105a92:	83 78 10 04          	cmpl   $0x4,0x10(%eax)
80105a96:	74 68                	je     80105b00 <trap+0x140>
80105a98:	e8 03 de ff ff       	call   801038a0 <myproc>
80105a9d:	85 c0                	test   %eax,%eax
80105a9f:	74 19                	je     80105aba <trap+0xfa>
80105aa1:	e8 fa dd ff ff       	call   801038a0 <myproc>
80105aa6:	8b 40 28             	mov    0x28(%eax),%eax
80105aa9:	85 c0                	test   %eax,%eax
80105aab:	74 0d                	je     80105aba <trap+0xfa>
80105aad:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105ab1:	83 e0 03             	and    $0x3,%eax
80105ab4:	66 83 f8 03          	cmp    $0x3,%ax
80105ab8:	74 37                	je     80105af1 <trap+0x131>
80105aba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105abd:	5b                   	pop    %ebx
80105abe:	5e                   	pop    %esi
80105abf:	5f                   	pop    %edi
80105ac0:	5d                   	pop    %ebp
80105ac1:	c3                   	ret    
80105ac2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105ac8:	e8 d3 dd ff ff       	call   801038a0 <myproc>
80105acd:	8b 58 28             	mov    0x28(%eax),%ebx
80105ad0:	85 db                	test   %ebx,%ebx
80105ad2:	0f 85 e8 00 00 00    	jne    80105bc0 <trap+0x200>
80105ad8:	e8 c3 dd ff ff       	call   801038a0 <myproc>
80105add:	89 78 1c             	mov    %edi,0x1c(%eax)
80105ae0:	e8 8b ef ff ff       	call   80104a70 <syscall>
80105ae5:	e8 b6 dd ff ff       	call   801038a0 <myproc>
80105aea:	8b 48 28             	mov    0x28(%eax),%ecx
80105aed:	85 c9                	test   %ecx,%ecx
80105aef:	74 c9                	je     80105aba <trap+0xfa>
80105af1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105af4:	5b                   	pop    %ebx
80105af5:	5e                   	pop    %esi
80105af6:	5f                   	pop    %edi
80105af7:	5d                   	pop    %ebp
80105af8:	e9 43 e2 ff ff       	jmp    80103d40 <exit>
80105afd:	8d 76 00             	lea    0x0(%esi),%esi
80105b00:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105b04:	75 92                	jne    80105a98 <trap+0xd8>
80105b06:	e8 65 e3 ff ff       	call   80103e70 <yield>
80105b0b:	eb 8b                	jmp    80105a98 <trap+0xd8>
80105b0d:	8d 76 00             	lea    0x0(%esi),%esi
80105b10:	e8 6b dd ff ff       	call   80103880 <cpuid>
80105b15:	85 c0                	test   %eax,%eax
80105b17:	0f 84 c3 00 00 00    	je     80105be0 <trap+0x220>
80105b1d:	e8 6e cc ff ff       	call   80102790 <lapiceoi>
80105b22:	e8 79 dd ff ff       	call   801038a0 <myproc>
80105b27:	85 c0                	test   %eax,%eax
80105b29:	0f 85 38 ff ff ff    	jne    80105a67 <trap+0xa7>
80105b2f:	e9 50 ff ff ff       	jmp    80105a84 <trap+0xc4>
80105b34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105b38:	e8 13 cb ff ff       	call   80102650 <kbdintr>
80105b3d:	e8 4e cc ff ff       	call   80102790 <lapiceoi>
80105b42:	e8 59 dd ff ff       	call   801038a0 <myproc>
80105b47:	85 c0                	test   %eax,%eax
80105b49:	0f 85 18 ff ff ff    	jne    80105a67 <trap+0xa7>
80105b4f:	e9 30 ff ff ff       	jmp    80105a84 <trap+0xc4>
80105b54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105b58:	e8 53 02 00 00       	call   80105db0 <uartintr>
80105b5d:	e8 2e cc ff ff       	call   80102790 <lapiceoi>
80105b62:	e8 39 dd ff ff       	call   801038a0 <myproc>
80105b67:	85 c0                	test   %eax,%eax
80105b69:	0f 85 f8 fe ff ff    	jne    80105a67 <trap+0xa7>
80105b6f:	e9 10 ff ff ff       	jmp    80105a84 <trap+0xc4>
80105b74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105b78:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105b7c:	8b 77 38             	mov    0x38(%edi),%esi
80105b7f:	e8 fc dc ff ff       	call   80103880 <cpuid>
80105b84:	56                   	push   %esi
80105b85:	53                   	push   %ebx
80105b86:	50                   	push   %eax
80105b87:	68 ac 7c 10 80       	push   $0x80107cac
80105b8c:	e8 cf aa ff ff       	call   80100660 <cprintf>
80105b91:	e8 fa cb ff ff       	call   80102790 <lapiceoi>
80105b96:	83 c4 10             	add    $0x10,%esp
80105b99:	e8 02 dd ff ff       	call   801038a0 <myproc>
80105b9e:	85 c0                	test   %eax,%eax
80105ba0:	0f 85 c1 fe ff ff    	jne    80105a67 <trap+0xa7>
80105ba6:	e9 d9 fe ff ff       	jmp    80105a84 <trap+0xc4>
80105bab:	90                   	nop
80105bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105bb0:	e8 0b c5 ff ff       	call   801020c0 <ideintr>
80105bb5:	e9 63 ff ff ff       	jmp    80105b1d <trap+0x15d>
80105bba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105bc0:	e8 7b e1 ff ff       	call   80103d40 <exit>
80105bc5:	e9 0e ff ff ff       	jmp    80105ad8 <trap+0x118>
80105bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105bd0:	e8 6b e1 ff ff       	call   80103d40 <exit>
80105bd5:	e9 aa fe ff ff       	jmp    80105a84 <trap+0xc4>
80105bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105be0:	83 ec 0c             	sub    $0xc,%esp
80105be3:	68 40 59 11 80       	push   $0x80115940
80105be8:	e8 83 e9 ff ff       	call   80104570 <acquire>
80105bed:	c7 04 24 80 61 11 80 	movl   $0x80116180,(%esp)
80105bf4:	83 05 80 61 11 80 01 	addl   $0x1,0x80116180
80105bfb:	e8 80 e4 ff ff       	call   80104080 <wakeup>
80105c00:	c7 04 24 40 59 11 80 	movl   $0x80115940,(%esp)
80105c07:	e8 24 ea ff ff       	call   80104630 <release>
80105c0c:	83 c4 10             	add    $0x10,%esp
80105c0f:	e9 09 ff ff ff       	jmp    80105b1d <trap+0x15d>
80105c14:	0f 20 d6             	mov    %cr2,%esi
80105c17:	e8 64 dc ff ff       	call   80103880 <cpuid>
80105c1c:	83 ec 0c             	sub    $0xc,%esp
80105c1f:	56                   	push   %esi
80105c20:	53                   	push   %ebx
80105c21:	50                   	push   %eax
80105c22:	ff 77 30             	pushl  0x30(%edi)
80105c25:	68 d0 7c 10 80       	push   $0x80107cd0
80105c2a:	e8 31 aa ff ff       	call   80100660 <cprintf>
80105c2f:	83 c4 14             	add    $0x14,%esp
80105c32:	68 a6 7c 10 80       	push   $0x80107ca6
80105c37:	e8 54 a7 ff ff       	call   80100390 <panic>
80105c3c:	66 90                	xchg   %ax,%ax
80105c3e:	66 90                	xchg   %ax,%ax

80105c40 <uartgetc>:
80105c40:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
80105c45:	55                   	push   %ebp
80105c46:	89 e5                	mov    %esp,%ebp
80105c48:	85 c0                	test   %eax,%eax
80105c4a:	74 1c                	je     80105c68 <uartgetc+0x28>
80105c4c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105c51:	ec                   	in     (%dx),%al
80105c52:	a8 01                	test   $0x1,%al
80105c54:	74 12                	je     80105c68 <uartgetc+0x28>
80105c56:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c5b:	ec                   	in     (%dx),%al
80105c5c:	0f b6 c0             	movzbl %al,%eax
80105c5f:	5d                   	pop    %ebp
80105c60:	c3                   	ret    
80105c61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105c68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105c6d:	5d                   	pop    %ebp
80105c6e:	c3                   	ret    
80105c6f:	90                   	nop

80105c70 <uartputc.part.0>:
80105c70:	55                   	push   %ebp
80105c71:	89 e5                	mov    %esp,%ebp
80105c73:	57                   	push   %edi
80105c74:	56                   	push   %esi
80105c75:	53                   	push   %ebx
80105c76:	89 c7                	mov    %eax,%edi
80105c78:	bb 80 00 00 00       	mov    $0x80,%ebx
80105c7d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105c82:	83 ec 0c             	sub    $0xc,%esp
80105c85:	eb 1b                	jmp    80105ca2 <uartputc.part.0+0x32>
80105c87:	89 f6                	mov    %esi,%esi
80105c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105c90:	83 ec 0c             	sub    $0xc,%esp
80105c93:	6a 0a                	push   $0xa
80105c95:	e8 16 cb ff ff       	call   801027b0 <microdelay>
80105c9a:	83 c4 10             	add    $0x10,%esp
80105c9d:	83 eb 01             	sub    $0x1,%ebx
80105ca0:	74 07                	je     80105ca9 <uartputc.part.0+0x39>
80105ca2:	89 f2                	mov    %esi,%edx
80105ca4:	ec                   	in     (%dx),%al
80105ca5:	a8 20                	test   $0x20,%al
80105ca7:	74 e7                	je     80105c90 <uartputc.part.0+0x20>
80105ca9:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105cae:	89 f8                	mov    %edi,%eax
80105cb0:	ee                   	out    %al,(%dx)
80105cb1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105cb4:	5b                   	pop    %ebx
80105cb5:	5e                   	pop    %esi
80105cb6:	5f                   	pop    %edi
80105cb7:	5d                   	pop    %ebp
80105cb8:	c3                   	ret    
80105cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105cc0 <uartinit>:
80105cc0:	55                   	push   %ebp
80105cc1:	31 c9                	xor    %ecx,%ecx
80105cc3:	89 c8                	mov    %ecx,%eax
80105cc5:	89 e5                	mov    %esp,%ebp
80105cc7:	57                   	push   %edi
80105cc8:	56                   	push   %esi
80105cc9:	53                   	push   %ebx
80105cca:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105ccf:	89 da                	mov    %ebx,%edx
80105cd1:	83 ec 0c             	sub    $0xc,%esp
80105cd4:	ee                   	out    %al,(%dx)
80105cd5:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105cda:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105cdf:	89 fa                	mov    %edi,%edx
80105ce1:	ee                   	out    %al,(%dx)
80105ce2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105ce7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105cec:	ee                   	out    %al,(%dx)
80105ced:	be f9 03 00 00       	mov    $0x3f9,%esi
80105cf2:	89 c8                	mov    %ecx,%eax
80105cf4:	89 f2                	mov    %esi,%edx
80105cf6:	ee                   	out    %al,(%dx)
80105cf7:	b8 03 00 00 00       	mov    $0x3,%eax
80105cfc:	89 fa                	mov    %edi,%edx
80105cfe:	ee                   	out    %al,(%dx)
80105cff:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105d04:	89 c8                	mov    %ecx,%eax
80105d06:	ee                   	out    %al,(%dx)
80105d07:	b8 01 00 00 00       	mov    $0x1,%eax
80105d0c:	89 f2                	mov    %esi,%edx
80105d0e:	ee                   	out    %al,(%dx)
80105d0f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105d14:	ec                   	in     (%dx),%al
80105d15:	3c ff                	cmp    $0xff,%al
80105d17:	74 5a                	je     80105d73 <uartinit+0xb3>
80105d19:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105d20:	00 00 00 
80105d23:	89 da                	mov    %ebx,%edx
80105d25:	ec                   	in     (%dx),%al
80105d26:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d2b:	ec                   	in     (%dx),%al
80105d2c:	83 ec 08             	sub    $0x8,%esp
80105d2f:	bb c8 7d 10 80       	mov    $0x80107dc8,%ebx
80105d34:	6a 00                	push   $0x0
80105d36:	6a 04                	push   $0x4
80105d38:	e8 d3 c5 ff ff       	call   80102310 <ioapicenable>
80105d3d:	83 c4 10             	add    $0x10,%esp
80105d40:	b8 78 00 00 00       	mov    $0x78,%eax
80105d45:	eb 13                	jmp    80105d5a <uartinit+0x9a>
80105d47:	89 f6                	mov    %esi,%esi
80105d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105d50:	83 c3 01             	add    $0x1,%ebx
80105d53:	0f be 03             	movsbl (%ebx),%eax
80105d56:	84 c0                	test   %al,%al
80105d58:	74 19                	je     80105d73 <uartinit+0xb3>
80105d5a:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105d60:	85 d2                	test   %edx,%edx
80105d62:	74 ec                	je     80105d50 <uartinit+0x90>
80105d64:	83 c3 01             	add    $0x1,%ebx
80105d67:	e8 04 ff ff ff       	call   80105c70 <uartputc.part.0>
80105d6c:	0f be 03             	movsbl (%ebx),%eax
80105d6f:	84 c0                	test   %al,%al
80105d71:	75 e7                	jne    80105d5a <uartinit+0x9a>
80105d73:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d76:	5b                   	pop    %ebx
80105d77:	5e                   	pop    %esi
80105d78:	5f                   	pop    %edi
80105d79:	5d                   	pop    %ebp
80105d7a:	c3                   	ret    
80105d7b:	90                   	nop
80105d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105d80 <uartputc>:
80105d80:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105d86:	55                   	push   %ebp
80105d87:	89 e5                	mov    %esp,%ebp
80105d89:	85 d2                	test   %edx,%edx
80105d8b:	8b 45 08             	mov    0x8(%ebp),%eax
80105d8e:	74 10                	je     80105da0 <uartputc+0x20>
80105d90:	5d                   	pop    %ebp
80105d91:	e9 da fe ff ff       	jmp    80105c70 <uartputc.part.0>
80105d96:	8d 76 00             	lea    0x0(%esi),%esi
80105d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105da0:	5d                   	pop    %ebp
80105da1:	c3                   	ret    
80105da2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105db0 <uartintr>:
80105db0:	55                   	push   %ebp
80105db1:	89 e5                	mov    %esp,%ebp
80105db3:	83 ec 14             	sub    $0x14,%esp
80105db6:	68 40 5c 10 80       	push   $0x80105c40
80105dbb:	e8 90 aa ff ff       	call   80100850 <consoleintr>
80105dc0:	83 c4 10             	add    $0x10,%esp
80105dc3:	c9                   	leave  
80105dc4:	c3                   	ret    

80105dc5 <vector0>:
80105dc5:	6a 00                	push   $0x0
80105dc7:	6a 00                	push   $0x0
80105dc9:	e9 19 fb ff ff       	jmp    801058e7 <alltraps>

80105dce <vector1>:
80105dce:	6a 00                	push   $0x0
80105dd0:	6a 01                	push   $0x1
80105dd2:	e9 10 fb ff ff       	jmp    801058e7 <alltraps>

80105dd7 <vector2>:
80105dd7:	6a 00                	push   $0x0
80105dd9:	6a 02                	push   $0x2
80105ddb:	e9 07 fb ff ff       	jmp    801058e7 <alltraps>

80105de0 <vector3>:
80105de0:	6a 00                	push   $0x0
80105de2:	6a 03                	push   $0x3
80105de4:	e9 fe fa ff ff       	jmp    801058e7 <alltraps>

80105de9 <vector4>:
80105de9:	6a 00                	push   $0x0
80105deb:	6a 04                	push   $0x4
80105ded:	e9 f5 fa ff ff       	jmp    801058e7 <alltraps>

80105df2 <vector5>:
80105df2:	6a 00                	push   $0x0
80105df4:	6a 05                	push   $0x5
80105df6:	e9 ec fa ff ff       	jmp    801058e7 <alltraps>

80105dfb <vector6>:
80105dfb:	6a 00                	push   $0x0
80105dfd:	6a 06                	push   $0x6
80105dff:	e9 e3 fa ff ff       	jmp    801058e7 <alltraps>

80105e04 <vector7>:
80105e04:	6a 00                	push   $0x0
80105e06:	6a 07                	push   $0x7
80105e08:	e9 da fa ff ff       	jmp    801058e7 <alltraps>

80105e0d <vector8>:
80105e0d:	6a 08                	push   $0x8
80105e0f:	e9 d3 fa ff ff       	jmp    801058e7 <alltraps>

80105e14 <vector9>:
80105e14:	6a 00                	push   $0x0
80105e16:	6a 09                	push   $0x9
80105e18:	e9 ca fa ff ff       	jmp    801058e7 <alltraps>

80105e1d <vector10>:
80105e1d:	6a 0a                	push   $0xa
80105e1f:	e9 c3 fa ff ff       	jmp    801058e7 <alltraps>

80105e24 <vector11>:
80105e24:	6a 0b                	push   $0xb
80105e26:	e9 bc fa ff ff       	jmp    801058e7 <alltraps>

80105e2b <vector12>:
80105e2b:	6a 0c                	push   $0xc
80105e2d:	e9 b5 fa ff ff       	jmp    801058e7 <alltraps>

80105e32 <vector13>:
80105e32:	6a 0d                	push   $0xd
80105e34:	e9 ae fa ff ff       	jmp    801058e7 <alltraps>

80105e39 <vector14>:
80105e39:	6a 0e                	push   $0xe
80105e3b:	e9 a7 fa ff ff       	jmp    801058e7 <alltraps>

80105e40 <vector15>:
80105e40:	6a 00                	push   $0x0
80105e42:	6a 0f                	push   $0xf
80105e44:	e9 9e fa ff ff       	jmp    801058e7 <alltraps>

80105e49 <vector16>:
80105e49:	6a 00                	push   $0x0
80105e4b:	6a 10                	push   $0x10
80105e4d:	e9 95 fa ff ff       	jmp    801058e7 <alltraps>

80105e52 <vector17>:
80105e52:	6a 11                	push   $0x11
80105e54:	e9 8e fa ff ff       	jmp    801058e7 <alltraps>

80105e59 <vector18>:
80105e59:	6a 00                	push   $0x0
80105e5b:	6a 12                	push   $0x12
80105e5d:	e9 85 fa ff ff       	jmp    801058e7 <alltraps>

80105e62 <vector19>:
80105e62:	6a 00                	push   $0x0
80105e64:	6a 13                	push   $0x13
80105e66:	e9 7c fa ff ff       	jmp    801058e7 <alltraps>

80105e6b <vector20>:
80105e6b:	6a 00                	push   $0x0
80105e6d:	6a 14                	push   $0x14
80105e6f:	e9 73 fa ff ff       	jmp    801058e7 <alltraps>

80105e74 <vector21>:
80105e74:	6a 00                	push   $0x0
80105e76:	6a 15                	push   $0x15
80105e78:	e9 6a fa ff ff       	jmp    801058e7 <alltraps>

80105e7d <vector22>:
80105e7d:	6a 00                	push   $0x0
80105e7f:	6a 16                	push   $0x16
80105e81:	e9 61 fa ff ff       	jmp    801058e7 <alltraps>

80105e86 <vector23>:
80105e86:	6a 00                	push   $0x0
80105e88:	6a 17                	push   $0x17
80105e8a:	e9 58 fa ff ff       	jmp    801058e7 <alltraps>

80105e8f <vector24>:
80105e8f:	6a 00                	push   $0x0
80105e91:	6a 18                	push   $0x18
80105e93:	e9 4f fa ff ff       	jmp    801058e7 <alltraps>

80105e98 <vector25>:
80105e98:	6a 00                	push   $0x0
80105e9a:	6a 19                	push   $0x19
80105e9c:	e9 46 fa ff ff       	jmp    801058e7 <alltraps>

80105ea1 <vector26>:
80105ea1:	6a 00                	push   $0x0
80105ea3:	6a 1a                	push   $0x1a
80105ea5:	e9 3d fa ff ff       	jmp    801058e7 <alltraps>

80105eaa <vector27>:
80105eaa:	6a 00                	push   $0x0
80105eac:	6a 1b                	push   $0x1b
80105eae:	e9 34 fa ff ff       	jmp    801058e7 <alltraps>

80105eb3 <vector28>:
80105eb3:	6a 00                	push   $0x0
80105eb5:	6a 1c                	push   $0x1c
80105eb7:	e9 2b fa ff ff       	jmp    801058e7 <alltraps>

80105ebc <vector29>:
80105ebc:	6a 00                	push   $0x0
80105ebe:	6a 1d                	push   $0x1d
80105ec0:	e9 22 fa ff ff       	jmp    801058e7 <alltraps>

80105ec5 <vector30>:
80105ec5:	6a 00                	push   $0x0
80105ec7:	6a 1e                	push   $0x1e
80105ec9:	e9 19 fa ff ff       	jmp    801058e7 <alltraps>

80105ece <vector31>:
80105ece:	6a 00                	push   $0x0
80105ed0:	6a 1f                	push   $0x1f
80105ed2:	e9 10 fa ff ff       	jmp    801058e7 <alltraps>

80105ed7 <vector32>:
80105ed7:	6a 00                	push   $0x0
80105ed9:	6a 20                	push   $0x20
80105edb:	e9 07 fa ff ff       	jmp    801058e7 <alltraps>

80105ee0 <vector33>:
80105ee0:	6a 00                	push   $0x0
80105ee2:	6a 21                	push   $0x21
80105ee4:	e9 fe f9 ff ff       	jmp    801058e7 <alltraps>

80105ee9 <vector34>:
80105ee9:	6a 00                	push   $0x0
80105eeb:	6a 22                	push   $0x22
80105eed:	e9 f5 f9 ff ff       	jmp    801058e7 <alltraps>

80105ef2 <vector35>:
80105ef2:	6a 00                	push   $0x0
80105ef4:	6a 23                	push   $0x23
80105ef6:	e9 ec f9 ff ff       	jmp    801058e7 <alltraps>

80105efb <vector36>:
80105efb:	6a 00                	push   $0x0
80105efd:	6a 24                	push   $0x24
80105eff:	e9 e3 f9 ff ff       	jmp    801058e7 <alltraps>

80105f04 <vector37>:
80105f04:	6a 00                	push   $0x0
80105f06:	6a 25                	push   $0x25
80105f08:	e9 da f9 ff ff       	jmp    801058e7 <alltraps>

80105f0d <vector38>:
80105f0d:	6a 00                	push   $0x0
80105f0f:	6a 26                	push   $0x26
80105f11:	e9 d1 f9 ff ff       	jmp    801058e7 <alltraps>

80105f16 <vector39>:
80105f16:	6a 00                	push   $0x0
80105f18:	6a 27                	push   $0x27
80105f1a:	e9 c8 f9 ff ff       	jmp    801058e7 <alltraps>

80105f1f <vector40>:
80105f1f:	6a 00                	push   $0x0
80105f21:	6a 28                	push   $0x28
80105f23:	e9 bf f9 ff ff       	jmp    801058e7 <alltraps>

80105f28 <vector41>:
80105f28:	6a 00                	push   $0x0
80105f2a:	6a 29                	push   $0x29
80105f2c:	e9 b6 f9 ff ff       	jmp    801058e7 <alltraps>

80105f31 <vector42>:
80105f31:	6a 00                	push   $0x0
80105f33:	6a 2a                	push   $0x2a
80105f35:	e9 ad f9 ff ff       	jmp    801058e7 <alltraps>

80105f3a <vector43>:
80105f3a:	6a 00                	push   $0x0
80105f3c:	6a 2b                	push   $0x2b
80105f3e:	e9 a4 f9 ff ff       	jmp    801058e7 <alltraps>

80105f43 <vector44>:
80105f43:	6a 00                	push   $0x0
80105f45:	6a 2c                	push   $0x2c
80105f47:	e9 9b f9 ff ff       	jmp    801058e7 <alltraps>

80105f4c <vector45>:
80105f4c:	6a 00                	push   $0x0
80105f4e:	6a 2d                	push   $0x2d
80105f50:	e9 92 f9 ff ff       	jmp    801058e7 <alltraps>

80105f55 <vector46>:
80105f55:	6a 00                	push   $0x0
80105f57:	6a 2e                	push   $0x2e
80105f59:	e9 89 f9 ff ff       	jmp    801058e7 <alltraps>

80105f5e <vector47>:
80105f5e:	6a 00                	push   $0x0
80105f60:	6a 2f                	push   $0x2f
80105f62:	e9 80 f9 ff ff       	jmp    801058e7 <alltraps>

80105f67 <vector48>:
80105f67:	6a 00                	push   $0x0
80105f69:	6a 30                	push   $0x30
80105f6b:	e9 77 f9 ff ff       	jmp    801058e7 <alltraps>

80105f70 <vector49>:
80105f70:	6a 00                	push   $0x0
80105f72:	6a 31                	push   $0x31
80105f74:	e9 6e f9 ff ff       	jmp    801058e7 <alltraps>

80105f79 <vector50>:
80105f79:	6a 00                	push   $0x0
80105f7b:	6a 32                	push   $0x32
80105f7d:	e9 65 f9 ff ff       	jmp    801058e7 <alltraps>

80105f82 <vector51>:
80105f82:	6a 00                	push   $0x0
80105f84:	6a 33                	push   $0x33
80105f86:	e9 5c f9 ff ff       	jmp    801058e7 <alltraps>

80105f8b <vector52>:
80105f8b:	6a 00                	push   $0x0
80105f8d:	6a 34                	push   $0x34
80105f8f:	e9 53 f9 ff ff       	jmp    801058e7 <alltraps>

80105f94 <vector53>:
80105f94:	6a 00                	push   $0x0
80105f96:	6a 35                	push   $0x35
80105f98:	e9 4a f9 ff ff       	jmp    801058e7 <alltraps>

80105f9d <vector54>:
80105f9d:	6a 00                	push   $0x0
80105f9f:	6a 36                	push   $0x36
80105fa1:	e9 41 f9 ff ff       	jmp    801058e7 <alltraps>

80105fa6 <vector55>:
80105fa6:	6a 00                	push   $0x0
80105fa8:	6a 37                	push   $0x37
80105faa:	e9 38 f9 ff ff       	jmp    801058e7 <alltraps>

80105faf <vector56>:
80105faf:	6a 00                	push   $0x0
80105fb1:	6a 38                	push   $0x38
80105fb3:	e9 2f f9 ff ff       	jmp    801058e7 <alltraps>

80105fb8 <vector57>:
80105fb8:	6a 00                	push   $0x0
80105fba:	6a 39                	push   $0x39
80105fbc:	e9 26 f9 ff ff       	jmp    801058e7 <alltraps>

80105fc1 <vector58>:
80105fc1:	6a 00                	push   $0x0
80105fc3:	6a 3a                	push   $0x3a
80105fc5:	e9 1d f9 ff ff       	jmp    801058e7 <alltraps>

80105fca <vector59>:
80105fca:	6a 00                	push   $0x0
80105fcc:	6a 3b                	push   $0x3b
80105fce:	e9 14 f9 ff ff       	jmp    801058e7 <alltraps>

80105fd3 <vector60>:
80105fd3:	6a 00                	push   $0x0
80105fd5:	6a 3c                	push   $0x3c
80105fd7:	e9 0b f9 ff ff       	jmp    801058e7 <alltraps>

80105fdc <vector61>:
80105fdc:	6a 00                	push   $0x0
80105fde:	6a 3d                	push   $0x3d
80105fe0:	e9 02 f9 ff ff       	jmp    801058e7 <alltraps>

80105fe5 <vector62>:
80105fe5:	6a 00                	push   $0x0
80105fe7:	6a 3e                	push   $0x3e
80105fe9:	e9 f9 f8 ff ff       	jmp    801058e7 <alltraps>

80105fee <vector63>:
80105fee:	6a 00                	push   $0x0
80105ff0:	6a 3f                	push   $0x3f
80105ff2:	e9 f0 f8 ff ff       	jmp    801058e7 <alltraps>

80105ff7 <vector64>:
80105ff7:	6a 00                	push   $0x0
80105ff9:	6a 40                	push   $0x40
80105ffb:	e9 e7 f8 ff ff       	jmp    801058e7 <alltraps>

80106000 <vector65>:
80106000:	6a 00                	push   $0x0
80106002:	6a 41                	push   $0x41
80106004:	e9 de f8 ff ff       	jmp    801058e7 <alltraps>

80106009 <vector66>:
80106009:	6a 00                	push   $0x0
8010600b:	6a 42                	push   $0x42
8010600d:	e9 d5 f8 ff ff       	jmp    801058e7 <alltraps>

80106012 <vector67>:
80106012:	6a 00                	push   $0x0
80106014:	6a 43                	push   $0x43
80106016:	e9 cc f8 ff ff       	jmp    801058e7 <alltraps>

8010601b <vector68>:
8010601b:	6a 00                	push   $0x0
8010601d:	6a 44                	push   $0x44
8010601f:	e9 c3 f8 ff ff       	jmp    801058e7 <alltraps>

80106024 <vector69>:
80106024:	6a 00                	push   $0x0
80106026:	6a 45                	push   $0x45
80106028:	e9 ba f8 ff ff       	jmp    801058e7 <alltraps>

8010602d <vector70>:
8010602d:	6a 00                	push   $0x0
8010602f:	6a 46                	push   $0x46
80106031:	e9 b1 f8 ff ff       	jmp    801058e7 <alltraps>

80106036 <vector71>:
80106036:	6a 00                	push   $0x0
80106038:	6a 47                	push   $0x47
8010603a:	e9 a8 f8 ff ff       	jmp    801058e7 <alltraps>

8010603f <vector72>:
8010603f:	6a 00                	push   $0x0
80106041:	6a 48                	push   $0x48
80106043:	e9 9f f8 ff ff       	jmp    801058e7 <alltraps>

80106048 <vector73>:
80106048:	6a 00                	push   $0x0
8010604a:	6a 49                	push   $0x49
8010604c:	e9 96 f8 ff ff       	jmp    801058e7 <alltraps>

80106051 <vector74>:
80106051:	6a 00                	push   $0x0
80106053:	6a 4a                	push   $0x4a
80106055:	e9 8d f8 ff ff       	jmp    801058e7 <alltraps>

8010605a <vector75>:
8010605a:	6a 00                	push   $0x0
8010605c:	6a 4b                	push   $0x4b
8010605e:	e9 84 f8 ff ff       	jmp    801058e7 <alltraps>

80106063 <vector76>:
80106063:	6a 00                	push   $0x0
80106065:	6a 4c                	push   $0x4c
80106067:	e9 7b f8 ff ff       	jmp    801058e7 <alltraps>

8010606c <vector77>:
8010606c:	6a 00                	push   $0x0
8010606e:	6a 4d                	push   $0x4d
80106070:	e9 72 f8 ff ff       	jmp    801058e7 <alltraps>

80106075 <vector78>:
80106075:	6a 00                	push   $0x0
80106077:	6a 4e                	push   $0x4e
80106079:	e9 69 f8 ff ff       	jmp    801058e7 <alltraps>

8010607e <vector79>:
8010607e:	6a 00                	push   $0x0
80106080:	6a 4f                	push   $0x4f
80106082:	e9 60 f8 ff ff       	jmp    801058e7 <alltraps>

80106087 <vector80>:
80106087:	6a 00                	push   $0x0
80106089:	6a 50                	push   $0x50
8010608b:	e9 57 f8 ff ff       	jmp    801058e7 <alltraps>

80106090 <vector81>:
80106090:	6a 00                	push   $0x0
80106092:	6a 51                	push   $0x51
80106094:	e9 4e f8 ff ff       	jmp    801058e7 <alltraps>

80106099 <vector82>:
80106099:	6a 00                	push   $0x0
8010609b:	6a 52                	push   $0x52
8010609d:	e9 45 f8 ff ff       	jmp    801058e7 <alltraps>

801060a2 <vector83>:
801060a2:	6a 00                	push   $0x0
801060a4:	6a 53                	push   $0x53
801060a6:	e9 3c f8 ff ff       	jmp    801058e7 <alltraps>

801060ab <vector84>:
801060ab:	6a 00                	push   $0x0
801060ad:	6a 54                	push   $0x54
801060af:	e9 33 f8 ff ff       	jmp    801058e7 <alltraps>

801060b4 <vector85>:
801060b4:	6a 00                	push   $0x0
801060b6:	6a 55                	push   $0x55
801060b8:	e9 2a f8 ff ff       	jmp    801058e7 <alltraps>

801060bd <vector86>:
801060bd:	6a 00                	push   $0x0
801060bf:	6a 56                	push   $0x56
801060c1:	e9 21 f8 ff ff       	jmp    801058e7 <alltraps>

801060c6 <vector87>:
801060c6:	6a 00                	push   $0x0
801060c8:	6a 57                	push   $0x57
801060ca:	e9 18 f8 ff ff       	jmp    801058e7 <alltraps>

801060cf <vector88>:
801060cf:	6a 00                	push   $0x0
801060d1:	6a 58                	push   $0x58
801060d3:	e9 0f f8 ff ff       	jmp    801058e7 <alltraps>

801060d8 <vector89>:
801060d8:	6a 00                	push   $0x0
801060da:	6a 59                	push   $0x59
801060dc:	e9 06 f8 ff ff       	jmp    801058e7 <alltraps>

801060e1 <vector90>:
801060e1:	6a 00                	push   $0x0
801060e3:	6a 5a                	push   $0x5a
801060e5:	e9 fd f7 ff ff       	jmp    801058e7 <alltraps>

801060ea <vector91>:
801060ea:	6a 00                	push   $0x0
801060ec:	6a 5b                	push   $0x5b
801060ee:	e9 f4 f7 ff ff       	jmp    801058e7 <alltraps>

801060f3 <vector92>:
801060f3:	6a 00                	push   $0x0
801060f5:	6a 5c                	push   $0x5c
801060f7:	e9 eb f7 ff ff       	jmp    801058e7 <alltraps>

801060fc <vector93>:
801060fc:	6a 00                	push   $0x0
801060fe:	6a 5d                	push   $0x5d
80106100:	e9 e2 f7 ff ff       	jmp    801058e7 <alltraps>

80106105 <vector94>:
80106105:	6a 00                	push   $0x0
80106107:	6a 5e                	push   $0x5e
80106109:	e9 d9 f7 ff ff       	jmp    801058e7 <alltraps>

8010610e <vector95>:
8010610e:	6a 00                	push   $0x0
80106110:	6a 5f                	push   $0x5f
80106112:	e9 d0 f7 ff ff       	jmp    801058e7 <alltraps>

80106117 <vector96>:
80106117:	6a 00                	push   $0x0
80106119:	6a 60                	push   $0x60
8010611b:	e9 c7 f7 ff ff       	jmp    801058e7 <alltraps>

80106120 <vector97>:
80106120:	6a 00                	push   $0x0
80106122:	6a 61                	push   $0x61
80106124:	e9 be f7 ff ff       	jmp    801058e7 <alltraps>

80106129 <vector98>:
80106129:	6a 00                	push   $0x0
8010612b:	6a 62                	push   $0x62
8010612d:	e9 b5 f7 ff ff       	jmp    801058e7 <alltraps>

80106132 <vector99>:
80106132:	6a 00                	push   $0x0
80106134:	6a 63                	push   $0x63
80106136:	e9 ac f7 ff ff       	jmp    801058e7 <alltraps>

8010613b <vector100>:
8010613b:	6a 00                	push   $0x0
8010613d:	6a 64                	push   $0x64
8010613f:	e9 a3 f7 ff ff       	jmp    801058e7 <alltraps>

80106144 <vector101>:
80106144:	6a 00                	push   $0x0
80106146:	6a 65                	push   $0x65
80106148:	e9 9a f7 ff ff       	jmp    801058e7 <alltraps>

8010614d <vector102>:
8010614d:	6a 00                	push   $0x0
8010614f:	6a 66                	push   $0x66
80106151:	e9 91 f7 ff ff       	jmp    801058e7 <alltraps>

80106156 <vector103>:
80106156:	6a 00                	push   $0x0
80106158:	6a 67                	push   $0x67
8010615a:	e9 88 f7 ff ff       	jmp    801058e7 <alltraps>

8010615f <vector104>:
8010615f:	6a 00                	push   $0x0
80106161:	6a 68                	push   $0x68
80106163:	e9 7f f7 ff ff       	jmp    801058e7 <alltraps>

80106168 <vector105>:
80106168:	6a 00                	push   $0x0
8010616a:	6a 69                	push   $0x69
8010616c:	e9 76 f7 ff ff       	jmp    801058e7 <alltraps>

80106171 <vector106>:
80106171:	6a 00                	push   $0x0
80106173:	6a 6a                	push   $0x6a
80106175:	e9 6d f7 ff ff       	jmp    801058e7 <alltraps>

8010617a <vector107>:
8010617a:	6a 00                	push   $0x0
8010617c:	6a 6b                	push   $0x6b
8010617e:	e9 64 f7 ff ff       	jmp    801058e7 <alltraps>

80106183 <vector108>:
80106183:	6a 00                	push   $0x0
80106185:	6a 6c                	push   $0x6c
80106187:	e9 5b f7 ff ff       	jmp    801058e7 <alltraps>

8010618c <vector109>:
8010618c:	6a 00                	push   $0x0
8010618e:	6a 6d                	push   $0x6d
80106190:	e9 52 f7 ff ff       	jmp    801058e7 <alltraps>

80106195 <vector110>:
80106195:	6a 00                	push   $0x0
80106197:	6a 6e                	push   $0x6e
80106199:	e9 49 f7 ff ff       	jmp    801058e7 <alltraps>

8010619e <vector111>:
8010619e:	6a 00                	push   $0x0
801061a0:	6a 6f                	push   $0x6f
801061a2:	e9 40 f7 ff ff       	jmp    801058e7 <alltraps>

801061a7 <vector112>:
801061a7:	6a 00                	push   $0x0
801061a9:	6a 70                	push   $0x70
801061ab:	e9 37 f7 ff ff       	jmp    801058e7 <alltraps>

801061b0 <vector113>:
801061b0:	6a 00                	push   $0x0
801061b2:	6a 71                	push   $0x71
801061b4:	e9 2e f7 ff ff       	jmp    801058e7 <alltraps>

801061b9 <vector114>:
801061b9:	6a 00                	push   $0x0
801061bb:	6a 72                	push   $0x72
801061bd:	e9 25 f7 ff ff       	jmp    801058e7 <alltraps>

801061c2 <vector115>:
801061c2:	6a 00                	push   $0x0
801061c4:	6a 73                	push   $0x73
801061c6:	e9 1c f7 ff ff       	jmp    801058e7 <alltraps>

801061cb <vector116>:
801061cb:	6a 00                	push   $0x0
801061cd:	6a 74                	push   $0x74
801061cf:	e9 13 f7 ff ff       	jmp    801058e7 <alltraps>

801061d4 <vector117>:
801061d4:	6a 00                	push   $0x0
801061d6:	6a 75                	push   $0x75
801061d8:	e9 0a f7 ff ff       	jmp    801058e7 <alltraps>

801061dd <vector118>:
801061dd:	6a 00                	push   $0x0
801061df:	6a 76                	push   $0x76
801061e1:	e9 01 f7 ff ff       	jmp    801058e7 <alltraps>

801061e6 <vector119>:
801061e6:	6a 00                	push   $0x0
801061e8:	6a 77                	push   $0x77
801061ea:	e9 f8 f6 ff ff       	jmp    801058e7 <alltraps>

801061ef <vector120>:
801061ef:	6a 00                	push   $0x0
801061f1:	6a 78                	push   $0x78
801061f3:	e9 ef f6 ff ff       	jmp    801058e7 <alltraps>

801061f8 <vector121>:
801061f8:	6a 00                	push   $0x0
801061fa:	6a 79                	push   $0x79
801061fc:	e9 e6 f6 ff ff       	jmp    801058e7 <alltraps>

80106201 <vector122>:
80106201:	6a 00                	push   $0x0
80106203:	6a 7a                	push   $0x7a
80106205:	e9 dd f6 ff ff       	jmp    801058e7 <alltraps>

8010620a <vector123>:
8010620a:	6a 00                	push   $0x0
8010620c:	6a 7b                	push   $0x7b
8010620e:	e9 d4 f6 ff ff       	jmp    801058e7 <alltraps>

80106213 <vector124>:
80106213:	6a 00                	push   $0x0
80106215:	6a 7c                	push   $0x7c
80106217:	e9 cb f6 ff ff       	jmp    801058e7 <alltraps>

8010621c <vector125>:
8010621c:	6a 00                	push   $0x0
8010621e:	6a 7d                	push   $0x7d
80106220:	e9 c2 f6 ff ff       	jmp    801058e7 <alltraps>

80106225 <vector126>:
80106225:	6a 00                	push   $0x0
80106227:	6a 7e                	push   $0x7e
80106229:	e9 b9 f6 ff ff       	jmp    801058e7 <alltraps>

8010622e <vector127>:
8010622e:	6a 00                	push   $0x0
80106230:	6a 7f                	push   $0x7f
80106232:	e9 b0 f6 ff ff       	jmp    801058e7 <alltraps>

80106237 <vector128>:
80106237:	6a 00                	push   $0x0
80106239:	68 80 00 00 00       	push   $0x80
8010623e:	e9 a4 f6 ff ff       	jmp    801058e7 <alltraps>

80106243 <vector129>:
80106243:	6a 00                	push   $0x0
80106245:	68 81 00 00 00       	push   $0x81
8010624a:	e9 98 f6 ff ff       	jmp    801058e7 <alltraps>

8010624f <vector130>:
8010624f:	6a 00                	push   $0x0
80106251:	68 82 00 00 00       	push   $0x82
80106256:	e9 8c f6 ff ff       	jmp    801058e7 <alltraps>

8010625b <vector131>:
8010625b:	6a 00                	push   $0x0
8010625d:	68 83 00 00 00       	push   $0x83
80106262:	e9 80 f6 ff ff       	jmp    801058e7 <alltraps>

80106267 <vector132>:
80106267:	6a 00                	push   $0x0
80106269:	68 84 00 00 00       	push   $0x84
8010626e:	e9 74 f6 ff ff       	jmp    801058e7 <alltraps>

80106273 <vector133>:
80106273:	6a 00                	push   $0x0
80106275:	68 85 00 00 00       	push   $0x85
8010627a:	e9 68 f6 ff ff       	jmp    801058e7 <alltraps>

8010627f <vector134>:
8010627f:	6a 00                	push   $0x0
80106281:	68 86 00 00 00       	push   $0x86
80106286:	e9 5c f6 ff ff       	jmp    801058e7 <alltraps>

8010628b <vector135>:
8010628b:	6a 00                	push   $0x0
8010628d:	68 87 00 00 00       	push   $0x87
80106292:	e9 50 f6 ff ff       	jmp    801058e7 <alltraps>

80106297 <vector136>:
80106297:	6a 00                	push   $0x0
80106299:	68 88 00 00 00       	push   $0x88
8010629e:	e9 44 f6 ff ff       	jmp    801058e7 <alltraps>

801062a3 <vector137>:
801062a3:	6a 00                	push   $0x0
801062a5:	68 89 00 00 00       	push   $0x89
801062aa:	e9 38 f6 ff ff       	jmp    801058e7 <alltraps>

801062af <vector138>:
801062af:	6a 00                	push   $0x0
801062b1:	68 8a 00 00 00       	push   $0x8a
801062b6:	e9 2c f6 ff ff       	jmp    801058e7 <alltraps>

801062bb <vector139>:
801062bb:	6a 00                	push   $0x0
801062bd:	68 8b 00 00 00       	push   $0x8b
801062c2:	e9 20 f6 ff ff       	jmp    801058e7 <alltraps>

801062c7 <vector140>:
801062c7:	6a 00                	push   $0x0
801062c9:	68 8c 00 00 00       	push   $0x8c
801062ce:	e9 14 f6 ff ff       	jmp    801058e7 <alltraps>

801062d3 <vector141>:
801062d3:	6a 00                	push   $0x0
801062d5:	68 8d 00 00 00       	push   $0x8d
801062da:	e9 08 f6 ff ff       	jmp    801058e7 <alltraps>

801062df <vector142>:
801062df:	6a 00                	push   $0x0
801062e1:	68 8e 00 00 00       	push   $0x8e
801062e6:	e9 fc f5 ff ff       	jmp    801058e7 <alltraps>

801062eb <vector143>:
801062eb:	6a 00                	push   $0x0
801062ed:	68 8f 00 00 00       	push   $0x8f
801062f2:	e9 f0 f5 ff ff       	jmp    801058e7 <alltraps>

801062f7 <vector144>:
801062f7:	6a 00                	push   $0x0
801062f9:	68 90 00 00 00       	push   $0x90
801062fe:	e9 e4 f5 ff ff       	jmp    801058e7 <alltraps>

80106303 <vector145>:
80106303:	6a 00                	push   $0x0
80106305:	68 91 00 00 00       	push   $0x91
8010630a:	e9 d8 f5 ff ff       	jmp    801058e7 <alltraps>

8010630f <vector146>:
8010630f:	6a 00                	push   $0x0
80106311:	68 92 00 00 00       	push   $0x92
80106316:	e9 cc f5 ff ff       	jmp    801058e7 <alltraps>

8010631b <vector147>:
8010631b:	6a 00                	push   $0x0
8010631d:	68 93 00 00 00       	push   $0x93
80106322:	e9 c0 f5 ff ff       	jmp    801058e7 <alltraps>

80106327 <vector148>:
80106327:	6a 00                	push   $0x0
80106329:	68 94 00 00 00       	push   $0x94
8010632e:	e9 b4 f5 ff ff       	jmp    801058e7 <alltraps>

80106333 <vector149>:
80106333:	6a 00                	push   $0x0
80106335:	68 95 00 00 00       	push   $0x95
8010633a:	e9 a8 f5 ff ff       	jmp    801058e7 <alltraps>

8010633f <vector150>:
8010633f:	6a 00                	push   $0x0
80106341:	68 96 00 00 00       	push   $0x96
80106346:	e9 9c f5 ff ff       	jmp    801058e7 <alltraps>

8010634b <vector151>:
8010634b:	6a 00                	push   $0x0
8010634d:	68 97 00 00 00       	push   $0x97
80106352:	e9 90 f5 ff ff       	jmp    801058e7 <alltraps>

80106357 <vector152>:
80106357:	6a 00                	push   $0x0
80106359:	68 98 00 00 00       	push   $0x98
8010635e:	e9 84 f5 ff ff       	jmp    801058e7 <alltraps>

80106363 <vector153>:
80106363:	6a 00                	push   $0x0
80106365:	68 99 00 00 00       	push   $0x99
8010636a:	e9 78 f5 ff ff       	jmp    801058e7 <alltraps>

8010636f <vector154>:
8010636f:	6a 00                	push   $0x0
80106371:	68 9a 00 00 00       	push   $0x9a
80106376:	e9 6c f5 ff ff       	jmp    801058e7 <alltraps>

8010637b <vector155>:
8010637b:	6a 00                	push   $0x0
8010637d:	68 9b 00 00 00       	push   $0x9b
80106382:	e9 60 f5 ff ff       	jmp    801058e7 <alltraps>

80106387 <vector156>:
80106387:	6a 00                	push   $0x0
80106389:	68 9c 00 00 00       	push   $0x9c
8010638e:	e9 54 f5 ff ff       	jmp    801058e7 <alltraps>

80106393 <vector157>:
80106393:	6a 00                	push   $0x0
80106395:	68 9d 00 00 00       	push   $0x9d
8010639a:	e9 48 f5 ff ff       	jmp    801058e7 <alltraps>

8010639f <vector158>:
8010639f:	6a 00                	push   $0x0
801063a1:	68 9e 00 00 00       	push   $0x9e
801063a6:	e9 3c f5 ff ff       	jmp    801058e7 <alltraps>

801063ab <vector159>:
801063ab:	6a 00                	push   $0x0
801063ad:	68 9f 00 00 00       	push   $0x9f
801063b2:	e9 30 f5 ff ff       	jmp    801058e7 <alltraps>

801063b7 <vector160>:
801063b7:	6a 00                	push   $0x0
801063b9:	68 a0 00 00 00       	push   $0xa0
801063be:	e9 24 f5 ff ff       	jmp    801058e7 <alltraps>

801063c3 <vector161>:
801063c3:	6a 00                	push   $0x0
801063c5:	68 a1 00 00 00       	push   $0xa1
801063ca:	e9 18 f5 ff ff       	jmp    801058e7 <alltraps>

801063cf <vector162>:
801063cf:	6a 00                	push   $0x0
801063d1:	68 a2 00 00 00       	push   $0xa2
801063d6:	e9 0c f5 ff ff       	jmp    801058e7 <alltraps>

801063db <vector163>:
801063db:	6a 00                	push   $0x0
801063dd:	68 a3 00 00 00       	push   $0xa3
801063e2:	e9 00 f5 ff ff       	jmp    801058e7 <alltraps>

801063e7 <vector164>:
801063e7:	6a 00                	push   $0x0
801063e9:	68 a4 00 00 00       	push   $0xa4
801063ee:	e9 f4 f4 ff ff       	jmp    801058e7 <alltraps>

801063f3 <vector165>:
801063f3:	6a 00                	push   $0x0
801063f5:	68 a5 00 00 00       	push   $0xa5
801063fa:	e9 e8 f4 ff ff       	jmp    801058e7 <alltraps>

801063ff <vector166>:
801063ff:	6a 00                	push   $0x0
80106401:	68 a6 00 00 00       	push   $0xa6
80106406:	e9 dc f4 ff ff       	jmp    801058e7 <alltraps>

8010640b <vector167>:
8010640b:	6a 00                	push   $0x0
8010640d:	68 a7 00 00 00       	push   $0xa7
80106412:	e9 d0 f4 ff ff       	jmp    801058e7 <alltraps>

80106417 <vector168>:
80106417:	6a 00                	push   $0x0
80106419:	68 a8 00 00 00       	push   $0xa8
8010641e:	e9 c4 f4 ff ff       	jmp    801058e7 <alltraps>

80106423 <vector169>:
80106423:	6a 00                	push   $0x0
80106425:	68 a9 00 00 00       	push   $0xa9
8010642a:	e9 b8 f4 ff ff       	jmp    801058e7 <alltraps>

8010642f <vector170>:
8010642f:	6a 00                	push   $0x0
80106431:	68 aa 00 00 00       	push   $0xaa
80106436:	e9 ac f4 ff ff       	jmp    801058e7 <alltraps>

8010643b <vector171>:
8010643b:	6a 00                	push   $0x0
8010643d:	68 ab 00 00 00       	push   $0xab
80106442:	e9 a0 f4 ff ff       	jmp    801058e7 <alltraps>

80106447 <vector172>:
80106447:	6a 00                	push   $0x0
80106449:	68 ac 00 00 00       	push   $0xac
8010644e:	e9 94 f4 ff ff       	jmp    801058e7 <alltraps>

80106453 <vector173>:
80106453:	6a 00                	push   $0x0
80106455:	68 ad 00 00 00       	push   $0xad
8010645a:	e9 88 f4 ff ff       	jmp    801058e7 <alltraps>

8010645f <vector174>:
8010645f:	6a 00                	push   $0x0
80106461:	68 ae 00 00 00       	push   $0xae
80106466:	e9 7c f4 ff ff       	jmp    801058e7 <alltraps>

8010646b <vector175>:
8010646b:	6a 00                	push   $0x0
8010646d:	68 af 00 00 00       	push   $0xaf
80106472:	e9 70 f4 ff ff       	jmp    801058e7 <alltraps>

80106477 <vector176>:
80106477:	6a 00                	push   $0x0
80106479:	68 b0 00 00 00       	push   $0xb0
8010647e:	e9 64 f4 ff ff       	jmp    801058e7 <alltraps>

80106483 <vector177>:
80106483:	6a 00                	push   $0x0
80106485:	68 b1 00 00 00       	push   $0xb1
8010648a:	e9 58 f4 ff ff       	jmp    801058e7 <alltraps>

8010648f <vector178>:
8010648f:	6a 00                	push   $0x0
80106491:	68 b2 00 00 00       	push   $0xb2
80106496:	e9 4c f4 ff ff       	jmp    801058e7 <alltraps>

8010649b <vector179>:
8010649b:	6a 00                	push   $0x0
8010649d:	68 b3 00 00 00       	push   $0xb3
801064a2:	e9 40 f4 ff ff       	jmp    801058e7 <alltraps>

801064a7 <vector180>:
801064a7:	6a 00                	push   $0x0
801064a9:	68 b4 00 00 00       	push   $0xb4
801064ae:	e9 34 f4 ff ff       	jmp    801058e7 <alltraps>

801064b3 <vector181>:
801064b3:	6a 00                	push   $0x0
801064b5:	68 b5 00 00 00       	push   $0xb5
801064ba:	e9 28 f4 ff ff       	jmp    801058e7 <alltraps>

801064bf <vector182>:
801064bf:	6a 00                	push   $0x0
801064c1:	68 b6 00 00 00       	push   $0xb6
801064c6:	e9 1c f4 ff ff       	jmp    801058e7 <alltraps>

801064cb <vector183>:
801064cb:	6a 00                	push   $0x0
801064cd:	68 b7 00 00 00       	push   $0xb7
801064d2:	e9 10 f4 ff ff       	jmp    801058e7 <alltraps>

801064d7 <vector184>:
801064d7:	6a 00                	push   $0x0
801064d9:	68 b8 00 00 00       	push   $0xb8
801064de:	e9 04 f4 ff ff       	jmp    801058e7 <alltraps>

801064e3 <vector185>:
801064e3:	6a 00                	push   $0x0
801064e5:	68 b9 00 00 00       	push   $0xb9
801064ea:	e9 f8 f3 ff ff       	jmp    801058e7 <alltraps>

801064ef <vector186>:
801064ef:	6a 00                	push   $0x0
801064f1:	68 ba 00 00 00       	push   $0xba
801064f6:	e9 ec f3 ff ff       	jmp    801058e7 <alltraps>

801064fb <vector187>:
801064fb:	6a 00                	push   $0x0
801064fd:	68 bb 00 00 00       	push   $0xbb
80106502:	e9 e0 f3 ff ff       	jmp    801058e7 <alltraps>

80106507 <vector188>:
80106507:	6a 00                	push   $0x0
80106509:	68 bc 00 00 00       	push   $0xbc
8010650e:	e9 d4 f3 ff ff       	jmp    801058e7 <alltraps>

80106513 <vector189>:
80106513:	6a 00                	push   $0x0
80106515:	68 bd 00 00 00       	push   $0xbd
8010651a:	e9 c8 f3 ff ff       	jmp    801058e7 <alltraps>

8010651f <vector190>:
8010651f:	6a 00                	push   $0x0
80106521:	68 be 00 00 00       	push   $0xbe
80106526:	e9 bc f3 ff ff       	jmp    801058e7 <alltraps>

8010652b <vector191>:
8010652b:	6a 00                	push   $0x0
8010652d:	68 bf 00 00 00       	push   $0xbf
80106532:	e9 b0 f3 ff ff       	jmp    801058e7 <alltraps>

80106537 <vector192>:
80106537:	6a 00                	push   $0x0
80106539:	68 c0 00 00 00       	push   $0xc0
8010653e:	e9 a4 f3 ff ff       	jmp    801058e7 <alltraps>

80106543 <vector193>:
80106543:	6a 00                	push   $0x0
80106545:	68 c1 00 00 00       	push   $0xc1
8010654a:	e9 98 f3 ff ff       	jmp    801058e7 <alltraps>

8010654f <vector194>:
8010654f:	6a 00                	push   $0x0
80106551:	68 c2 00 00 00       	push   $0xc2
80106556:	e9 8c f3 ff ff       	jmp    801058e7 <alltraps>

8010655b <vector195>:
8010655b:	6a 00                	push   $0x0
8010655d:	68 c3 00 00 00       	push   $0xc3
80106562:	e9 80 f3 ff ff       	jmp    801058e7 <alltraps>

80106567 <vector196>:
80106567:	6a 00                	push   $0x0
80106569:	68 c4 00 00 00       	push   $0xc4
8010656e:	e9 74 f3 ff ff       	jmp    801058e7 <alltraps>

80106573 <vector197>:
80106573:	6a 00                	push   $0x0
80106575:	68 c5 00 00 00       	push   $0xc5
8010657a:	e9 68 f3 ff ff       	jmp    801058e7 <alltraps>

8010657f <vector198>:
8010657f:	6a 00                	push   $0x0
80106581:	68 c6 00 00 00       	push   $0xc6
80106586:	e9 5c f3 ff ff       	jmp    801058e7 <alltraps>

8010658b <vector199>:
8010658b:	6a 00                	push   $0x0
8010658d:	68 c7 00 00 00       	push   $0xc7
80106592:	e9 50 f3 ff ff       	jmp    801058e7 <alltraps>

80106597 <vector200>:
80106597:	6a 00                	push   $0x0
80106599:	68 c8 00 00 00       	push   $0xc8
8010659e:	e9 44 f3 ff ff       	jmp    801058e7 <alltraps>

801065a3 <vector201>:
801065a3:	6a 00                	push   $0x0
801065a5:	68 c9 00 00 00       	push   $0xc9
801065aa:	e9 38 f3 ff ff       	jmp    801058e7 <alltraps>

801065af <vector202>:
801065af:	6a 00                	push   $0x0
801065b1:	68 ca 00 00 00       	push   $0xca
801065b6:	e9 2c f3 ff ff       	jmp    801058e7 <alltraps>

801065bb <vector203>:
801065bb:	6a 00                	push   $0x0
801065bd:	68 cb 00 00 00       	push   $0xcb
801065c2:	e9 20 f3 ff ff       	jmp    801058e7 <alltraps>

801065c7 <vector204>:
801065c7:	6a 00                	push   $0x0
801065c9:	68 cc 00 00 00       	push   $0xcc
801065ce:	e9 14 f3 ff ff       	jmp    801058e7 <alltraps>

801065d3 <vector205>:
801065d3:	6a 00                	push   $0x0
801065d5:	68 cd 00 00 00       	push   $0xcd
801065da:	e9 08 f3 ff ff       	jmp    801058e7 <alltraps>

801065df <vector206>:
801065df:	6a 00                	push   $0x0
801065e1:	68 ce 00 00 00       	push   $0xce
801065e6:	e9 fc f2 ff ff       	jmp    801058e7 <alltraps>

801065eb <vector207>:
801065eb:	6a 00                	push   $0x0
801065ed:	68 cf 00 00 00       	push   $0xcf
801065f2:	e9 f0 f2 ff ff       	jmp    801058e7 <alltraps>

801065f7 <vector208>:
801065f7:	6a 00                	push   $0x0
801065f9:	68 d0 00 00 00       	push   $0xd0
801065fe:	e9 e4 f2 ff ff       	jmp    801058e7 <alltraps>

80106603 <vector209>:
80106603:	6a 00                	push   $0x0
80106605:	68 d1 00 00 00       	push   $0xd1
8010660a:	e9 d8 f2 ff ff       	jmp    801058e7 <alltraps>

8010660f <vector210>:
8010660f:	6a 00                	push   $0x0
80106611:	68 d2 00 00 00       	push   $0xd2
80106616:	e9 cc f2 ff ff       	jmp    801058e7 <alltraps>

8010661b <vector211>:
8010661b:	6a 00                	push   $0x0
8010661d:	68 d3 00 00 00       	push   $0xd3
80106622:	e9 c0 f2 ff ff       	jmp    801058e7 <alltraps>

80106627 <vector212>:
80106627:	6a 00                	push   $0x0
80106629:	68 d4 00 00 00       	push   $0xd4
8010662e:	e9 b4 f2 ff ff       	jmp    801058e7 <alltraps>

80106633 <vector213>:
80106633:	6a 00                	push   $0x0
80106635:	68 d5 00 00 00       	push   $0xd5
8010663a:	e9 a8 f2 ff ff       	jmp    801058e7 <alltraps>

8010663f <vector214>:
8010663f:	6a 00                	push   $0x0
80106641:	68 d6 00 00 00       	push   $0xd6
80106646:	e9 9c f2 ff ff       	jmp    801058e7 <alltraps>

8010664b <vector215>:
8010664b:	6a 00                	push   $0x0
8010664d:	68 d7 00 00 00       	push   $0xd7
80106652:	e9 90 f2 ff ff       	jmp    801058e7 <alltraps>

80106657 <vector216>:
80106657:	6a 00                	push   $0x0
80106659:	68 d8 00 00 00       	push   $0xd8
8010665e:	e9 84 f2 ff ff       	jmp    801058e7 <alltraps>

80106663 <vector217>:
80106663:	6a 00                	push   $0x0
80106665:	68 d9 00 00 00       	push   $0xd9
8010666a:	e9 78 f2 ff ff       	jmp    801058e7 <alltraps>

8010666f <vector218>:
8010666f:	6a 00                	push   $0x0
80106671:	68 da 00 00 00       	push   $0xda
80106676:	e9 6c f2 ff ff       	jmp    801058e7 <alltraps>

8010667b <vector219>:
8010667b:	6a 00                	push   $0x0
8010667d:	68 db 00 00 00       	push   $0xdb
80106682:	e9 60 f2 ff ff       	jmp    801058e7 <alltraps>

80106687 <vector220>:
80106687:	6a 00                	push   $0x0
80106689:	68 dc 00 00 00       	push   $0xdc
8010668e:	e9 54 f2 ff ff       	jmp    801058e7 <alltraps>

80106693 <vector221>:
80106693:	6a 00                	push   $0x0
80106695:	68 dd 00 00 00       	push   $0xdd
8010669a:	e9 48 f2 ff ff       	jmp    801058e7 <alltraps>

8010669f <vector222>:
8010669f:	6a 00                	push   $0x0
801066a1:	68 de 00 00 00       	push   $0xde
801066a6:	e9 3c f2 ff ff       	jmp    801058e7 <alltraps>

801066ab <vector223>:
801066ab:	6a 00                	push   $0x0
801066ad:	68 df 00 00 00       	push   $0xdf
801066b2:	e9 30 f2 ff ff       	jmp    801058e7 <alltraps>

801066b7 <vector224>:
801066b7:	6a 00                	push   $0x0
801066b9:	68 e0 00 00 00       	push   $0xe0
801066be:	e9 24 f2 ff ff       	jmp    801058e7 <alltraps>

801066c3 <vector225>:
801066c3:	6a 00                	push   $0x0
801066c5:	68 e1 00 00 00       	push   $0xe1
801066ca:	e9 18 f2 ff ff       	jmp    801058e7 <alltraps>

801066cf <vector226>:
801066cf:	6a 00                	push   $0x0
801066d1:	68 e2 00 00 00       	push   $0xe2
801066d6:	e9 0c f2 ff ff       	jmp    801058e7 <alltraps>

801066db <vector227>:
801066db:	6a 00                	push   $0x0
801066dd:	68 e3 00 00 00       	push   $0xe3
801066e2:	e9 00 f2 ff ff       	jmp    801058e7 <alltraps>

801066e7 <vector228>:
801066e7:	6a 00                	push   $0x0
801066e9:	68 e4 00 00 00       	push   $0xe4
801066ee:	e9 f4 f1 ff ff       	jmp    801058e7 <alltraps>

801066f3 <vector229>:
801066f3:	6a 00                	push   $0x0
801066f5:	68 e5 00 00 00       	push   $0xe5
801066fa:	e9 e8 f1 ff ff       	jmp    801058e7 <alltraps>

801066ff <vector230>:
801066ff:	6a 00                	push   $0x0
80106701:	68 e6 00 00 00       	push   $0xe6
80106706:	e9 dc f1 ff ff       	jmp    801058e7 <alltraps>

8010670b <vector231>:
8010670b:	6a 00                	push   $0x0
8010670d:	68 e7 00 00 00       	push   $0xe7
80106712:	e9 d0 f1 ff ff       	jmp    801058e7 <alltraps>

80106717 <vector232>:
80106717:	6a 00                	push   $0x0
80106719:	68 e8 00 00 00       	push   $0xe8
8010671e:	e9 c4 f1 ff ff       	jmp    801058e7 <alltraps>

80106723 <vector233>:
80106723:	6a 00                	push   $0x0
80106725:	68 e9 00 00 00       	push   $0xe9
8010672a:	e9 b8 f1 ff ff       	jmp    801058e7 <alltraps>

8010672f <vector234>:
8010672f:	6a 00                	push   $0x0
80106731:	68 ea 00 00 00       	push   $0xea
80106736:	e9 ac f1 ff ff       	jmp    801058e7 <alltraps>

8010673b <vector235>:
8010673b:	6a 00                	push   $0x0
8010673d:	68 eb 00 00 00       	push   $0xeb
80106742:	e9 a0 f1 ff ff       	jmp    801058e7 <alltraps>

80106747 <vector236>:
80106747:	6a 00                	push   $0x0
80106749:	68 ec 00 00 00       	push   $0xec
8010674e:	e9 94 f1 ff ff       	jmp    801058e7 <alltraps>

80106753 <vector237>:
80106753:	6a 00                	push   $0x0
80106755:	68 ed 00 00 00       	push   $0xed
8010675a:	e9 88 f1 ff ff       	jmp    801058e7 <alltraps>

8010675f <vector238>:
8010675f:	6a 00                	push   $0x0
80106761:	68 ee 00 00 00       	push   $0xee
80106766:	e9 7c f1 ff ff       	jmp    801058e7 <alltraps>

8010676b <vector239>:
8010676b:	6a 00                	push   $0x0
8010676d:	68 ef 00 00 00       	push   $0xef
80106772:	e9 70 f1 ff ff       	jmp    801058e7 <alltraps>

80106777 <vector240>:
80106777:	6a 00                	push   $0x0
80106779:	68 f0 00 00 00       	push   $0xf0
8010677e:	e9 64 f1 ff ff       	jmp    801058e7 <alltraps>

80106783 <vector241>:
80106783:	6a 00                	push   $0x0
80106785:	68 f1 00 00 00       	push   $0xf1
8010678a:	e9 58 f1 ff ff       	jmp    801058e7 <alltraps>

8010678f <vector242>:
8010678f:	6a 00                	push   $0x0
80106791:	68 f2 00 00 00       	push   $0xf2
80106796:	e9 4c f1 ff ff       	jmp    801058e7 <alltraps>

8010679b <vector243>:
8010679b:	6a 00                	push   $0x0
8010679d:	68 f3 00 00 00       	push   $0xf3
801067a2:	e9 40 f1 ff ff       	jmp    801058e7 <alltraps>

801067a7 <vector244>:
801067a7:	6a 00                	push   $0x0
801067a9:	68 f4 00 00 00       	push   $0xf4
801067ae:	e9 34 f1 ff ff       	jmp    801058e7 <alltraps>

801067b3 <vector245>:
801067b3:	6a 00                	push   $0x0
801067b5:	68 f5 00 00 00       	push   $0xf5
801067ba:	e9 28 f1 ff ff       	jmp    801058e7 <alltraps>

801067bf <vector246>:
801067bf:	6a 00                	push   $0x0
801067c1:	68 f6 00 00 00       	push   $0xf6
801067c6:	e9 1c f1 ff ff       	jmp    801058e7 <alltraps>

801067cb <vector247>:
801067cb:	6a 00                	push   $0x0
801067cd:	68 f7 00 00 00       	push   $0xf7
801067d2:	e9 10 f1 ff ff       	jmp    801058e7 <alltraps>

801067d7 <vector248>:
801067d7:	6a 00                	push   $0x0
801067d9:	68 f8 00 00 00       	push   $0xf8
801067de:	e9 04 f1 ff ff       	jmp    801058e7 <alltraps>

801067e3 <vector249>:
801067e3:	6a 00                	push   $0x0
801067e5:	68 f9 00 00 00       	push   $0xf9
801067ea:	e9 f8 f0 ff ff       	jmp    801058e7 <alltraps>

801067ef <vector250>:
801067ef:	6a 00                	push   $0x0
801067f1:	68 fa 00 00 00       	push   $0xfa
801067f6:	e9 ec f0 ff ff       	jmp    801058e7 <alltraps>

801067fb <vector251>:
801067fb:	6a 00                	push   $0x0
801067fd:	68 fb 00 00 00       	push   $0xfb
80106802:	e9 e0 f0 ff ff       	jmp    801058e7 <alltraps>

80106807 <vector252>:
80106807:	6a 00                	push   $0x0
80106809:	68 fc 00 00 00       	push   $0xfc
8010680e:	e9 d4 f0 ff ff       	jmp    801058e7 <alltraps>

80106813 <vector253>:
80106813:	6a 00                	push   $0x0
80106815:	68 fd 00 00 00       	push   $0xfd
8010681a:	e9 c8 f0 ff ff       	jmp    801058e7 <alltraps>

8010681f <vector254>:
8010681f:	6a 00                	push   $0x0
80106821:	68 fe 00 00 00       	push   $0xfe
80106826:	e9 bc f0 ff ff       	jmp    801058e7 <alltraps>

8010682b <vector255>:
8010682b:	6a 00                	push   $0x0
8010682d:	68 ff 00 00 00       	push   $0xff
80106832:	e9 b0 f0 ff ff       	jmp    801058e7 <alltraps>
80106837:	66 90                	xchg   %ax,%ax
80106839:	66 90                	xchg   %ax,%ax
8010683b:	66 90                	xchg   %ax,%ax
8010683d:	66 90                	xchg   %ax,%ax
8010683f:	90                   	nop

80106840 <walkpgdir>:
80106840:	55                   	push   %ebp
80106841:	89 e5                	mov    %esp,%ebp
80106843:	57                   	push   %edi
80106844:	56                   	push   %esi
80106845:	53                   	push   %ebx
80106846:	89 d3                	mov    %edx,%ebx
80106848:	89 d7                	mov    %edx,%edi
8010684a:	c1 eb 16             	shr    $0x16,%ebx
8010684d:	8d 34 98             	lea    (%eax,%ebx,4),%esi
80106850:	83 ec 0c             	sub    $0xc,%esp
80106853:	8b 06                	mov    (%esi),%eax
80106855:	a8 01                	test   $0x1,%al
80106857:	74 27                	je     80106880 <walkpgdir+0x40>
80106859:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010685e:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80106864:	c1 ef 0a             	shr    $0xa,%edi
80106867:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010686a:	89 fa                	mov    %edi,%edx
8010686c:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106872:	8d 04 13             	lea    (%ebx,%edx,1),%eax
80106875:	5b                   	pop    %ebx
80106876:	5e                   	pop    %esi
80106877:	5f                   	pop    %edi
80106878:	5d                   	pop    %ebp
80106879:	c3                   	ret    
8010687a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106880:	85 c9                	test   %ecx,%ecx
80106882:	74 2c                	je     801068b0 <walkpgdir+0x70>
80106884:	e8 77 bc ff ff       	call   80102500 <kalloc>
80106889:	85 c0                	test   %eax,%eax
8010688b:	89 c3                	mov    %eax,%ebx
8010688d:	74 21                	je     801068b0 <walkpgdir+0x70>
8010688f:	83 ec 04             	sub    $0x4,%esp
80106892:	68 00 10 00 00       	push   $0x1000
80106897:	6a 00                	push   $0x0
80106899:	50                   	push   %eax
8010689a:	e8 e1 dd ff ff       	call   80104680 <memset>
8010689f:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801068a5:	83 c4 10             	add    $0x10,%esp
801068a8:	83 c8 07             	or     $0x7,%eax
801068ab:	89 06                	mov    %eax,(%esi)
801068ad:	eb b5                	jmp    80106864 <walkpgdir+0x24>
801068af:	90                   	nop
801068b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068b3:	31 c0                	xor    %eax,%eax
801068b5:	5b                   	pop    %ebx
801068b6:	5e                   	pop    %esi
801068b7:	5f                   	pop    %edi
801068b8:	5d                   	pop    %ebp
801068b9:	c3                   	ret    
801068ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801068c0 <mappages>:
801068c0:	55                   	push   %ebp
801068c1:	89 e5                	mov    %esp,%ebp
801068c3:	57                   	push   %edi
801068c4:	56                   	push   %esi
801068c5:	53                   	push   %ebx
801068c6:	89 d3                	mov    %edx,%ebx
801068c8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801068ce:	83 ec 1c             	sub    $0x1c,%esp
801068d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801068d4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
801068d8:	8b 7d 08             	mov    0x8(%ebp),%edi
801068db:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801068e0:	89 45 e0             	mov    %eax,-0x20(%ebp)
801068e3:	8b 45 0c             	mov    0xc(%ebp),%eax
801068e6:	29 df                	sub    %ebx,%edi
801068e8:	83 c8 01             	or     $0x1,%eax
801068eb:	89 45 dc             	mov    %eax,-0x24(%ebp)
801068ee:	eb 15                	jmp    80106905 <mappages+0x45>
801068f0:	f6 00 01             	testb  $0x1,(%eax)
801068f3:	75 45                	jne    8010693a <mappages+0x7a>
801068f5:	0b 75 dc             	or     -0x24(%ebp),%esi
801068f8:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
801068fb:	89 30                	mov    %esi,(%eax)
801068fd:	74 31                	je     80106930 <mappages+0x70>
801068ff:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106905:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106908:	b9 01 00 00 00       	mov    $0x1,%ecx
8010690d:	89 da                	mov    %ebx,%edx
8010690f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106912:	e8 29 ff ff ff       	call   80106840 <walkpgdir>
80106917:	85 c0                	test   %eax,%eax
80106919:	75 d5                	jne    801068f0 <mappages+0x30>
8010691b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010691e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106923:	5b                   	pop    %ebx
80106924:	5e                   	pop    %esi
80106925:	5f                   	pop    %edi
80106926:	5d                   	pop    %ebp
80106927:	c3                   	ret    
80106928:	90                   	nop
80106929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106930:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106933:	31 c0                	xor    %eax,%eax
80106935:	5b                   	pop    %ebx
80106936:	5e                   	pop    %esi
80106937:	5f                   	pop    %edi
80106938:	5d                   	pop    %ebp
80106939:	c3                   	ret    
8010693a:	83 ec 0c             	sub    $0xc,%esp
8010693d:	68 d0 7d 10 80       	push   $0x80107dd0
80106942:	e8 49 9a ff ff       	call   80100390 <panic>
80106947:	89 f6                	mov    %esi,%esi
80106949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106950 <deallocuvm.part.0>:
80106950:	55                   	push   %ebp
80106951:	89 e5                	mov    %esp,%ebp
80106953:	57                   	push   %edi
80106954:	56                   	push   %esi
80106955:	53                   	push   %ebx
80106956:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
8010695c:	89 c7                	mov    %eax,%edi
8010695e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106964:	83 ec 1c             	sub    $0x1c,%esp
80106967:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010696a:	39 d3                	cmp    %edx,%ebx
8010696c:	73 66                	jae    801069d4 <deallocuvm.part.0+0x84>
8010696e:	89 d6                	mov    %edx,%esi
80106970:	eb 3d                	jmp    801069af <deallocuvm.part.0+0x5f>
80106972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106978:	8b 10                	mov    (%eax),%edx
8010697a:	f6 c2 01             	test   $0x1,%dl
8010697d:	74 26                	je     801069a5 <deallocuvm.part.0+0x55>
8010697f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106985:	74 58                	je     801069df <deallocuvm.part.0+0x8f>
80106987:	83 ec 0c             	sub    $0xc,%esp
8010698a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106990:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106993:	52                   	push   %edx
80106994:	e8 b7 b9 ff ff       	call   80102350 <kfree>
80106999:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010699c:	83 c4 10             	add    $0x10,%esp
8010699f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801069a5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801069ab:	39 f3                	cmp    %esi,%ebx
801069ad:	73 25                	jae    801069d4 <deallocuvm.part.0+0x84>
801069af:	31 c9                	xor    %ecx,%ecx
801069b1:	89 da                	mov    %ebx,%edx
801069b3:	89 f8                	mov    %edi,%eax
801069b5:	e8 86 fe ff ff       	call   80106840 <walkpgdir>
801069ba:	85 c0                	test   %eax,%eax
801069bc:	75 ba                	jne    80106978 <deallocuvm.part.0+0x28>
801069be:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
801069c4:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
801069ca:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801069d0:	39 f3                	cmp    %esi,%ebx
801069d2:	72 db                	jb     801069af <deallocuvm.part.0+0x5f>
801069d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
801069d7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801069da:	5b                   	pop    %ebx
801069db:	5e                   	pop    %esi
801069dc:	5f                   	pop    %edi
801069dd:	5d                   	pop    %ebp
801069de:	c3                   	ret    
801069df:	83 ec 0c             	sub    $0xc,%esp
801069e2:	68 66 77 10 80       	push   $0x80107766
801069e7:	e8 a4 99 ff ff       	call   80100390 <panic>
801069ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801069f0 <seginit>:
801069f0:	55                   	push   %ebp
801069f1:	89 e5                	mov    %esp,%ebp
801069f3:	83 ec 18             	sub    $0x18,%esp
801069f6:	e8 85 ce ff ff       	call   80103880 <cpuid>
801069fb:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106a01:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106a06:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
80106a0a:	c7 80 d8 31 11 80 ff 	movl   $0xffff,-0x7feece28(%eax)
80106a11:	ff 00 00 
80106a14:	c7 80 dc 31 11 80 00 	movl   $0xcf9a00,-0x7feece24(%eax)
80106a1b:	9a cf 00 
80106a1e:	c7 80 e0 31 11 80 ff 	movl   $0xffff,-0x7feece20(%eax)
80106a25:	ff 00 00 
80106a28:	c7 80 e4 31 11 80 00 	movl   $0xcf9200,-0x7feece1c(%eax)
80106a2f:	92 cf 00 
80106a32:	c7 80 e8 31 11 80 ff 	movl   $0xffff,-0x7feece18(%eax)
80106a39:	ff 00 00 
80106a3c:	c7 80 ec 31 11 80 00 	movl   $0xcffa00,-0x7feece14(%eax)
80106a43:	fa cf 00 
80106a46:	c7 80 f0 31 11 80 ff 	movl   $0xffff,-0x7feece10(%eax)
80106a4d:	ff 00 00 
80106a50:	c7 80 f4 31 11 80 00 	movl   $0xcff200,-0x7feece0c(%eax)
80106a57:	f2 cf 00 
80106a5a:	05 d0 31 11 80       	add    $0x801131d0,%eax
80106a5f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106a63:	c1 e8 10             	shr    $0x10,%eax
80106a66:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
80106a6a:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106a6d:	0f 01 10             	lgdtl  (%eax)
80106a70:	c9                   	leave  
80106a71:	c3                   	ret    
80106a72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a80 <switchkvm>:
80106a80:	a1 84 61 11 80       	mov    0x80116184,%eax
80106a85:	55                   	push   %ebp
80106a86:	89 e5                	mov    %esp,%ebp
80106a88:	05 00 00 00 80       	add    $0x80000000,%eax
80106a8d:	0f 22 d8             	mov    %eax,%cr3
80106a90:	5d                   	pop    %ebp
80106a91:	c3                   	ret    
80106a92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106aa0 <switchuvm>:
80106aa0:	55                   	push   %ebp
80106aa1:	89 e5                	mov    %esp,%ebp
80106aa3:	57                   	push   %edi
80106aa4:	56                   	push   %esi
80106aa5:	53                   	push   %ebx
80106aa6:	83 ec 1c             	sub    $0x1c,%esp
80106aa9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80106aac:	85 db                	test   %ebx,%ebx
80106aae:	0f 84 cb 00 00 00    	je     80106b7f <switchuvm+0xdf>
80106ab4:	8b 43 08             	mov    0x8(%ebx),%eax
80106ab7:	85 c0                	test   %eax,%eax
80106ab9:	0f 84 da 00 00 00    	je     80106b99 <switchuvm+0xf9>
80106abf:	8b 43 04             	mov    0x4(%ebx),%eax
80106ac2:	85 c0                	test   %eax,%eax
80106ac4:	0f 84 c2 00 00 00    	je     80106b8c <switchuvm+0xec>
80106aca:	e8 d1 d9 ff ff       	call   801044a0 <pushcli>
80106acf:	e8 2c cd ff ff       	call   80103800 <mycpu>
80106ad4:	89 c6                	mov    %eax,%esi
80106ad6:	e8 25 cd ff ff       	call   80103800 <mycpu>
80106adb:	89 c7                	mov    %eax,%edi
80106add:	e8 1e cd ff ff       	call   80103800 <mycpu>
80106ae2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106ae5:	83 c7 08             	add    $0x8,%edi
80106ae8:	e8 13 cd ff ff       	call   80103800 <mycpu>
80106aed:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106af0:	83 c0 08             	add    $0x8,%eax
80106af3:	ba 67 00 00 00       	mov    $0x67,%edx
80106af8:	c1 e8 18             	shr    $0x18,%eax
80106afb:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
80106b02:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
80106b09:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
80106b0f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80106b14:	83 c1 08             	add    $0x8,%ecx
80106b17:	c1 e9 10             	shr    $0x10,%ecx
80106b1a:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80106b20:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106b25:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
80106b2c:	be 10 00 00 00       	mov    $0x10,%esi
80106b31:	e8 ca cc ff ff       	call   80103800 <mycpu>
80106b36:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
80106b3d:	e8 be cc ff ff       	call   80103800 <mycpu>
80106b42:	66 89 70 10          	mov    %si,0x10(%eax)
80106b46:	8b 73 08             	mov    0x8(%ebx),%esi
80106b49:	e8 b2 cc ff ff       	call   80103800 <mycpu>
80106b4e:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106b54:	89 70 0c             	mov    %esi,0xc(%eax)
80106b57:	e8 a4 cc ff ff       	call   80103800 <mycpu>
80106b5c:	66 89 78 6e          	mov    %di,0x6e(%eax)
80106b60:	b8 28 00 00 00       	mov    $0x28,%eax
80106b65:	0f 00 d8             	ltr    %ax
80106b68:	8b 43 04             	mov    0x4(%ebx),%eax
80106b6b:	05 00 00 00 80       	add    $0x80000000,%eax
80106b70:	0f 22 d8             	mov    %eax,%cr3
80106b73:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b76:	5b                   	pop    %ebx
80106b77:	5e                   	pop    %esi
80106b78:	5f                   	pop    %edi
80106b79:	5d                   	pop    %ebp
80106b7a:	e9 61 d9 ff ff       	jmp    801044e0 <popcli>
80106b7f:	83 ec 0c             	sub    $0xc,%esp
80106b82:	68 d6 7d 10 80       	push   $0x80107dd6
80106b87:	e8 04 98 ff ff       	call   80100390 <panic>
80106b8c:	83 ec 0c             	sub    $0xc,%esp
80106b8f:	68 01 7e 10 80       	push   $0x80107e01
80106b94:	e8 f7 97 ff ff       	call   80100390 <panic>
80106b99:	83 ec 0c             	sub    $0xc,%esp
80106b9c:	68 ec 7d 10 80       	push   $0x80107dec
80106ba1:	e8 ea 97 ff ff       	call   80100390 <panic>
80106ba6:	8d 76 00             	lea    0x0(%esi),%esi
80106ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106bb0 <inituvm>:
80106bb0:	55                   	push   %ebp
80106bb1:	89 e5                	mov    %esp,%ebp
80106bb3:	57                   	push   %edi
80106bb4:	56                   	push   %esi
80106bb5:	53                   	push   %ebx
80106bb6:	83 ec 1c             	sub    $0x1c,%esp
80106bb9:	8b 75 10             	mov    0x10(%ebp),%esi
80106bbc:	8b 45 08             	mov    0x8(%ebp),%eax
80106bbf:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106bc2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106bc8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106bcb:	77 49                	ja     80106c16 <inituvm+0x66>
80106bcd:	e8 2e b9 ff ff       	call   80102500 <kalloc>
80106bd2:	83 ec 04             	sub    $0x4,%esp
80106bd5:	89 c3                	mov    %eax,%ebx
80106bd7:	68 00 10 00 00       	push   $0x1000
80106bdc:	6a 00                	push   $0x0
80106bde:	50                   	push   %eax
80106bdf:	e8 9c da ff ff       	call   80104680 <memset>
80106be4:	58                   	pop    %eax
80106be5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106beb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106bf0:	5a                   	pop    %edx
80106bf1:	6a 06                	push   $0x6
80106bf3:	50                   	push   %eax
80106bf4:	31 d2                	xor    %edx,%edx
80106bf6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106bf9:	e8 c2 fc ff ff       	call   801068c0 <mappages>
80106bfe:	89 75 10             	mov    %esi,0x10(%ebp)
80106c01:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106c04:	83 c4 10             	add    $0x10,%esp
80106c07:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106c0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c0d:	5b                   	pop    %ebx
80106c0e:	5e                   	pop    %esi
80106c0f:	5f                   	pop    %edi
80106c10:	5d                   	pop    %ebp
80106c11:	e9 1a db ff ff       	jmp    80104730 <memmove>
80106c16:	83 ec 0c             	sub    $0xc,%esp
80106c19:	68 15 7e 10 80       	push   $0x80107e15
80106c1e:	e8 6d 97 ff ff       	call   80100390 <panic>
80106c23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c30 <loaduvm>:
80106c30:	55                   	push   %ebp
80106c31:	89 e5                	mov    %esp,%ebp
80106c33:	57                   	push   %edi
80106c34:	56                   	push   %esi
80106c35:	53                   	push   %ebx
80106c36:	83 ec 0c             	sub    $0xc,%esp
80106c39:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106c40:	0f 85 91 00 00 00    	jne    80106cd7 <loaduvm+0xa7>
80106c46:	8b 75 18             	mov    0x18(%ebp),%esi
80106c49:	31 db                	xor    %ebx,%ebx
80106c4b:	85 f6                	test   %esi,%esi
80106c4d:	75 1a                	jne    80106c69 <loaduvm+0x39>
80106c4f:	eb 6f                	jmp    80106cc0 <loaduvm+0x90>
80106c51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c58:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c5e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106c64:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106c67:	76 57                	jbe    80106cc0 <loaduvm+0x90>
80106c69:	8b 55 0c             	mov    0xc(%ebp),%edx
80106c6c:	8b 45 08             	mov    0x8(%ebp),%eax
80106c6f:	31 c9                	xor    %ecx,%ecx
80106c71:	01 da                	add    %ebx,%edx
80106c73:	e8 c8 fb ff ff       	call   80106840 <walkpgdir>
80106c78:	85 c0                	test   %eax,%eax
80106c7a:	74 4e                	je     80106cca <loaduvm+0x9a>
80106c7c:	8b 00                	mov    (%eax),%eax
80106c7e:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106c81:	bf 00 10 00 00       	mov    $0x1000,%edi
80106c86:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106c8b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106c91:	0f 46 fe             	cmovbe %esi,%edi
80106c94:	01 d9                	add    %ebx,%ecx
80106c96:	05 00 00 00 80       	add    $0x80000000,%eax
80106c9b:	57                   	push   %edi
80106c9c:	51                   	push   %ecx
80106c9d:	50                   	push   %eax
80106c9e:	ff 75 10             	pushl  0x10(%ebp)
80106ca1:	e8 fa ac ff ff       	call   801019a0 <readi>
80106ca6:	83 c4 10             	add    $0x10,%esp
80106ca9:	39 f8                	cmp    %edi,%eax
80106cab:	74 ab                	je     80106c58 <loaduvm+0x28>
80106cad:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106cb5:	5b                   	pop    %ebx
80106cb6:	5e                   	pop    %esi
80106cb7:	5f                   	pop    %edi
80106cb8:	5d                   	pop    %ebp
80106cb9:	c3                   	ret    
80106cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106cc0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cc3:	31 c0                	xor    %eax,%eax
80106cc5:	5b                   	pop    %ebx
80106cc6:	5e                   	pop    %esi
80106cc7:	5f                   	pop    %edi
80106cc8:	5d                   	pop    %ebp
80106cc9:	c3                   	ret    
80106cca:	83 ec 0c             	sub    $0xc,%esp
80106ccd:	68 2f 7e 10 80       	push   $0x80107e2f
80106cd2:	e8 b9 96 ff ff       	call   80100390 <panic>
80106cd7:	83 ec 0c             	sub    $0xc,%esp
80106cda:	68 fc 7e 10 80       	push   $0x80107efc
80106cdf:	e8 ac 96 ff ff       	call   80100390 <panic>
80106ce4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106cea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106cf0 <allocuvm>:
80106cf0:	55                   	push   %ebp
80106cf1:	89 e5                	mov    %esp,%ebp
80106cf3:	57                   	push   %edi
80106cf4:	56                   	push   %esi
80106cf5:	53                   	push   %ebx
80106cf6:	83 ec 1c             	sub    $0x1c,%esp
80106cf9:	8b 7d 10             	mov    0x10(%ebp),%edi
80106cfc:	85 ff                	test   %edi,%edi
80106cfe:	0f 88 8e 00 00 00    	js     80106d92 <allocuvm+0xa2>
80106d04:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106d07:	0f 82 93 00 00 00    	jb     80106da0 <allocuvm+0xb0>
80106d0d:	8b 45 0c             	mov    0xc(%ebp),%eax
80106d10:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106d16:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106d1c:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106d1f:	0f 86 7e 00 00 00    	jbe    80106da3 <allocuvm+0xb3>
80106d25:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106d28:	8b 7d 08             	mov    0x8(%ebp),%edi
80106d2b:	eb 42                	jmp    80106d6f <allocuvm+0x7f>
80106d2d:	8d 76 00             	lea    0x0(%esi),%esi
80106d30:	83 ec 04             	sub    $0x4,%esp
80106d33:	68 00 10 00 00       	push   $0x1000
80106d38:	6a 00                	push   $0x0
80106d3a:	50                   	push   %eax
80106d3b:	e8 40 d9 ff ff       	call   80104680 <memset>
80106d40:	58                   	pop    %eax
80106d41:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106d47:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106d4c:	5a                   	pop    %edx
80106d4d:	6a 06                	push   $0x6
80106d4f:	50                   	push   %eax
80106d50:	89 da                	mov    %ebx,%edx
80106d52:	89 f8                	mov    %edi,%eax
80106d54:	e8 67 fb ff ff       	call   801068c0 <mappages>
80106d59:	83 c4 10             	add    $0x10,%esp
80106d5c:	85 c0                	test   %eax,%eax
80106d5e:	78 50                	js     80106db0 <allocuvm+0xc0>
80106d60:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106d66:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106d69:	0f 86 81 00 00 00    	jbe    80106df0 <allocuvm+0x100>
80106d6f:	e8 8c b7 ff ff       	call   80102500 <kalloc>
80106d74:	85 c0                	test   %eax,%eax
80106d76:	89 c6                	mov    %eax,%esi
80106d78:	75 b6                	jne    80106d30 <allocuvm+0x40>
80106d7a:	83 ec 0c             	sub    $0xc,%esp
80106d7d:	68 4d 7e 10 80       	push   $0x80107e4d
80106d82:	e8 d9 98 ff ff       	call   80100660 <cprintf>
80106d87:	83 c4 10             	add    $0x10,%esp
80106d8a:	8b 45 0c             	mov    0xc(%ebp),%eax
80106d8d:	39 45 10             	cmp    %eax,0x10(%ebp)
80106d90:	77 6e                	ja     80106e00 <allocuvm+0x110>
80106d92:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d95:	31 ff                	xor    %edi,%edi
80106d97:	89 f8                	mov    %edi,%eax
80106d99:	5b                   	pop    %ebx
80106d9a:	5e                   	pop    %esi
80106d9b:	5f                   	pop    %edi
80106d9c:	5d                   	pop    %ebp
80106d9d:	c3                   	ret    
80106d9e:	66 90                	xchg   %ax,%ax
80106da0:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106da3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106da6:	89 f8                	mov    %edi,%eax
80106da8:	5b                   	pop    %ebx
80106da9:	5e                   	pop    %esi
80106daa:	5f                   	pop    %edi
80106dab:	5d                   	pop    %ebp
80106dac:	c3                   	ret    
80106dad:	8d 76 00             	lea    0x0(%esi),%esi
80106db0:	83 ec 0c             	sub    $0xc,%esp
80106db3:	68 65 7e 10 80       	push   $0x80107e65
80106db8:	e8 a3 98 ff ff       	call   80100660 <cprintf>
80106dbd:	83 c4 10             	add    $0x10,%esp
80106dc0:	8b 45 0c             	mov    0xc(%ebp),%eax
80106dc3:	39 45 10             	cmp    %eax,0x10(%ebp)
80106dc6:	76 0d                	jbe    80106dd5 <allocuvm+0xe5>
80106dc8:	89 c1                	mov    %eax,%ecx
80106dca:	8b 55 10             	mov    0x10(%ebp),%edx
80106dcd:	8b 45 08             	mov    0x8(%ebp),%eax
80106dd0:	e8 7b fb ff ff       	call   80106950 <deallocuvm.part.0>
80106dd5:	83 ec 0c             	sub    $0xc,%esp
80106dd8:	31 ff                	xor    %edi,%edi
80106dda:	56                   	push   %esi
80106ddb:	e8 70 b5 ff ff       	call   80102350 <kfree>
80106de0:	83 c4 10             	add    $0x10,%esp
80106de3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106de6:	89 f8                	mov    %edi,%eax
80106de8:	5b                   	pop    %ebx
80106de9:	5e                   	pop    %esi
80106dea:	5f                   	pop    %edi
80106deb:	5d                   	pop    %ebp
80106dec:	c3                   	ret    
80106ded:	8d 76 00             	lea    0x0(%esi),%esi
80106df0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80106df3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106df6:	5b                   	pop    %ebx
80106df7:	89 f8                	mov    %edi,%eax
80106df9:	5e                   	pop    %esi
80106dfa:	5f                   	pop    %edi
80106dfb:	5d                   	pop    %ebp
80106dfc:	c3                   	ret    
80106dfd:	8d 76 00             	lea    0x0(%esi),%esi
80106e00:	89 c1                	mov    %eax,%ecx
80106e02:	8b 55 10             	mov    0x10(%ebp),%edx
80106e05:	8b 45 08             	mov    0x8(%ebp),%eax
80106e08:	31 ff                	xor    %edi,%edi
80106e0a:	e8 41 fb ff ff       	call   80106950 <deallocuvm.part.0>
80106e0f:	eb 92                	jmp    80106da3 <allocuvm+0xb3>
80106e11:	eb 0d                	jmp    80106e20 <deallocuvm>
80106e13:	90                   	nop
80106e14:	90                   	nop
80106e15:	90                   	nop
80106e16:	90                   	nop
80106e17:	90                   	nop
80106e18:	90                   	nop
80106e19:	90                   	nop
80106e1a:	90                   	nop
80106e1b:	90                   	nop
80106e1c:	90                   	nop
80106e1d:	90                   	nop
80106e1e:	90                   	nop
80106e1f:	90                   	nop

80106e20 <deallocuvm>:
80106e20:	55                   	push   %ebp
80106e21:	89 e5                	mov    %esp,%ebp
80106e23:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e26:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106e29:	8b 45 08             	mov    0x8(%ebp),%eax
80106e2c:	39 d1                	cmp    %edx,%ecx
80106e2e:	73 10                	jae    80106e40 <deallocuvm+0x20>
80106e30:	5d                   	pop    %ebp
80106e31:	e9 1a fb ff ff       	jmp    80106950 <deallocuvm.part.0>
80106e36:	8d 76 00             	lea    0x0(%esi),%esi
80106e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106e40:	89 d0                	mov    %edx,%eax
80106e42:	5d                   	pop    %ebp
80106e43:	c3                   	ret    
80106e44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106e50 <freevm>:
80106e50:	55                   	push   %ebp
80106e51:	89 e5                	mov    %esp,%ebp
80106e53:	57                   	push   %edi
80106e54:	56                   	push   %esi
80106e55:	53                   	push   %ebx
80106e56:	83 ec 0c             	sub    $0xc,%esp
80106e59:	8b 75 08             	mov    0x8(%ebp),%esi
80106e5c:	85 f6                	test   %esi,%esi
80106e5e:	74 59                	je     80106eb9 <freevm+0x69>
80106e60:	31 c9                	xor    %ecx,%ecx
80106e62:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106e67:	89 f0                	mov    %esi,%eax
80106e69:	e8 e2 fa ff ff       	call   80106950 <deallocuvm.part.0>
80106e6e:	89 f3                	mov    %esi,%ebx
80106e70:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106e76:	eb 0f                	jmp    80106e87 <freevm+0x37>
80106e78:	90                   	nop
80106e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e80:	83 c3 04             	add    $0x4,%ebx
80106e83:	39 fb                	cmp    %edi,%ebx
80106e85:	74 23                	je     80106eaa <freevm+0x5a>
80106e87:	8b 03                	mov    (%ebx),%eax
80106e89:	a8 01                	test   $0x1,%al
80106e8b:	74 f3                	je     80106e80 <freevm+0x30>
80106e8d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106e92:	83 ec 0c             	sub    $0xc,%esp
80106e95:	83 c3 04             	add    $0x4,%ebx
80106e98:	05 00 00 00 80       	add    $0x80000000,%eax
80106e9d:	50                   	push   %eax
80106e9e:	e8 ad b4 ff ff       	call   80102350 <kfree>
80106ea3:	83 c4 10             	add    $0x10,%esp
80106ea6:	39 fb                	cmp    %edi,%ebx
80106ea8:	75 dd                	jne    80106e87 <freevm+0x37>
80106eaa:	89 75 08             	mov    %esi,0x8(%ebp)
80106ead:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106eb0:	5b                   	pop    %ebx
80106eb1:	5e                   	pop    %esi
80106eb2:	5f                   	pop    %edi
80106eb3:	5d                   	pop    %ebp
80106eb4:	e9 97 b4 ff ff       	jmp    80102350 <kfree>
80106eb9:	83 ec 0c             	sub    $0xc,%esp
80106ebc:	68 81 7e 10 80       	push   $0x80107e81
80106ec1:	e8 ca 94 ff ff       	call   80100390 <panic>
80106ec6:	8d 76 00             	lea    0x0(%esi),%esi
80106ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ed0 <setupkvm>:
80106ed0:	55                   	push   %ebp
80106ed1:	89 e5                	mov    %esp,%ebp
80106ed3:	56                   	push   %esi
80106ed4:	53                   	push   %ebx
80106ed5:	e8 26 b6 ff ff       	call   80102500 <kalloc>
80106eda:	85 c0                	test   %eax,%eax
80106edc:	89 c6                	mov    %eax,%esi
80106ede:	74 42                	je     80106f22 <setupkvm+0x52>
80106ee0:	83 ec 04             	sub    $0x4,%esp
80106ee3:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
80106ee8:	68 00 10 00 00       	push   $0x1000
80106eed:	6a 00                	push   $0x0
80106eef:	50                   	push   %eax
80106ef0:	e8 8b d7 ff ff       	call   80104680 <memset>
80106ef5:	83 c4 10             	add    $0x10,%esp
80106ef8:	8b 43 04             	mov    0x4(%ebx),%eax
80106efb:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106efe:	83 ec 08             	sub    $0x8,%esp
80106f01:	8b 13                	mov    (%ebx),%edx
80106f03:	ff 73 0c             	pushl  0xc(%ebx)
80106f06:	50                   	push   %eax
80106f07:	29 c1                	sub    %eax,%ecx
80106f09:	89 f0                	mov    %esi,%eax
80106f0b:	e8 b0 f9 ff ff       	call   801068c0 <mappages>
80106f10:	83 c4 10             	add    $0x10,%esp
80106f13:	85 c0                	test   %eax,%eax
80106f15:	78 19                	js     80106f30 <setupkvm+0x60>
80106f17:	83 c3 10             	add    $0x10,%ebx
80106f1a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106f20:	75 d6                	jne    80106ef8 <setupkvm+0x28>
80106f22:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106f25:	89 f0                	mov    %esi,%eax
80106f27:	5b                   	pop    %ebx
80106f28:	5e                   	pop    %esi
80106f29:	5d                   	pop    %ebp
80106f2a:	c3                   	ret    
80106f2b:	90                   	nop
80106f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106f30:	83 ec 0c             	sub    $0xc,%esp
80106f33:	56                   	push   %esi
80106f34:	31 f6                	xor    %esi,%esi
80106f36:	e8 15 ff ff ff       	call   80106e50 <freevm>
80106f3b:	83 c4 10             	add    $0x10,%esp
80106f3e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106f41:	89 f0                	mov    %esi,%eax
80106f43:	5b                   	pop    %ebx
80106f44:	5e                   	pop    %esi
80106f45:	5d                   	pop    %ebp
80106f46:	c3                   	ret    
80106f47:	89 f6                	mov    %esi,%esi
80106f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106f50 <kvmalloc>:
80106f50:	55                   	push   %ebp
80106f51:	89 e5                	mov    %esp,%ebp
80106f53:	83 ec 08             	sub    $0x8,%esp
80106f56:	e8 75 ff ff ff       	call   80106ed0 <setupkvm>
80106f5b:	a3 84 61 11 80       	mov    %eax,0x80116184
80106f60:	05 00 00 00 80       	add    $0x80000000,%eax
80106f65:	0f 22 d8             	mov    %eax,%cr3
80106f68:	c9                   	leave  
80106f69:	c3                   	ret    
80106f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106f70 <clearpteu>:
80106f70:	55                   	push   %ebp
80106f71:	31 c9                	xor    %ecx,%ecx
80106f73:	89 e5                	mov    %esp,%ebp
80106f75:	83 ec 08             	sub    $0x8,%esp
80106f78:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f7b:	8b 45 08             	mov    0x8(%ebp),%eax
80106f7e:	e8 bd f8 ff ff       	call   80106840 <walkpgdir>
80106f83:	85 c0                	test   %eax,%eax
80106f85:	74 05                	je     80106f8c <clearpteu+0x1c>
80106f87:	83 20 fb             	andl   $0xfffffffb,(%eax)
80106f8a:	c9                   	leave  
80106f8b:	c3                   	ret    
80106f8c:	83 ec 0c             	sub    $0xc,%esp
80106f8f:	68 92 7e 10 80       	push   $0x80107e92
80106f94:	e8 f7 93 ff ff       	call   80100390 <panic>
80106f99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106fa0 <copyuvm>:
80106fa0:	55                   	push   %ebp
80106fa1:	89 e5                	mov    %esp,%ebp
80106fa3:	57                   	push   %edi
80106fa4:	56                   	push   %esi
80106fa5:	53                   	push   %ebx
80106fa6:	83 ec 1c             	sub    $0x1c,%esp
80106fa9:	e8 22 ff ff ff       	call   80106ed0 <setupkvm>
80106fae:	85 c0                	test   %eax,%eax
80106fb0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106fb3:	0f 84 9f 00 00 00    	je     80107058 <copyuvm+0xb8>
80106fb9:	81 7d 0c 00 10 00 00 	cmpl   $0x1000,0xc(%ebp)
80106fc0:	0f 86 92 00 00 00    	jbe    80107058 <copyuvm+0xb8>
80106fc6:	bf 00 10 00 00       	mov    $0x1000,%edi
80106fcb:	eb 45                	jmp    80107012 <copyuvm+0x72>
80106fcd:	8d 76 00             	lea    0x0(%esi),%esi
80106fd0:	83 ec 04             	sub    $0x4,%esp
80106fd3:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80106fd9:	68 00 10 00 00       	push   $0x1000
80106fde:	53                   	push   %ebx
80106fdf:	50                   	push   %eax
80106fe0:	e8 4b d7 ff ff       	call   80104730 <memmove>
80106fe5:	58                   	pop    %eax
80106fe6:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106fec:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106ff1:	5a                   	pop    %edx
80106ff2:	ff 75 e4             	pushl  -0x1c(%ebp)
80106ff5:	50                   	push   %eax
80106ff6:	89 fa                	mov    %edi,%edx
80106ff8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106ffb:	e8 c0 f8 ff ff       	call   801068c0 <mappages>
80107000:	83 c4 10             	add    $0x10,%esp
80107003:	85 c0                	test   %eax,%eax
80107005:	78 61                	js     80107068 <copyuvm+0xc8>
80107007:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010700d:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80107010:	76 46                	jbe    80107058 <copyuvm+0xb8>
80107012:	8b 45 08             	mov    0x8(%ebp),%eax
80107015:	31 c9                	xor    %ecx,%ecx
80107017:	89 fa                	mov    %edi,%edx
80107019:	e8 22 f8 ff ff       	call   80106840 <walkpgdir>
8010701e:	85 c0                	test   %eax,%eax
80107020:	74 61                	je     80107083 <copyuvm+0xe3>
80107022:	8b 00                	mov    (%eax),%eax
80107024:	a8 01                	test   $0x1,%al
80107026:	74 4e                	je     80107076 <copyuvm+0xd6>
80107028:	89 c3                	mov    %eax,%ebx
8010702a:	25 ff 0f 00 00       	and    $0xfff,%eax
8010702f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80107035:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80107038:	e8 c3 b4 ff ff       	call   80102500 <kalloc>
8010703d:	85 c0                	test   %eax,%eax
8010703f:	89 c6                	mov    %eax,%esi
80107041:	75 8d                	jne    80106fd0 <copyuvm+0x30>
80107043:	83 ec 0c             	sub    $0xc,%esp
80107046:	ff 75 e0             	pushl  -0x20(%ebp)
80107049:	e8 02 fe ff ff       	call   80106e50 <freevm>
8010704e:	83 c4 10             	add    $0x10,%esp
80107051:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80107058:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010705b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010705e:	5b                   	pop    %ebx
8010705f:	5e                   	pop    %esi
80107060:	5f                   	pop    %edi
80107061:	5d                   	pop    %ebp
80107062:	c3                   	ret    
80107063:	90                   	nop
80107064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107068:	83 ec 0c             	sub    $0xc,%esp
8010706b:	56                   	push   %esi
8010706c:	e8 df b2 ff ff       	call   80102350 <kfree>
80107071:	83 c4 10             	add    $0x10,%esp
80107074:	eb cd                	jmp    80107043 <copyuvm+0xa3>
80107076:	83 ec 0c             	sub    $0xc,%esp
80107079:	68 b6 7e 10 80       	push   $0x80107eb6
8010707e:	e8 0d 93 ff ff       	call   80100390 <panic>
80107083:	83 ec 0c             	sub    $0xc,%esp
80107086:	68 9c 7e 10 80       	push   $0x80107e9c
8010708b:	e8 00 93 ff ff       	call   80100390 <panic>

80107090 <uva2ka>:
80107090:	55                   	push   %ebp
80107091:	31 c9                	xor    %ecx,%ecx
80107093:	89 e5                	mov    %esp,%ebp
80107095:	83 ec 08             	sub    $0x8,%esp
80107098:	8b 55 0c             	mov    0xc(%ebp),%edx
8010709b:	8b 45 08             	mov    0x8(%ebp),%eax
8010709e:	e8 9d f7 ff ff       	call   80106840 <walkpgdir>
801070a3:	8b 00                	mov    (%eax),%eax
801070a5:	c9                   	leave  
801070a6:	89 c2                	mov    %eax,%edx
801070a8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801070ad:	83 e2 05             	and    $0x5,%edx
801070b0:	05 00 00 00 80       	add    $0x80000000,%eax
801070b5:	83 fa 05             	cmp    $0x5,%edx
801070b8:	ba 00 00 00 00       	mov    $0x0,%edx
801070bd:	0f 45 c2             	cmovne %edx,%eax
801070c0:	c3                   	ret    
801070c1:	eb 0d                	jmp    801070d0 <copyout>
801070c3:	90                   	nop
801070c4:	90                   	nop
801070c5:	90                   	nop
801070c6:	90                   	nop
801070c7:	90                   	nop
801070c8:	90                   	nop
801070c9:	90                   	nop
801070ca:	90                   	nop
801070cb:	90                   	nop
801070cc:	90                   	nop
801070cd:	90                   	nop
801070ce:	90                   	nop
801070cf:	90                   	nop

801070d0 <copyout>:
801070d0:	55                   	push   %ebp
801070d1:	89 e5                	mov    %esp,%ebp
801070d3:	57                   	push   %edi
801070d4:	56                   	push   %esi
801070d5:	53                   	push   %ebx
801070d6:	83 ec 1c             	sub    $0x1c,%esp
801070d9:	8b 5d 14             	mov    0x14(%ebp),%ebx
801070dc:	8b 55 0c             	mov    0xc(%ebp),%edx
801070df:	8b 7d 10             	mov    0x10(%ebp),%edi
801070e2:	85 db                	test   %ebx,%ebx
801070e4:	75 40                	jne    80107126 <copyout+0x56>
801070e6:	eb 70                	jmp    80107158 <copyout+0x88>
801070e8:	90                   	nop
801070e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801070f0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801070f3:	89 f1                	mov    %esi,%ecx
801070f5:	29 d1                	sub    %edx,%ecx
801070f7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
801070fd:	39 d9                	cmp    %ebx,%ecx
801070ff:	0f 47 cb             	cmova  %ebx,%ecx
80107102:	29 f2                	sub    %esi,%edx
80107104:	83 ec 04             	sub    $0x4,%esp
80107107:	01 d0                	add    %edx,%eax
80107109:	51                   	push   %ecx
8010710a:	57                   	push   %edi
8010710b:	50                   	push   %eax
8010710c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010710f:	e8 1c d6 ff ff       	call   80104730 <memmove>
80107114:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80107117:	83 c4 10             	add    $0x10,%esp
8010711a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
80107120:	01 cf                	add    %ecx,%edi
80107122:	29 cb                	sub    %ecx,%ebx
80107124:	74 32                	je     80107158 <copyout+0x88>
80107126:	89 d6                	mov    %edx,%esi
80107128:	83 ec 08             	sub    $0x8,%esp
8010712b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010712e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80107134:	56                   	push   %esi
80107135:	ff 75 08             	pushl  0x8(%ebp)
80107138:	e8 53 ff ff ff       	call   80107090 <uva2ka>
8010713d:	83 c4 10             	add    $0x10,%esp
80107140:	85 c0                	test   %eax,%eax
80107142:	75 ac                	jne    801070f0 <copyout+0x20>
80107144:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107147:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010714c:	5b                   	pop    %ebx
8010714d:	5e                   	pop    %esi
8010714e:	5f                   	pop    %edi
8010714f:	5d                   	pop    %ebp
80107150:	c3                   	ret    
80107151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107158:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010715b:	31 c0                	xor    %eax,%eax
8010715d:	5b                   	pop    %ebx
8010715e:	5e                   	pop    %esi
8010715f:	5f                   	pop    %edi
80107160:	5d                   	pop    %ebp
80107161:	c3                   	ret    
80107162:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107170 <mprotect>:
80107170:	55                   	push   %ebp
80107171:	89 e5                	mov    %esp,%ebp
80107173:	57                   	push   %edi
80107174:	56                   	push   %esi
80107175:	53                   	push   %ebx
80107176:	83 ec 0c             	sub    $0xc,%esp
80107179:	8b 75 0c             	mov    0xc(%ebp),%esi
8010717c:	e8 1f c7 ff ff       	call   801038a0 <myproc>
80107181:	85 f6                	test   %esi,%esi
80107183:	0f 8e 8c 00 00 00    	jle    80107215 <mprotect+0xa5>
80107189:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010718c:	c1 e6 0c             	shl    $0xc,%esi
8010718f:	89 c7                	mov    %eax,%edi
80107191:	01 de                	add    %ebx,%esi
80107193:	3b 30                	cmp    (%eax),%esi
80107195:	77 7e                	ja     80107215 <mprotect+0xa5>
80107197:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
8010719d:	0f 85 89 00 00 00    	jne    8010722c <mprotect+0xbc>
801071a3:	39 f3                	cmp    %esi,%ebx
801071a5:	7c 35                	jl     801071dc <mprotect+0x6c>
801071a7:	eb 57                	jmp    80107200 <mprotect+0x90>
801071a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801071b0:	8b 10                	mov    (%eax),%edx
801071b2:	89 d1                	mov    %edx,%ecx
801071b4:	83 e1 05             	and    $0x5,%ecx
801071b7:	83 f9 05             	cmp    $0x5,%ecx
801071ba:	75 30                	jne    801071ec <mprotect+0x7c>
801071bc:	83 ec 08             	sub    $0x8,%esp
801071bf:	83 e2 fd             	and    $0xfffffffd,%edx
801071c2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801071c8:	89 10                	mov    %edx,(%eax)
801071ca:	50                   	push   %eax
801071cb:	68 ec 7e 10 80       	push   $0x80107eec
801071d0:	e8 8b 94 ff ff       	call   80100660 <cprintf>
801071d5:	83 c4 10             	add    $0x10,%esp
801071d8:	39 de                	cmp    %ebx,%esi
801071da:	7e 24                	jle    80107200 <mprotect+0x90>
801071dc:	8b 47 04             	mov    0x4(%edi),%eax
801071df:	31 c9                	xor    %ecx,%ecx
801071e1:	89 da                	mov    %ebx,%edx
801071e3:	e8 58 f6 ff ff       	call   80106840 <walkpgdir>
801071e8:	85 c0                	test   %eax,%eax
801071ea:	75 c4                	jne    801071b0 <mprotect+0x40>
801071ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801071f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071f4:	5b                   	pop    %ebx
801071f5:	5e                   	pop    %esi
801071f6:	5f                   	pop    %edi
801071f7:	5d                   	pop    %ebp
801071f8:	c3                   	ret    
801071f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107200:	8b 47 04             	mov    0x4(%edi),%eax
80107203:	05 00 00 00 80       	add    $0x80000000,%eax
80107208:	0f 22 d8             	mov    %eax,%cr3
8010720b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010720e:	31 c0                	xor    %eax,%eax
80107210:	5b                   	pop    %ebx
80107211:	5e                   	pop    %esi
80107212:	5f                   	pop    %edi
80107213:	5d                   	pop    %ebp
80107214:	c3                   	ret    
80107215:	83 ec 0c             	sub    $0xc,%esp
80107218:	68 d0 7e 10 80       	push   $0x80107ed0
8010721d:	e8 3e 94 ff ff       	call   80100660 <cprintf>
80107222:	83 c4 10             	add    $0x10,%esp
80107225:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010722a:	eb c5                	jmp    801071f1 <mprotect+0x81>
8010722c:	83 ec 08             	sub    $0x8,%esp
8010722f:	ff 75 08             	pushl  0x8(%ebp)
80107232:	68 dc 7e 10 80       	push   $0x80107edc
80107237:	e8 24 94 ff ff       	call   80100660 <cprintf>
8010723c:	83 c4 10             	add    $0x10,%esp
8010723f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107244:	eb ab                	jmp    801071f1 <mprotect+0x81>
80107246:	8d 76 00             	lea    0x0(%esi),%esi
80107249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107250 <munprotect>:
80107250:	55                   	push   %ebp
80107251:	89 e5                	mov    %esp,%ebp
80107253:	57                   	push   %edi
80107254:	56                   	push   %esi
80107255:	53                   	push   %ebx
80107256:	83 ec 0c             	sub    $0xc,%esp
80107259:	8b 75 0c             	mov    0xc(%ebp),%esi
8010725c:	e8 3f c6 ff ff       	call   801038a0 <myproc>
80107261:	85 f6                	test   %esi,%esi
80107263:	0f 8e 8c 00 00 00    	jle    801072f5 <munprotect+0xa5>
80107269:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010726c:	c1 e6 0c             	shl    $0xc,%esi
8010726f:	89 c7                	mov    %eax,%edi
80107271:	01 de                	add    %ebx,%esi
80107273:	3b 30                	cmp    (%eax),%esi
80107275:	77 7e                	ja     801072f5 <munprotect+0xa5>
80107277:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
8010727d:	0f 85 89 00 00 00    	jne    8010730c <munprotect+0xbc>
80107283:	39 f3                	cmp    %esi,%ebx
80107285:	7c 35                	jl     801072bc <munprotect+0x6c>
80107287:	eb 57                	jmp    801072e0 <munprotect+0x90>
80107289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107290:	8b 10                	mov    (%eax),%edx
80107292:	89 d1                	mov    %edx,%ecx
80107294:	83 e1 05             	and    $0x5,%ecx
80107297:	83 f9 05             	cmp    $0x5,%ecx
8010729a:	75 30                	jne    801072cc <munprotect+0x7c>
8010729c:	83 ec 08             	sub    $0x8,%esp
8010729f:	83 ca 02             	or     $0x2,%edx
801072a2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801072a8:	89 10                	mov    %edx,(%eax)
801072aa:	50                   	push   %eax
801072ab:	68 ec 7e 10 80       	push   $0x80107eec
801072b0:	e8 ab 93 ff ff       	call   80100660 <cprintf>
801072b5:	83 c4 10             	add    $0x10,%esp
801072b8:	39 de                	cmp    %ebx,%esi
801072ba:	7e 24                	jle    801072e0 <munprotect+0x90>
801072bc:	8b 47 04             	mov    0x4(%edi),%eax
801072bf:	31 c9                	xor    %ecx,%ecx
801072c1:	89 da                	mov    %ebx,%edx
801072c3:	e8 78 f5 ff ff       	call   80106840 <walkpgdir>
801072c8:	85 c0                	test   %eax,%eax
801072ca:	75 c4                	jne    80107290 <munprotect+0x40>
801072cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801072d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801072d4:	5b                   	pop    %ebx
801072d5:	5e                   	pop    %esi
801072d6:	5f                   	pop    %edi
801072d7:	5d                   	pop    %ebp
801072d8:	c3                   	ret    
801072d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801072e0:	8b 47 04             	mov    0x4(%edi),%eax
801072e3:	05 00 00 00 80       	add    $0x80000000,%eax
801072e8:	0f 22 d8             	mov    %eax,%cr3
801072eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801072ee:	31 c0                	xor    %eax,%eax
801072f0:	5b                   	pop    %ebx
801072f1:	5e                   	pop    %esi
801072f2:	5f                   	pop    %edi
801072f3:	5d                   	pop    %ebp
801072f4:	c3                   	ret    
801072f5:	83 ec 0c             	sub    $0xc,%esp
801072f8:	68 d0 7e 10 80       	push   $0x80107ed0
801072fd:	e8 5e 93 ff ff       	call   80100660 <cprintf>
80107302:	83 c4 10             	add    $0x10,%esp
80107305:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010730a:	eb c5                	jmp    801072d1 <munprotect+0x81>
8010730c:	83 ec 08             	sub    $0x8,%esp
8010730f:	ff 75 08             	pushl  0x8(%ebp)
80107312:	68 dc 7e 10 80       	push   $0x80107edc
80107317:	e8 44 93 ff ff       	call   80100660 <cprintf>
8010731c:	83 c4 10             	add    $0x10,%esp
8010731f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107324:	eb ab                	jmp    801072d1 <munprotect+0x81>
80107326:	66 90                	xchg   %ax,%ax
80107328:	66 90                	xchg   %ax,%ax
8010732a:	66 90                	xchg   %ax,%ax
8010732c:	66 90                	xchg   %ax,%ax
8010732e:	66 90                	xchg   %ax,%ax

80107330 <sgenrand>:
80107330:	55                   	push   %ebp
80107331:	b8 e4 a5 10 80       	mov    $0x8010a5e4,%eax
80107336:	b9 9c af 10 80       	mov    $0x8010af9c,%ecx
8010733b:	89 e5                	mov    %esp,%ebp
8010733d:	8b 55 08             	mov    0x8(%ebp),%edx
80107340:	89 15 e0 a5 10 80    	mov    %edx,0x8010a5e0
80107346:	eb 0b                	jmp    80107353 <sgenrand+0x23>
80107348:	90                   	nop
80107349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107350:	83 c0 04             	add    $0x4,%eax
80107353:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
80107359:	39 c1                	cmp    %eax,%ecx
8010735b:	89 10                	mov    %edx,(%eax)
8010735d:	75 f1                	jne    80107350 <sgenrand+0x20>
8010735f:	c7 05 60 a4 10 80 70 	movl   $0x270,0x8010a460
80107366:	02 00 00 
80107369:	5d                   	pop    %ebp
8010736a:	c3                   	ret    
8010736b:	90                   	nop
8010736c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107370 <genrand>:
80107370:	a1 60 a4 10 80       	mov    0x8010a460,%eax
80107375:	55                   	push   %ebp
80107376:	89 e5                	mov    %esp,%ebp
80107378:	56                   	push   %esi
80107379:	53                   	push   %ebx
8010737a:	3d 6f 02 00 00       	cmp    $0x26f,%eax
8010737f:	0f 8e f9 00 00 00    	jle    8010747e <genrand+0x10e>
80107385:	3d 71 02 00 00       	cmp    $0x271,%eax
8010738a:	0f 84 fa 00 00 00    	je     8010748a <genrand+0x11a>
80107390:	ba e0 a5 10 80       	mov    $0x8010a5e0,%edx
80107395:	bb 6c a9 10 80       	mov    $0x8010a96c,%ebx
8010739a:	89 d1                	mov    %edx,%ecx
8010739c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801073a0:	8b 01                	mov    (%ecx),%eax
801073a2:	8b 71 04             	mov    0x4(%ecx),%esi
801073a5:	83 c1 04             	add    $0x4,%ecx
801073a8:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
801073ae:	25 00 00 00 80       	and    $0x80000000,%eax
801073b3:	09 f0                	or     %esi,%eax
801073b5:	89 c6                	mov    %eax,%esi
801073b7:	83 e0 01             	and    $0x1,%eax
801073ba:	d1 ee                	shr    %esi
801073bc:	33 b1 30 06 00 00    	xor    0x630(%ecx),%esi
801073c2:	33 34 85 20 7f 10 80 	xor    -0x7fef80e0(,%eax,4),%esi
801073c9:	89 71 fc             	mov    %esi,-0x4(%ecx)
801073cc:	39 cb                	cmp    %ecx,%ebx
801073ce:	75 d0                	jne    801073a0 <genrand+0x30>
801073d0:	b9 10 ac 10 80       	mov    $0x8010ac10,%ecx
801073d5:	8d 76 00             	lea    0x0(%esi),%esi
801073d8:	8b 82 8c 03 00 00    	mov    0x38c(%edx),%eax
801073de:	8b 9a 90 03 00 00    	mov    0x390(%edx),%ebx
801073e4:	83 c2 04             	add    $0x4,%edx
801073e7:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
801073ed:	25 00 00 00 80       	and    $0x80000000,%eax
801073f2:	09 d8                	or     %ebx,%eax
801073f4:	89 c3                	mov    %eax,%ebx
801073f6:	83 e0 01             	and    $0x1,%eax
801073f9:	d1 eb                	shr    %ebx
801073fb:	33 5a fc             	xor    -0x4(%edx),%ebx
801073fe:	33 1c 85 20 7f 10 80 	xor    -0x7fef80e0(,%eax,4),%ebx
80107405:	89 9a 88 03 00 00    	mov    %ebx,0x388(%edx)
8010740b:	39 d1                	cmp    %edx,%ecx
8010740d:	75 c9                	jne    801073d8 <genrand+0x68>
8010740f:	a1 e0 a5 10 80       	mov    0x8010a5e0,%eax
80107414:	8b 0d 9c af 10 80    	mov    0x8010af9c,%ecx
8010741a:	89 c2                	mov    %eax,%edx
8010741c:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
80107422:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
80107428:	09 d1                	or     %edx,%ecx
8010742a:	89 ca                	mov    %ecx,%edx
8010742c:	83 e1 01             	and    $0x1,%ecx
8010742f:	d1 ea                	shr    %edx
80107431:	33 15 10 ac 10 80    	xor    0x8010ac10,%edx
80107437:	33 14 8d 20 7f 10 80 	xor    -0x7fef80e0(,%ecx,4),%edx
8010743e:	89 15 9c af 10 80    	mov    %edx,0x8010af9c
80107444:	ba 01 00 00 00       	mov    $0x1,%edx
80107449:	89 15 60 a4 10 80    	mov    %edx,0x8010a460
8010744f:	89 c2                	mov    %eax,%edx
80107451:	c1 ea 0b             	shr    $0xb,%edx
80107454:	31 c2                	xor    %eax,%edx
80107456:	89 d0                	mov    %edx,%eax
80107458:	c1 e0 07             	shl    $0x7,%eax
8010745b:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
80107460:	31 c2                	xor    %eax,%edx
80107462:	89 d0                	mov    %edx,%eax
80107464:	c1 e0 0f             	shl    $0xf,%eax
80107467:	25 00 00 c6 ef       	and    $0xefc60000,%eax
8010746c:	31 d0                	xor    %edx,%eax
8010746e:	89 c2                	mov    %eax,%edx
80107470:	c1 ea 12             	shr    $0x12,%edx
80107473:	31 d0                	xor    %edx,%eax
80107475:	5b                   	pop    %ebx
80107476:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
8010747b:	5e                   	pop    %esi
8010747c:	5d                   	pop    %ebp
8010747d:	c3                   	ret    
8010747e:	8d 50 01             	lea    0x1(%eax),%edx
80107481:	8b 04 85 e0 a5 10 80 	mov    -0x7fef5a20(,%eax,4),%eax
80107488:	eb bf                	jmp    80107449 <genrand+0xd9>
8010748a:	c7 05 e0 a5 10 80 05 	movl   $0x1105,0x8010a5e0
80107491:	11 00 00 
80107494:	b8 e4 a5 10 80       	mov    $0x8010a5e4,%eax
80107499:	b9 9c af 10 80       	mov    $0x8010af9c,%ecx
8010749e:	ba 05 11 00 00       	mov    $0x1105,%edx
801074a3:	eb 06                	jmp    801074ab <genrand+0x13b>
801074a5:	8d 76 00             	lea    0x0(%esi),%esi
801074a8:	83 c0 04             	add    $0x4,%eax
801074ab:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
801074b1:	39 c1                	cmp    %eax,%ecx
801074b3:	89 10                	mov    %edx,(%eax)
801074b5:	75 f1                	jne    801074a8 <genrand+0x138>
801074b7:	e9 d4 fe ff ff       	jmp    80107390 <genrand+0x20>
801074bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801074c0 <random_at_most>:
801074c0:	55                   	push   %ebp
801074c1:	31 d2                	xor    %edx,%edx
801074c3:	89 e5                	mov    %esp,%ebp
801074c5:	56                   	push   %esi
801074c6:	53                   	push   %ebx
801074c7:	8b 45 08             	mov    0x8(%ebp),%eax
801074ca:	bb 00 00 00 80       	mov    $0x80000000,%ebx
801074cf:	8d 48 01             	lea    0x1(%eax),%ecx
801074d2:	89 d8                	mov    %ebx,%eax
801074d4:	f7 f1                	div    %ecx
801074d6:	89 c6                	mov    %eax,%esi
801074d8:	29 d3                	sub    %edx,%ebx
801074da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801074e0:	e8 8b fe ff ff       	call   80107370 <genrand>
801074e5:	39 d8                	cmp    %ebx,%eax
801074e7:	73 f7                	jae    801074e0 <random_at_most+0x20>
801074e9:	31 d2                	xor    %edx,%edx
801074eb:	f7 f6                	div    %esi
801074ed:	5b                   	pop    %ebx
801074ee:	5e                   	pop    %esi
801074ef:	5d                   	pop    %ebp
801074f0:	c3                   	ret    
