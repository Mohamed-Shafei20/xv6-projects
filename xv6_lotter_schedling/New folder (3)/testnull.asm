
_testnull:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 04             	sub    $0x4,%esp
   int ppid = getpid();
    1011:	e8 98 04 00 00       	call   14ae <getpid>

   if (fork() == 0) {
    1016:	e8 0b 04 00 00       	call   1426 <fork>
    101b:	85 c0                	test   %eax,%eax
    101d:	75 15                	jne    1034 <main+0x34>
      uint * nullp = (uint*)0;
      printf(1, "null dereference: ");
    101f:	52                   	push   %edx
    1020:	52                   	push   %edx
    1021:	68 80 17 00 00       	push   $0x1780
    1026:	6a 01                	push   $0x1
    1028:	e8 63 05 00 00       	call   1590 <printf>
      printf(1, "%x %x\n", nullp, *nullp);
    102d:	a1 00 00 00 00       	mov    0x0,%eax
    1032:	0f 0b                	ud2    
      // this process should be killed
      printf(1, "TEST FAILED\n");
      kill(ppid);
      exit();
   } else {
      wait();
    1034:	e8 fd 03 00 00       	call   1436 <wait>
   }

   printf(1, "TEST PASSED\n");
    1039:	50                   	push   %eax
    103a:	50                   	push   %eax
    103b:	68 93 17 00 00       	push   $0x1793
    1040:	6a 01                	push   $0x1
    1042:	e8 49 05 00 00       	call   1590 <printf>
   exit();
    1047:	e8 e2 03 00 00       	call   142e <exit>
    104c:	66 90                	xchg   %ax,%ax
    104e:	66 90                	xchg   %ax,%ax

00001050 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	53                   	push   %ebx
    1054:	8b 45 08             	mov    0x8(%ebp),%eax
    1057:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    105a:	89 c2                	mov    %eax,%edx
    105c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1060:	83 c1 01             	add    $0x1,%ecx
    1063:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1067:	83 c2 01             	add    $0x1,%edx
    106a:	84 db                	test   %bl,%bl
    106c:	88 5a ff             	mov    %bl,-0x1(%edx)
    106f:	75 ef                	jne    1060 <strcpy+0x10>
    ;
  return os;
}
    1071:	5b                   	pop    %ebx
    1072:	5d                   	pop    %ebp
    1073:	c3                   	ret    
    1074:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    107a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001080 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	53                   	push   %ebx
    1084:	8b 55 08             	mov    0x8(%ebp),%edx
    1087:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    108a:	0f b6 02             	movzbl (%edx),%eax
    108d:	0f b6 19             	movzbl (%ecx),%ebx
    1090:	84 c0                	test   %al,%al
    1092:	75 1c                	jne    10b0 <strcmp+0x30>
    1094:	eb 2a                	jmp    10c0 <strcmp+0x40>
    1096:	8d 76 00             	lea    0x0(%esi),%esi
    1099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10a0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10a3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10a6:	83 c1 01             	add    $0x1,%ecx
    10a9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    10ac:	84 c0                	test   %al,%al
    10ae:	74 10                	je     10c0 <strcmp+0x40>
    10b0:	38 d8                	cmp    %bl,%al
    10b2:	74 ec                	je     10a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10b4:	29 d8                	sub    %ebx,%eax
}
    10b6:	5b                   	pop    %ebx
    10b7:	5d                   	pop    %ebp
    10b8:	c3                   	ret    
    10b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10c2:	29 d8                	sub    %ebx,%eax
}
    10c4:	5b                   	pop    %ebx
    10c5:	5d                   	pop    %ebp
    10c6:	c3                   	ret    
    10c7:	89 f6                	mov    %esi,%esi
    10c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010d0 <strlen>:

uint
strlen(const char *s)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10d6:	80 39 00             	cmpb   $0x0,(%ecx)
    10d9:	74 15                	je     10f0 <strlen+0x20>
    10db:	31 d2                	xor    %edx,%edx
    10dd:	8d 76 00             	lea    0x0(%esi),%esi
    10e0:	83 c2 01             	add    $0x1,%edx
    10e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10e7:	89 d0                	mov    %edx,%eax
    10e9:	75 f5                	jne    10e0 <strlen+0x10>
    ;
  return n;
}
    10eb:	5d                   	pop    %ebp
    10ec:	c3                   	ret    
    10ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    10f0:	31 c0                	xor    %eax,%eax
}
    10f2:	5d                   	pop    %ebp
    10f3:	c3                   	ret    
    10f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001100 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	57                   	push   %edi
    1104:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1107:	8b 4d 10             	mov    0x10(%ebp),%ecx
    110a:	8b 45 0c             	mov    0xc(%ebp),%eax
    110d:	89 d7                	mov    %edx,%edi
    110f:	fc                   	cld    
    1110:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1112:	89 d0                	mov    %edx,%eax
    1114:	5f                   	pop    %edi
    1115:	5d                   	pop    %ebp
    1116:	c3                   	ret    
    1117:	89 f6                	mov    %esi,%esi
    1119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001120 <strchr>:

char*
strchr(const char *s, char c)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	53                   	push   %ebx
    1124:	8b 45 08             	mov    0x8(%ebp),%eax
    1127:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    112a:	0f b6 10             	movzbl (%eax),%edx
    112d:	84 d2                	test   %dl,%dl
    112f:	74 1d                	je     114e <strchr+0x2e>
    if(*s == c)
    1131:	38 d3                	cmp    %dl,%bl
    1133:	89 d9                	mov    %ebx,%ecx
    1135:	75 0d                	jne    1144 <strchr+0x24>
    1137:	eb 17                	jmp    1150 <strchr+0x30>
    1139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1140:	38 ca                	cmp    %cl,%dl
    1142:	74 0c                	je     1150 <strchr+0x30>
  for(; *s; s++)
    1144:	83 c0 01             	add    $0x1,%eax
    1147:	0f b6 10             	movzbl (%eax),%edx
    114a:	84 d2                	test   %dl,%dl
    114c:	75 f2                	jne    1140 <strchr+0x20>
      return (char*)s;
  return 0;
    114e:	31 c0                	xor    %eax,%eax
}
    1150:	5b                   	pop    %ebx
    1151:	5d                   	pop    %ebp
    1152:	c3                   	ret    
    1153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001160 <gets>:

char*
gets(char *buf, int max)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	57                   	push   %edi
    1164:	56                   	push   %esi
    1165:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1166:	31 f6                	xor    %esi,%esi
    1168:	89 f3                	mov    %esi,%ebx
{
    116a:	83 ec 1c             	sub    $0x1c,%esp
    116d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1170:	eb 2f                	jmp    11a1 <gets+0x41>
    1172:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1178:	8d 45 e7             	lea    -0x19(%ebp),%eax
    117b:	83 ec 04             	sub    $0x4,%esp
    117e:	6a 01                	push   $0x1
    1180:	50                   	push   %eax
    1181:	6a 00                	push   $0x0
    1183:	e8 be 02 00 00       	call   1446 <read>
    if(cc < 1)
    1188:	83 c4 10             	add    $0x10,%esp
    118b:	85 c0                	test   %eax,%eax
    118d:	7e 1c                	jle    11ab <gets+0x4b>
      break;
    buf[i++] = c;
    118f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1193:	83 c7 01             	add    $0x1,%edi
    1196:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1199:	3c 0a                	cmp    $0xa,%al
    119b:	74 23                	je     11c0 <gets+0x60>
    119d:	3c 0d                	cmp    $0xd,%al
    119f:	74 1f                	je     11c0 <gets+0x60>
  for(i=0; i+1 < max; ){
    11a1:	83 c3 01             	add    $0x1,%ebx
    11a4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11a7:	89 fe                	mov    %edi,%esi
    11a9:	7c cd                	jl     1178 <gets+0x18>
    11ab:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11ad:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11b0:	c6 03 00             	movb   $0x0,(%ebx)
}
    11b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11b6:	5b                   	pop    %ebx
    11b7:	5e                   	pop    %esi
    11b8:	5f                   	pop    %edi
    11b9:	5d                   	pop    %ebp
    11ba:	c3                   	ret    
    11bb:	90                   	nop
    11bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11c0:	8b 75 08             	mov    0x8(%ebp),%esi
    11c3:	8b 45 08             	mov    0x8(%ebp),%eax
    11c6:	01 de                	add    %ebx,%esi
    11c8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11ca:	c6 03 00             	movb   $0x0,(%ebx)
}
    11cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11d0:	5b                   	pop    %ebx
    11d1:	5e                   	pop    %esi
    11d2:	5f                   	pop    %edi
    11d3:	5d                   	pop    %ebp
    11d4:	c3                   	ret    
    11d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	56                   	push   %esi
    11e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11e5:	83 ec 08             	sub    $0x8,%esp
    11e8:	6a 00                	push   $0x0
    11ea:	ff 75 08             	pushl  0x8(%ebp)
    11ed:	e8 7c 02 00 00       	call   146e <open>
  if(fd < 0)
    11f2:	83 c4 10             	add    $0x10,%esp
    11f5:	85 c0                	test   %eax,%eax
    11f7:	78 27                	js     1220 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11f9:	83 ec 08             	sub    $0x8,%esp
    11fc:	ff 75 0c             	pushl  0xc(%ebp)
    11ff:	89 c3                	mov    %eax,%ebx
    1201:	50                   	push   %eax
    1202:	e8 7f 02 00 00       	call   1486 <fstat>
  close(fd);
    1207:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    120a:	89 c6                	mov    %eax,%esi
  close(fd);
    120c:	e8 45 02 00 00       	call   1456 <close>
  return r;
    1211:	83 c4 10             	add    $0x10,%esp
}
    1214:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1217:	89 f0                	mov    %esi,%eax
    1219:	5b                   	pop    %ebx
    121a:	5e                   	pop    %esi
    121b:	5d                   	pop    %ebp
    121c:	c3                   	ret    
    121d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1220:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1225:	eb ed                	jmp    1214 <stat+0x34>
    1227:	89 f6                	mov    %esi,%esi
    1229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001230 <atoi>:

