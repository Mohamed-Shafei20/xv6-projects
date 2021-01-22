
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  forktest();
  11:	e8 3a 00 00 00       	call   50 <forktest>
  exit();
  16:	e8 13 05 00 00       	call   52e <exit>
  1b:	66 90                	xchg   %ax,%ax
  1d:	66 90                	xchg   %ax,%ax
  1f:	90                   	nop

00000020 <printf>:
{
  20:	55                   	push   %ebp
  21:	89 e5                	mov    %esp,%ebp
  23:	53                   	push   %ebx
  24:	83 ec 10             	sub    $0x10,%esp
  27:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  2a:	53                   	push   %ebx
  2b:	e8 a0 01 00 00       	call   1d0 <strlen>
  30:	83 c4 0c             	add    $0xc,%esp
  33:	50                   	push   %eax
  34:	53                   	push   %ebx
  35:	ff 75 08             	pushl  0x8(%ebp)
  38:	e8 11 05 00 00       	call   54e <write>
}
  3d:	83 c4 10             	add    $0x10,%esp
  40:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  43:	c9                   	leave  
  44:	c3                   	ret    
  45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000050 <forktest>:
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	53                   	push   %ebx
  for(n=0; n<N; n++){
  54:	31 db                	xor    %ebx,%ebx
{
  56:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  59:	68 e0 05 00 00       	push   $0x5e0
  5e:	e8 6d 01 00 00       	call   1d0 <strlen>
  63:	83 c4 0c             	add    $0xc,%esp
  66:	50                   	push   %eax
  67:	68 e0 05 00 00       	push   $0x5e0
  6c:	6a 01                	push   $0x1
  6e:	e8 db 04 00 00       	call   54e <write>
  73:	83 c4 10             	add    $0x10,%esp
  76:	eb 19                	jmp    91 <forktest+0x41>
  78:	90                   	nop
  79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
  80:	0f 84 7c 00 00 00    	je     102 <forktest+0xb2>
  for(n=0; n<N; n++){
  86:	83 c3 01             	add    $0x1,%ebx
  89:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  8f:	74 4f                	je     e0 <forktest+0x90>
    pid = fork();
  91:	e8 90 04 00 00       	call   526 <fork>
    if(pid < 0)
  96:	85 c0                	test   %eax,%eax
  98:	79 e6                	jns    80 <forktest+0x30>
  for(; n > 0; n--){
  9a:	85 db                	test   %ebx,%ebx
  9c:	74 10                	je     ae <forktest+0x5e>
  9e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  a0:	e8 91 04 00 00       	call   536 <wait>
  a5:	85 c0                	test   %eax,%eax
  a7:	78 5e                	js     107 <forktest+0xb7>
  for(; n > 0; n--){
  a9:	83 eb 01             	sub    $0x1,%ebx
  ac:	75 f2                	jne    a0 <forktest+0x50>
  if(wait() != -1){
  ae:	e8 83 04 00 00       	call   536 <wait>
  b3:	83 f8 ff             	cmp    $0xffffffff,%eax
  b6:	75 71                	jne    129 <forktest+0xd9>
  write(fd, s, strlen(s));
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	68 12 06 00 00       	push   $0x612
  c0:	e8 0b 01 00 00       	call   1d0 <strlen>
  c5:	83 c4 0c             	add    $0xc,%esp
  c8:	50                   	push   %eax
  c9:	68 12 06 00 00       	push   $0x612
  ce:	6a 01                	push   $0x1
  d0:	e8 79 04 00 00       	call   54e <write>
}
  d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d8:	c9                   	leave  
  d9:	c3                   	ret    
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, s, strlen(s));
  e0:	83 ec 0c             	sub    $0xc,%esp
  e3:	68 20 06 00 00       	push   $0x620
  e8:	e8 e3 00 00 00       	call   1d0 <strlen>
  ed:	83 c4 0c             	add    $0xc,%esp
  f0:	50                   	push   %eax
  f1:	68 20 06 00 00       	push   $0x620
  f6:	6a 01                	push   $0x1
  f8:	e8 51 04 00 00       	call   54e <write>
    exit();
  fd:	e8 2c 04 00 00       	call   52e <exit>
      exit();
 102:	e8 27 04 00 00       	call   52e <exit>
  write(fd, s, strlen(s));
 107:	83 ec 0c             	sub    $0xc,%esp
 10a:	68 eb 05 00 00       	push   $0x5eb
 10f:	e8 bc 00 00 00       	call   1d0 <strlen>
 114:	83 c4 0c             	add    $0xc,%esp
 117:	50                   	push   %eax
 118:	68 eb 05 00 00       	push   $0x5eb
 11d:	6a 01                	push   $0x1
 11f:	e8 2a 04 00 00       	call   54e <write>
      exit();
 124:	e8 05 04 00 00       	call   52e <exit>
  write(fd, s, strlen(s));
 129:	83 ec 0c             	sub    $0xc,%esp
 12c:	68 ff 05 00 00       	push   $0x5ff
 131:	e8 9a 00 00 00       	call   1d0 <strlen>
 136:	83 c4 0c             	add    $0xc,%esp
 139:	50                   	push   %eax
 13a:	68 ff 05 00 00       	push   $0x5ff
 13f:	6a 01                	push   $0x1
 141:	e8 08 04 00 00       	call   54e <write>
    exit();
 146:	e8 e3 03 00 00       	call   52e <exit>
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 15a:	89 c2                	mov    %eax,%edx
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 160:	83 c1 01             	add    $0x1,%ecx
 163:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 167:	83 c2 01             	add    $0x1,%edx
 16a:	84 db                	test   %bl,%bl
 16c:	88 5a ff             	mov    %bl,-0x1(%edx)
 16f:	75 ef                	jne    160 <strcpy+0x10>
    ;
  return os;
}
 171:	5b                   	pop    %ebx
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 17a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	8b 55 08             	mov    0x8(%ebp),%edx
 187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 18a:	0f b6 02             	movzbl (%edx),%eax
 18d:	0f b6 19             	movzbl (%ecx),%ebx
 190:	84 c0                	test   %al,%al
 192:	75 1c                	jne    1b0 <strcmp+0x30>
 194:	eb 2a                	jmp    1c0 <strcmp+0x40>
 196:	8d 76 00             	lea    0x0(%esi),%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1a0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1a3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1a6:	83 c1 01             	add    $0x1,%ecx
 1a9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 1ac:	84 c0                	test   %al,%al
 1ae:	74 10                	je     1c0 <strcmp+0x40>
 1b0:	38 d8                	cmp    %bl,%al
 1b2:	74 ec                	je     1a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1b4:	29 d8                	sub    %ebx,%eax
}
 1b6:	5b                   	pop    %ebx
 1b7:	5d                   	pop    %ebp
 1b8:	c3                   	ret    
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1c2:	29 d8                	sub    %ebx,%eax
}
 1c4:	5b                   	pop    %ebx
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	89 f6                	mov    %esi,%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1d6:	80 39 00             	cmpb   $0x0,(%ecx)
 1d9:	74 15                	je     1f0 <strlen+0x20>
 1db:	31 d2                	xor    %edx,%edx
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	83 c2 01             	add    $0x1,%edx
 1e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1e7:	89 d0                	mov    %edx,%eax
 1e9:	75 f5                	jne    1e0 <strlen+0x10>
    ;
  return n;
}
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 1f0:	31 c0                	xor    %eax,%eax
}
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    
 1f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld    
 210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 212:	89 d0                	mov    %edx,%eax
 214:	5f                   	pop    %edi
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    
 217:	89 f6                	mov    %esi,%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	74 1d                	je     24e <strchr+0x2e>
    if(*s == c)
 231:	38 d3                	cmp    %dl,%bl
 233:	89 d9                	mov    %ebx,%ecx
 235:	75 0d                	jne    244 <strchr+0x24>
 237:	eb 17                	jmp    250 <strchr+0x30>
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 240:	38 ca                	cmp    %cl,%dl
 242:	74 0c                	je     250 <strchr+0x30>
  for(; *s; s++)
 244:	83 c0 01             	add    $0x1,%eax
 247:	0f b6 10             	movzbl (%eax),%edx
 24a:	84 d2                	test   %dl,%dl
 24c:	75 f2                	jne    240 <strchr+0x20>
      return (char*)s;
  return 0;
 24e:	31 c0                	xor    %eax,%eax
}
 250:	5b                   	pop    %ebx
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    
 253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
 265:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 266:	31 f6                	xor    %esi,%esi
 268:	89 f3                	mov    %esi,%ebx
{
 26a:	83 ec 1c             	sub    $0x1c,%esp
 26d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 270:	eb 2f                	jmp    2a1 <gets+0x41>
 272:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 278:	8d 45 e7             	lea    -0x19(%ebp),%eax
 27b:	83 ec 04             	sub    $0x4,%esp
 27e:	6a 01                	push   $0x1
 280:	50                   	push   %eax
 281:	6a 00                	push   $0x0
 283:	e8 be 02 00 00       	call   546 <read>
    if(cc < 1)
 288:	83 c4 10             	add    $0x10,%esp
 28b:	85 c0                	test   %eax,%eax
 28d:	7e 1c                	jle    2ab <gets+0x4b>
      break;
    buf[i++] = c;
 28f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 293:	83 c7 01             	add    $0x1,%edi
 296:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 299:	3c 0a                	cmp    $0xa,%al
 29b:	74 23                	je     2c0 <gets+0x60>
 29d:	3c 0d                	cmp    $0xd,%al
 29f:	74 1f                	je     2c0 <gets+0x60>
  for(i=0; i+1 < max; ){
 2a1:	83 c3 01             	add    $0x1,%ebx
 2a4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2a7:	89 fe                	mov    %edi,%esi
 2a9:	7c cd                	jl     278 <gets+0x18>
 2ab:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2ad:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2b0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2b6:	5b                   	pop    %ebx
 2b7:	5e                   	pop    %esi
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    
 2bb:	90                   	nop
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c0:	8b 75 08             	mov    0x8(%ebp),%esi
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
 2c6:	01 de                	add    %ebx,%esi
 2c8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2ca:	c6 03 00             	movb   $0x0,(%ebx)
}
 2cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d0:	5b                   	pop    %ebx
 2d1:	5e                   	pop    %esi
 2d2:	5f                   	pop    %edi
 2d3:	5d                   	pop    %ebp
 2d4:	c3                   	ret    
 2d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	56                   	push   %esi
 2e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e5:	83 ec 08             	sub    $0x8,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	ff 75 08             	pushl  0x8(%ebp)
 2ed:	e8 7c 02 00 00       	call   56e <open>
  if(fd < 0)
 2f2:	83 c4 10             	add    $0x10,%esp
 2f5:	85 c0                	test   %eax,%eax
 2f7:	78 27                	js     320 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2f9:	83 ec 08             	sub    $0x8,%esp
 2fc:	ff 75 0c             	pushl  0xc(%ebp)
 2ff:	89 c3                	mov    %eax,%ebx
 301:	50                   	push   %eax
 302:	e8 7f 02 00 00       	call   586 <fstat>
  close(fd);
 307:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 30a:	89 c6                	mov    %eax,%esi
  close(fd);
 30c:	e8 45 02 00 00       	call   556 <close>
  return r;
 311:	83 c4 10             	add    $0x10,%esp
}
 314:	8d 65 f8             	lea    -0x8(%ebp),%esp
 317:	89 f0                	mov    %esi,%eax
 319:	5b                   	pop    %ebx
 31a:	5e                   	pop    %esi
 31b:	5d                   	pop    %ebp
 31c:	c3                   	ret    
 31d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 320:	be ff ff ff ff       	mov    $0xffffffff,%esi
 325:	eb ed                	jmp    314 <stat+0x34>
 327:	89 f6                	mov    %esi,%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <atoi>:

int
atoi(const char *s)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 337:	0f be 11             	movsbl (%ecx),%edx
 33a:	8d 42 d0             	lea    -0x30(%edx),%eax
 33d:	3c 09                	cmp    $0x9,%al
  n = 0;
 33f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 344:	77 1f                	ja     365 <atoi+0x35>
 346:	8d 76 00             	lea    0x0(%esi),%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 350:	8d 04 80             	lea    (%eax,%eax,4),%eax
 353:	83 c1 01             	add    $0x1,%ecx
 356:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 35a:	0f be 11             	movsbl (%ecx),%edx
 35d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 360:	80 fb 09             	cmp    $0x9,%bl
 363:	76 eb                	jbe    350 <atoi+0x20>
  return n;
}
 365:	5b                   	pop    %ebx
 366:	5d                   	pop    %ebp
 367:	c3                   	ret    
 368:	90                   	nop
 369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000370 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	8b 5d 10             	mov    0x10(%ebp),%ebx
 378:	8b 45 08             	mov    0x8(%ebp),%eax
 37b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 37e:	85 db                	test   %ebx,%ebx
 380:	7e 14                	jle    396 <memmove+0x26>
 382:	31 d2                	xor    %edx,%edx
 384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 388:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 38c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 38f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 392:	39 d3                	cmp    %edx,%ebx
 394:	75 f2                	jne    388 <memmove+0x18>
  return vdst;
}
 396:	5b                   	pop    %ebx
 397:	5e                   	pop    %esi
 398:	5d                   	pop    %ebp
 399:	c3                   	ret    
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 3a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3a1:	a1 bc 08 00 00       	mov    0x8bc,%eax
{
 3a6:	89 e5                	mov    %esp,%ebp
 3a8:	57                   	push   %edi
 3a9:	56                   	push   %esi
 3aa:	53                   	push   %ebx
 3ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 3ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 3b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3b8:	39 c8                	cmp    %ecx,%eax
 3ba:	8b 10                	mov    (%eax),%edx
 3bc:	73 32                	jae    3f0 <free+0x50>
 3be:	39 d1                	cmp    %edx,%ecx
 3c0:	72 04                	jb     3c6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3c2:	39 d0                	cmp    %edx,%eax
 3c4:	72 32                	jb     3f8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 3c6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 3c9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 3cc:	39 fa                	cmp    %edi,%edx
 3ce:	74 30                	je     400 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 3d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3d3:	8b 50 04             	mov    0x4(%eax),%edx
 3d6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3d9:	39 f1                	cmp    %esi,%ecx
 3db:	74 3a                	je     417 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 3dd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 3df:	a3 bc 08 00 00       	mov    %eax,0x8bc
}
 3e4:	5b                   	pop    %ebx
 3e5:	5e                   	pop    %esi
 3e6:	5f                   	pop    %edi
 3e7:	5d                   	pop    %ebp
 3e8:	c3                   	ret    
 3e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3f0:	39 d0                	cmp    %edx,%eax
 3f2:	72 04                	jb     3f8 <free+0x58>
 3f4:	39 d1                	cmp    %edx,%ecx
 3f6:	72 ce                	jb     3c6 <free+0x26>
{
 3f8:	89 d0                	mov    %edx,%eax
 3fa:	eb bc                	jmp    3b8 <free+0x18>
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 400:	03 72 04             	add    0x4(%edx),%esi
 403:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 406:	8b 10                	mov    (%eax),%edx
 408:	8b 12                	mov    (%edx),%edx
 40a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 40d:	8b 50 04             	mov    0x4(%eax),%edx
 410:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 413:	39 f1                	cmp    %esi,%ecx
 415:	75 c6                	jne    3dd <free+0x3d>
    p->s.size += bp->s.size;
 417:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 41a:	a3 bc 08 00 00       	mov    %eax,0x8bc
    p->s.size += bp->s.size;
 41f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 422:	8b 53 f8             	mov    -0x8(%ebx),%edx
 425:	89 10                	mov    %edx,(%eax)
}
 427:	5b                   	pop    %ebx
 428:	5e                   	pop    %esi
 429:	5f                   	pop    %edi
 42a:	5d                   	pop    %ebp
 42b:	c3                   	ret    
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000430 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 439:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 43c:	8b 15 bc 08 00 00    	mov    0x8bc,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 442:	8d 78 07             	lea    0x7(%eax),%edi
 445:	c1 ef 03             	shr    $0x3,%edi
 448:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 44b:	85 d2                	test   %edx,%edx
 44d:	0f 84 9d 00 00 00    	je     4f0 <malloc+0xc0>
 453:	8b 02                	mov    (%edx),%eax
 455:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 458:	39 cf                	cmp    %ecx,%edi
 45a:	76 6c                	jbe    4c8 <malloc+0x98>
 45c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 462:	bb 00 10 00 00       	mov    $0x1000,%ebx
 467:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 46a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 471:	eb 0e                	jmp    481 <malloc+0x51>
 473:	90                   	nop
 474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 478:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 47a:	8b 48 04             	mov    0x4(%eax),%ecx
 47d:	39 f9                	cmp    %edi,%ecx
 47f:	73 47                	jae    4c8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 481:	39 05 bc 08 00 00    	cmp    %eax,0x8bc
 487:	89 c2                	mov    %eax,%edx
 489:	75 ed                	jne    478 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 48b:	83 ec 0c             	sub    $0xc,%esp
 48e:	56                   	push   %esi
 48f:	e8 22 01 00 00       	call   5b6 <sbrk>
  if(p == (char*)-1)
 494:	83 c4 10             	add    $0x10,%esp
 497:	83 f8 ff             	cmp    $0xffffffff,%eax
 49a:	74 1c                	je     4b8 <malloc+0x88>
  hp->s.size = nu;
 49c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 49f:	83 ec 0c             	sub    $0xc,%esp
 4a2:	83 c0 08             	add    $0x8,%eax
 4a5:	50                   	push   %eax
 4a6:	e8 f5 fe ff ff       	call   3a0 <free>
  return freep;
 4ab:	8b 15 bc 08 00 00    	mov    0x8bc,%edx
      if((p = morecore(nunits)) == 0)
 4b1:	83 c4 10             	add    $0x10,%esp
 4b4:	85 d2                	test   %edx,%edx
 4b6:	75 c0                	jne    478 <malloc+0x48>
        return 0;
  }
}
 4b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 4bb:	31 c0                	xor    %eax,%eax
}
 4bd:	5b                   	pop    %ebx
 4be:	5e                   	pop    %esi
 4bf:	5f                   	pop    %edi
 4c0:	5d                   	pop    %ebp
 4c1:	c3                   	ret    
 4c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 4c8:	39 cf                	cmp    %ecx,%edi
 4ca:	74 54                	je     520 <malloc+0xf0>
        p->s.size -= nunits;
 4cc:	29 f9                	sub    %edi,%ecx
 4ce:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 4d1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 4d4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 4d7:	89 15 bc 08 00 00    	mov    %edx,0x8bc
}
 4dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 4e0:	83 c0 08             	add    $0x8,%eax
}
 4e3:	5b                   	pop    %ebx
 4e4:	5e                   	pop    %esi
 4e5:	5f                   	pop    %edi
 4e6:	5d                   	pop    %ebp
 4e7:	c3                   	ret    
 4e8:	90                   	nop
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 4f0:	c7 05 bc 08 00 00 c0 	movl   $0x8c0,0x8bc
 4f7:	08 00 00 
 4fa:	c7 05 c0 08 00 00 c0 	movl   $0x8c0,0x8c0
 501:	08 00 00 
    base.s.size = 0;
 504:	b8 c0 08 00 00       	mov    $0x8c0,%eax
 509:	c7 05 c4 08 00 00 00 	movl   $0x0,0x8c4
 510:	00 00 00 
 513:	e9 44 ff ff ff       	jmp    45c <malloc+0x2c>
 518:	90                   	nop
 519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 520:	8b 08                	mov    (%eax),%ecx
 522:	89 0a                	mov    %ecx,(%edx)
 524:	eb b1                	jmp    4d7 <malloc+0xa7>

00000526 <fork>:
 526:	b8 01 00 00 00       	mov    $0x1,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <exit>:
 52e:	b8 02 00 00 00       	mov    $0x2,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <wait>:
 536:	b8 03 00 00 00       	mov    $0x3,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <pipe>:
 53e:	b8 04 00 00 00       	mov    $0x4,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    

00000546 <read>:
 546:	b8 05 00 00 00       	mov    $0x5,%eax
 54b:	cd 40                	int    $0x40
 54d:	c3                   	ret    

0000054e <write>:
 54e:	b8 10 00 00 00       	mov    $0x10,%eax
 553:	cd 40                	int    $0x40
 555:	c3                   	ret    

00000556 <close>:
 556:	b8 15 00 00 00       	mov    $0x15,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <kill>:
 55e:	b8 06 00 00 00       	mov    $0x6,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <exec>:
 566:	b8 07 00 00 00       	mov    $0x7,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <open>:
 56e:	b8 0f 00 00 00       	mov    $0xf,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <mknod>:
 576:	b8 11 00 00 00       	mov    $0x11,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <unlink>:
 57e:	b8 12 00 00 00       	mov    $0x12,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <fstat>:
 586:	b8 08 00 00 00       	mov    $0x8,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <link>:
 58e:	b8 13 00 00 00       	mov    $0x13,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <mkdir>:
 596:	b8 14 00 00 00       	mov    $0x14,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <chdir>:
 59e:	b8 09 00 00 00       	mov    $0x9,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <dup>:
 5a6:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <getpid>:
 5ae:	b8 0b 00 00 00       	mov    $0xb,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <sbrk>:
 5b6:	b8 0c 00 00 00       	mov    $0xc,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <sleep>:
 5be:	b8 0d 00 00 00       	mov    $0xd,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <uptime>:
 5c6:	b8 0e 00 00 00       	mov    $0xe,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <settickets>:
 5ce:	b8 16 00 00 00       	mov    $0x16,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <getpinfo>:
 5d6:	b8 17 00 00 00       	mov    $0x17,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    