int
atoi(const char *s)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	53                   	push   %ebx
    1234:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1237:	0f be 11             	movsbl (%ecx),%edx
    123a:	8d 42 d0             	lea    -0x30(%edx),%eax
    123d:	3c 09                	cmp    $0x9,%al
  n = 0;
    123f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1244:	77 1f                	ja     1265 <atoi+0x35>
    1246:	8d 76 00             	lea    0x0(%esi),%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1250:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1253:	83 c1 01             	add    $0x1,%ecx
    1256:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    125a:	0f be 11             	movsbl (%ecx),%edx
    125d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1260:	80 fb 09             	cmp    $0x9,%bl
    1263:	76 eb                	jbe    1250 <atoi+0x20>
  return n;
}
    1265:	5b                   	pop    %ebx
    1266:	5d                   	pop    %ebp
    1267:	c3                   	ret    
    1268:	90                   	nop
    1269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001270 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1270:	55                   	push   %ebp
    1271:	89 e5                	mov    %esp,%ebp
    1273:	56                   	push   %esi
    1274:	53                   	push   %ebx
    1275:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1278:	8b 45 08             	mov    0x8(%ebp),%eax
    127b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    127e:	85 db                	test   %ebx,%ebx
    1280:	7e 14                	jle    1296 <memmove+0x26>
    1282:	31 d2                	xor    %edx,%edx
    1284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1288:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    128c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    128f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1292:	39 d3                	cmp    %edx,%ebx
    1294:	75 f2                	jne    1288 <memmove+0x18>
  return vdst;
}
    1296:	5b                   	pop    %ebx
    1297:	5e                   	pop    %esi
    1298:	5d                   	pop    %ebp
    1299:	c3                   	ret    
    129a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000012a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12a1:	a1 4c 1a 00 00       	mov    0x1a4c,%eax
{
    12a6:	89 e5                	mov    %esp,%ebp
    12a8:	57                   	push   %edi
    12a9:	56                   	push   %esi
    12aa:	53                   	push   %ebx
    12ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    12ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    12b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12b8:	39 c8                	cmp    %ecx,%eax
    12ba:	8b 10                	mov    (%eax),%edx
    12bc:	73 32                	jae    12f0 <free+0x50>
    12be:	39 d1                	cmp    %edx,%ecx
    12c0:	72 04                	jb     12c6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12c2:	39 d0                	cmp    %edx,%eax
    12c4:	72 32                	jb     12f8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    12c6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12c9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12cc:	39 fa                	cmp    %edi,%edx
    12ce:	74 30                	je     1300 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    12d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    12d3:	8b 50 04             	mov    0x4(%eax),%edx
    12d6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    12d9:	39 f1                	cmp    %esi,%ecx
    12db:	74 3a                	je     1317 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    12dd:	89 08                	mov    %ecx,(%eax)
  freep = p;
    12df:	a3 4c 1a 00 00       	mov    %eax,0x1a4c
}
    12e4:	5b                   	pop    %ebx
    12e5:	5e                   	pop    %esi
    12e6:	5f                   	pop    %edi
    12e7:	5d                   	pop    %ebp
    12e8:	c3                   	ret    
    12e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12f0:	39 d0                	cmp    %edx,%eax
    12f2:	72 04                	jb     12f8 <free+0x58>
    12f4:	39 d1                	cmp    %edx,%ecx
    12f6:	72 ce                	jb     12c6 <free+0x26>
{
    12f8:	89 d0                	mov    %edx,%eax
    12fa:	eb bc                	jmp    12b8 <free+0x18>
    12fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1300:	03 72 04             	add    0x4(%edx),%esi
    1303:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1306:	8b 10                	mov    (%eax),%edx
    1308:	8b 12                	mov    (%edx),%edx
    130a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    130d:	8b 50 04             	mov    0x4(%eax),%edx
    1310:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1313:	39 f1                	cmp    %esi,%ecx
    1315:	75 c6                	jne    12dd <free+0x3d>
    p->s.size += bp->s.size;
    1317:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    131a:	a3 4c 1a 00 00       	mov    %eax,0x1a4c
    p->s.size += bp->s.size;
    131f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1322:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1325:	89 10                	mov    %edx,(%eax)
}
    1327:	5b                   	pop    %ebx
    1328:	5e                   	pop    %esi
    1329:	5f                   	pop    %edi
    132a:	5d                   	pop    %ebp
    132b:	c3                   	ret    
    132c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001330 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	57                   	push   %edi
    1334:	56                   	push   %esi
    1335:	53                   	push   %ebx
    1336:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1339:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    133c:	8b 15 4c 1a 00 00    	mov    0x1a4c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1342:	8d 78 07             	lea    0x7(%eax),%edi
    1345:	c1 ef 03             	shr    $0x3,%edi
    1348:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    134b:	85 d2                	test   %edx,%edx
    134d:	0f 84 9d 00 00 00    	je     13f0 <malloc+0xc0>
    1353:	8b 02                	mov    (%edx),%eax
    1355:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1358:	39 cf                	cmp    %ecx,%edi
    135a:	76 6c                	jbe    13c8 <malloc+0x98>
    135c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1362:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1367:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    136a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1371:	eb 0e                	jmp    1381 <malloc+0x51>
    1373:	90                   	nop
    1374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1378:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    137a:	8b 48 04             	mov    0x4(%eax),%ecx
    137d:	39 f9                	cmp    %edi,%ecx
    137f:	73 47                	jae    13c8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1381:	39 05 4c 1a 00 00    	cmp    %eax,0x1a4c
    1387:	89 c2                	mov    %eax,%edx
    1389:	75 ed                	jne    1378 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    138b:	83 ec 0c             	sub    $0xc,%esp
    138e:	56                   	push   %esi
    138f:	e8 22 01 00 00       	call   14b6 <sbrk>
  if(p == (char*)-1)
    1394:	83 c4 10             	add    $0x10,%esp
    1397:	83 f8 ff             	cmp    $0xffffffff,%eax
    139a:	74 1c                	je     13b8 <malloc+0x88>
  hp->s.size = nu;
    139c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    139f:	83 ec 0c             	sub    $0xc,%esp
    13a2:	83 c0 08             	add    $0x8,%eax
    13a5:	50                   	push   %eax
    13a6:	e8 f5 fe ff ff       	call   12a0 <free>
  return freep;
    13ab:	8b 15 4c 1a 00 00    	mov    0x1a4c,%edx
      if((p = morecore(nunits)) == 0)
    13b1:	83 c4 10             	add    $0x10,%esp
    13b4:	85 d2                	test   %edx,%edx
    13b6:	75 c0                	jne    1378 <malloc+0x48>
        return 0;
  }
}
    13b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    13bb:	31 c0                	xor    %eax,%eax
}
    13bd:	5b                   	pop    %ebx
    13be:	5e                   	pop    %esi
    13bf:	5f                   	pop    %edi
    13c0:	5d                   	pop    %ebp
    13c1:	c3                   	ret    
    13c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    13c8:	39 cf                	cmp    %ecx,%edi
    13ca:	74 54                	je     1420 <malloc+0xf0>
        p->s.size -= nunits;
    13cc:	29 f9                	sub    %edi,%ecx
    13ce:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    13d1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    13d4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    13d7:	89 15 4c 1a 00 00    	mov    %edx,0x1a4c
}
    13dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    13e0:	83 c0 08             	add    $0x8,%eax
}
    13e3:	5b                   	pop    %ebx
    13e4:	5e                   	pop    %esi
    13e5:	5f                   	pop    %edi
    13e6:	5d                   	pop    %ebp
    13e7:	c3                   	ret    
    13e8:	90                   	nop
    13e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    13f0:	c7 05 4c 1a 00 00 50 	movl   $0x1a50,0x1a4c
    13f7:	1a 00 00 
    13fa:	c7 05 50 1a 00 00 50 	movl   $0x1a50,0x1a50
    1401:	1a 00 00 
    base.s.size = 0;
    1404:	b8 50 1a 00 00       	mov    $0x1a50,%eax
    1409:	c7 05 54 1a 00 00 00 	movl   $0x0,0x1a54
    1410:	00 00 00 
    1413:	e9 44 ff ff ff       	jmp    135c <malloc+0x2c>
    1418:	90                   	nop
    1419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1420:	8b 08                	mov    (%eax),%ecx
    1422:	89 0a                	mov    %ecx,(%edx)
    1424:	eb b1                	jmp    13d7 <malloc+0xa7>

00001426 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1426:	b8 01 00 00 00       	mov    $0x1,%eax
    142b:	cd 40                	int    $0x40
    142d:	c3                   	ret    

0000142e <exit>:
SYSCALL(exit)
    142e:	b8 02 00 00 00       	mov    $0x2,%eax
    1433:	cd 40                	int    $0x40
    1435:	c3                   	ret    

00001436 <wait>:
SYSCALL(wait)
    1436:	b8 03 00 00 00       	mov    $0x3,%eax
    143b:	cd 40                	int    $0x40
    143d:	c3                   	ret    

0000143e <pipe>:
SYSCALL(pipe)
    143e:	b8 04 00 00 00       	mov    $0x4,%eax
    1443:	cd 40                	int    $0x40
    1445:	c3                   	ret    

00001446 <read>:
SYSCALL(read)
    1446:	b8 05 00 00 00       	mov    $0x5,%eax
    144b:	cd 40                	int    $0x40
    144d:	c3                   	ret    

0000144e <write>:
SYSCALL(write)
    144e:	b8 10 00 00 00       	mov    $0x10,%eax
    1453:	cd 40                	int    $0x40
    1455:	c3                   	ret    

00001456 <close>:
SYSCALL(close)
    1456:	b8 15 00 00 00       	mov    $0x15,%eax
    145b:	cd 40                	int    $0x40
    145d:	c3                   	ret    

0000145e <kill>:
SYSCALL(kill)
    145e:	b8 06 00 00 00       	mov    $0x6,%eax
    1463:	cd 40                	int    $0x40
    1465:	c3                   	ret    

00001466 <exec>:
SYSCALL(exec)
    1466:	b8 07 00 00 00       	mov    $0x7,%eax
    146b:	cd 40                	int    $0x40
    146d:	c3                   	ret    

0000146e <open>:
SYSCALL(open)
    146e:	b8 0f 00 00 00       	mov    $0xf,%eax
    1473:	cd 40                	int    $0x40
    1475:	c3                   	ret    

00001476 <mknod>:
SYSCALL(mknod)
    1476:	b8 11 00 00 00       	mov    $0x11,%eax
    147b:	cd 40                	int    $0x40
    147d:	c3                   	ret    

0000147e <unlink>:
SYSCALL(unlink)
    147e:	b8 12 00 00 00       	mov    $0x12,%eax
    1483:	cd 40                	int    $0x40
    1485:	c3                   	ret    

00001486 <fstat>:
SYSCALL(fstat)
    1486:	b8 08 00 00 00       	mov    $0x8,%eax
    148b:	cd 40                	int    $0x40
    148d:	c3                   	ret    

0000148e <link>:
SYSCALL(link)
    148e:	b8 13 00 00 00       	mov    $0x13,%eax
    1493:	cd 40                	int    $0x40
    1495:	c3                   	ret    

00001496 <mkdir>:
SYSCALL(mkdir)
    1496:	b8 14 00 00 00       	mov    $0x14,%eax
    149b:	cd 40                	int    $0x40
    149d:	c3                   	ret    

0000149e <chdir>:
SYSCALL(chdir)
    149e:	b8 09 00 00 00       	mov    $0x9,%eax
    14a3:	cd 40                	int    $0x40
    14a5:	c3                   	ret    

000014a6 <dup>:
SYSCALL(dup)
    14a6:	b8 0a 00 00 00       	mov    $0xa,%eax
    14ab:	cd 40                	int    $0x40
    14ad:	c3                   	ret    

000014ae <getpid>:
SYSCALL(getpid)
    14ae:	b8 0b 00 00 00       	mov    $0xb,%eax
    14b3:	cd 40                	int    $0x40
    14b5:	c3                   	ret    

000014b6 <sbrk>:
SYSCALL(sbrk)
    14b6:	b8 0c 00 00 00       	mov    $0xc,%eax
    14bb:	cd 40                	int    $0x40
    14bd:	c3                   	ret    

000014be <sleep>:
SYSCALL(sleep)
    14be:	b8 0d 00 00 00       	mov    $0xd,%eax
    14c3:	cd 40                	int    $0x40
    14c5:	c3                   	ret    

000014c6 <uptime>:
SYSCALL(uptime)
    14c6:	b8 0e 00 00 00       	mov    $0xe,%eax
    14cb:	cd 40                	int    $0x40
    14cd:	c3                   	ret    

000014ce <getreadcount>:
SYSCALL(getreadcount)
    14ce:	b8 16 00 00 00       	mov    $0x16,%eax
    14d3:	cd 40                	int    $0x40
    14d5:	c3                   	ret    

000014d6 <gettime>:
SYSCALL(gettime)
    14d6:	b8 17 00 00 00       	mov    $0x17,%eax
    14db:	cd 40                	int    $0x40
    14dd:	c3                   	ret    

000014de <settickets>:

SYSCALL(settickets)//updated
    14de:	b8 18 00 00 00       	mov    $0x18,%eax
    14e3:	cd 40                	int    $0x40
    14e5:	c3                   	ret    

000014e6 <getpinfo>:
SYSCALL(getpinfo)//updated
    14e6:	b8 19 00 00 00       	mov    $0x19,%eax
    14eb:	cd 40                	int    $0x40
    14ed:	c3                   	ret    
    14ee:	66 90                	xchg   %ax,%ax

000014f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    14f0:	55                   	push   %ebp
    14f1:	89 e5                	mov    %esp,%ebp
    14f3:	57                   	push   %edi
    14f4:	56                   	push   %esi
    14f5:	53                   	push   %ebx
    14f6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    14f9:	85 d2                	test   %edx,%edx
{
    14fb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    14fe:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1500:	79 76                	jns    1578 <printint+0x88>
    1502:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1506:	74 70                	je     1578 <printint+0x88>
    x = -xx;
    1508:	f7 d8                	neg    %eax
    neg = 1;
    150a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1511:	31 f6                	xor    %esi,%esi
    1513:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1516:	eb 0a                	jmp    1522 <printint+0x32>
    1518:	90                   	nop
    1519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1520:	89 fe                	mov    %edi,%esi
    1522:	31 d2                	xor    %edx,%edx
    1524:	8d 7e 01             	lea    0x1(%esi),%edi
    1527:	f7 f1                	div    %ecx
    1529:	0f b6 92 a8 17 00 00 	movzbl 0x17a8(%edx),%edx
  }while((x /= base) != 0);
    1530:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1532:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1535:	75 e9                	jne    1520 <printint+0x30>
  if(neg)
    1537:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    153a:	85 c0                	test   %eax,%eax
    153c:	74 08                	je     1546 <printint+0x56>
    buf[i++] = '-';
    153e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1543:	8d 7e 02             	lea    0x2(%esi),%edi
    1546:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    154a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    154d:	8d 76 00             	lea    0x0(%esi),%esi
    1550:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1553:	83 ec 04             	sub    $0x4,%esp
    1556:	83 ee 01             	sub    $0x1,%esi
    1559:	6a 01                	push   $0x1
    155b:	53                   	push   %ebx
    155c:	57                   	push   %edi
    155d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1560:	e8 e9 fe ff ff       	call   144e <write>

  while(--i >= 0)
    1565:	83 c4 10             	add    $0x10,%esp
    1568:	39 de                	cmp    %ebx,%esi
    156a:	75 e4                	jne    1550 <printint+0x60>
    putc(fd, buf[i]);
}
    156c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    156f:	5b                   	pop    %ebx
    1570:	5e                   	pop    %esi
    1571:	5f                   	pop    %edi
    1572:	5d                   	pop    %ebp
    1573:	c3                   	ret    
    1574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1578:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    157f:	eb 90                	jmp    1511 <printint+0x21>
    1581:	eb 0d                	jmp    1590 <printf>
    1583:	90                   	nop
    1584:	90                   	nop
    1585:	90                   	nop
    1586:	90                   	nop
    1587:	90                   	nop
    1588:	90                   	nop
    1589:	90                   	nop
    158a:	90                   	nop
    158b:	90                   	nop
    158c:	90                   	nop
    158d:	90                   	nop
    158e:	90                   	nop
    158f:	90                   	nop

00001590 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    1593:	57                   	push   %edi
    1594:	56                   	push   %esi
    1595:	53                   	push   %ebx
    1596:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1599:	8b 75 0c             	mov    0xc(%ebp),%esi
    159c:	0f b6 1e             	movzbl (%esi),%ebx
    159f:	84 db                	test   %bl,%bl
    15a1:	0f 84 bf 00 00 00    	je     1666 <printf+0xd6>
    15a7:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    15aa:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    15ad:	31 d2                	xor    %edx,%edx
    15af:	eb 39                	jmp    15ea <printf+0x5a>
    15b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    15b8:	83 f8 25             	cmp    $0x25,%eax
    15bb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    15be:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    15c3:	74 1a                	je     15df <printf+0x4f>
  write(fd, &c, 1);
    15c5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    15c8:	83 ec 04             	sub    $0x4,%esp
    15cb:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    15ce:	6a 01                	push   $0x1
    15d0:	50                   	push   %eax
    15d1:	ff 75 08             	pushl  0x8(%ebp)
    15d4:	e8 75 fe ff ff       	call   144e <write>
    15d9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    15dc:	83 c4 10             	add    $0x10,%esp
    15df:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    15e2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    15e6:	84 db                	test   %bl,%bl
    15e8:	74 7c                	je     1666 <printf+0xd6>
    if(state == 0){
    15ea:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    15ec:	0f be cb             	movsbl %bl,%ecx
    15ef:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    15f2:	74 c4                	je     15b8 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    15f4:	83 fa 25             	cmp    $0x25,%edx
    15f7:	75 e6                	jne    15df <printf+0x4f>
      if(c == 'd'){
    15f9:	83 f8 64             	cmp    $0x64,%eax
    15fc:	0f 84 a6 00 00 00    	je     16a8 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1602:	83 f8 6c             	cmp    $0x6c,%eax
    1605:	0f 84 ad 00 00 00    	je     16b8 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    160b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1611:	83 f9 70             	cmp    $0x70,%ecx
    1614:	74 5a                	je     1670 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1616:	83 f8 73             	cmp    $0x73,%eax
    1619:	0f 84 e1 00 00 00    	je     1700 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    161f:	83 f8 63             	cmp    $0x63,%eax
    1622:	0f 84 28 01 00 00    	je     1750 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1628:	83 f8 25             	cmp    $0x25,%eax
    162b:	74 6b                	je     1698 <printf+0x108>
  write(fd, &c, 1);
    162d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1630:	83 ec 04             	sub    $0x4,%esp
    1633:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1637:	6a 01                	push   $0x1
    1639:	50                   	push   %eax
    163a:	ff 75 08             	pushl  0x8(%ebp)
    163d:	e8 0c fe ff ff       	call   144e <write>
    1642:	83 c4 0c             	add    $0xc,%esp
    1645:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1648:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    164b:	6a 01                	push   $0x1
    164d:	50                   	push   %eax
    164e:	ff 75 08             	pushl  0x8(%ebp)
    1651:	83 c6 01             	add    $0x1,%esi
    1654:	e8 f5 fd ff ff       	call   144e <write>
  for(i = 0; fmt[i]; i++){
    1659:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    165d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1660:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1662:	84 db                	test   %bl,%bl
    1664:	75 84                	jne    15ea <printf+0x5a>
    }
  }
}
    1666:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1669:	5b                   	pop    %ebx
    166a:	5e                   	pop    %esi
    166b:	5f                   	pop    %edi
    166c:	5d                   	pop    %ebp
    166d:	c3                   	ret    
    166e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1670:	83 ec 0c             	sub    $0xc,%esp
    1673:	b9 10 00 00 00       	mov    $0x10,%ecx
    1678:	6a 00                	push   $0x0
    167a:	8b 17                	mov    (%edi),%edx
    167c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    167f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1682:	e8 69 fe ff ff       	call   14f0 <printint>
    1687:	83 c4 10             	add    $0x10,%esp
      state = 0;
    168a:	31 d2                	xor    %edx,%edx
    168c:	e9 4e ff ff ff       	jmp    15df <printf+0x4f>
    1691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1698:	83 ec 04             	sub    $0x4,%esp
    169b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    169e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16a1:	6a 01                	push   $0x1
    16a3:	eb a8                	jmp    164d <printf+0xbd>
    16a5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    16a8:	83 ec 0c             	sub    $0xc,%esp
    16ab:	b9 0a 00 00 00       	mov    $0xa,%ecx
    16b0:	6a 01                	push   $0x1
    16b2:	eb c6                	jmp    167a <printf+0xea>
    16b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    16b8:	8b 57 04             	mov    0x4(%edi),%edx
    16bb:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    16bd:	85 d2                	test   %edx,%edx
    16bf:	74 15                	je     16d6 <printf+0x146>
    16c1:	83 ec 0c             	sub    $0xc,%esp
    16c4:	8b 45 08             	mov    0x8(%ebp),%eax
    16c7:	b9 10 00 00 00       	mov    $0x10,%ecx
    16cc:	6a 00                	push   $0x0
    16ce:	e8 1d fe ff ff       	call   14f0 <printint>
    16d3:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    16d6:	83 ec 0c             	sub    $0xc,%esp
    16d9:	8b 45 08             	mov    0x8(%ebp),%eax
    16dc:	89 da                	mov    %ebx,%edx
    16de:	6a 00                	push   $0x0
    16e0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    16e5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    16e8:	e8 03 fe ff ff       	call   14f0 <printint>
    16ed:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16f0:	31 d2                	xor    %edx,%edx
    16f2:	e9 e8 fe ff ff       	jmp    15df <printf+0x4f>
    16f7:	89 f6                	mov    %esi,%esi
    16f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1700:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1702:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1705:	85 c9                	test   %ecx,%ecx
    1707:	74 6a                	je     1773 <printf+0x1e3>
        while(*s != 0){
    1709:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    170c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    170e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1710:	84 c0                	test   %al,%al
    1712:	0f 84 c7 fe ff ff    	je     15df <printf+0x4f>
    1718:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    171b:	89 de                	mov    %ebx,%esi
    171d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1720:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1723:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1726:	83 ec 04             	sub    $0x4,%esp
    1729:	6a 01                	push   $0x1
          s++;
    172b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    172e:	50                   	push   %eax
    172f:	53                   	push   %ebx
    1730:	e8 19 fd ff ff       	call   144e <write>
        while(*s != 0){
    1735:	0f b6 06             	movzbl (%esi),%eax
    1738:	83 c4 10             	add    $0x10,%esp
    173b:	84 c0                	test   %al,%al
    173d:	75 e1                	jne    1720 <printf+0x190>
    173f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1742:	31 d2                	xor    %edx,%edx
    1744:	e9 96 fe ff ff       	jmp    15df <printf+0x4f>
    1749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1750:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1752:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1755:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1758:	6a 01                	push   $0x1
        putc(fd, *ap);
    175a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    175d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1760:	50                   	push   %eax
    1761:	ff 75 08             	pushl  0x8(%ebp)
    1764:	e8 e5 fc ff ff       	call   144e <write>
    1769:	83 c4 10             	add    $0x10,%esp
      state = 0;
    176c:	31 d2                	xor    %edx,%edx
    176e:	e9 6c fe ff ff       	jmp    15df <printf+0x4f>
          s = "(null)";
    1773:	bb a0 17 00 00       	mov    $0x17a0,%ebx
        while(*s != 0){
    1778:	b8 28 00 00 00       	mov    $0x28,%eax
    177d:	eb 99                	jmp    1718 <printf+0x188>
