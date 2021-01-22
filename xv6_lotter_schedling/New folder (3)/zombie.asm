
_zombie:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
    1011:	e8 f0 03 00 00       	call   1406 <fork>
    1016:	85 c0                	test   %eax,%eax
    1018:	7e 0d                	jle    1027 <main+0x27>
    sleep(5);  // Let child exit before parent.
    101a:	83 ec 0c             	sub    $0xc,%esp
    101d:	6a 05                	push   $0x5
    101f:	e8 7a 04 00 00       	call   149e <sleep>
    1024:	83 c4 10             	add    $0x10,%esp
  exit();
    1027:	e8 e2 03 00 00       	call   140e <exit>
    102c:	66 90                	xchg   %ax,%ax
    102e:	66 90                	xchg   %ax,%ax

00001030 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	53                   	push   %ebx
    1034:	8b 45 08             	mov    0x8(%ebp),%eax
    1037:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    103a:	89 c2                	mov    %eax,%edx
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1040:	83 c1 01             	add    $0x1,%ecx
    1043:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1047:	83 c2 01             	add    $0x1,%edx
    104a:	84 db                	test   %bl,%bl
    104c:	88 5a ff             	mov    %bl,-0x1(%edx)
    104f:	75 ef                	jne    1040 <strcpy+0x10>
    ;
  return os;
}
    1051:	5b                   	pop    %ebx
    1052:	5d                   	pop    %ebp
    1053:	c3                   	ret    
    1054:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    105a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	53                   	push   %ebx
    1064:	8b 55 08             	mov    0x8(%ebp),%edx
    1067:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    106a:	0f b6 02             	movzbl (%edx),%eax
    106d:	0f b6 19             	movzbl (%ecx),%ebx
    1070:	84 c0                	test   %al,%al
    1072:	75 1c                	jne    1090 <strcmp+0x30>
    1074:	eb 2a                	jmp    10a0 <strcmp+0x40>
    1076:	8d 76 00             	lea    0x0(%esi),%esi
    1079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1080:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1083:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1086:	83 c1 01             	add    $0x1,%ecx
    1089:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    108c:	84 c0                	test   %al,%al
    108e:	74 10                	je     10a0 <strcmp+0x40>
    1090:	38 d8                	cmp    %bl,%al
    1092:	74 ec                	je     1080 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1094:	29 d8                	sub    %ebx,%eax
}
    1096:	5b                   	pop    %ebx
    1097:	5d                   	pop    %ebp
    1098:	c3                   	ret    
    1099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10a2:	29 d8                	sub    %ebx,%eax
}
    10a4:	5b                   	pop    %ebx
    10a5:	5d                   	pop    %ebp
    10a6:	c3                   	ret    
    10a7:	89 f6                	mov    %esi,%esi
    10a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010b0 <strlen>:

uint
strlen(const char *s)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10b6:	80 39 00             	cmpb   $0x0,(%ecx)
    10b9:	74 15                	je     10d0 <strlen+0x20>
    10bb:	31 d2                	xor    %edx,%edx
    10bd:	8d 76 00             	lea    0x0(%esi),%esi
    10c0:	83 c2 01             	add    $0x1,%edx
    10c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10c7:	89 d0                	mov    %edx,%eax
    10c9:	75 f5                	jne    10c0 <strlen+0x10>
    ;
  return n;
}
    10cb:	5d                   	pop    %ebp
    10cc:	c3                   	ret    
    10cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    10d0:	31 c0                	xor    %eax,%eax
}
    10d2:	5d                   	pop    %ebp
    10d3:	c3                   	ret    
    10d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	57                   	push   %edi
    10e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ed:	89 d7                	mov    %edx,%edi
    10ef:	fc                   	cld    
    10f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10f2:	89 d0                	mov    %edx,%eax
    10f4:	5f                   	pop    %edi
    10f5:	5d                   	pop    %ebp
    10f6:	c3                   	ret    
    10f7:	89 f6                	mov    %esi,%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001100 <strchr>:

char*
strchr(const char *s, char c)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	53                   	push   %ebx
    1104:	8b 45 08             	mov    0x8(%ebp),%eax
    1107:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    110a:	0f b6 10             	movzbl (%eax),%edx
    110d:	84 d2                	test   %dl,%dl
    110f:	74 1d                	je     112e <strchr+0x2e>
    if(*s == c)
    1111:	38 d3                	cmp    %dl,%bl
    1113:	89 d9                	mov    %ebx,%ecx
    1115:	75 0d                	jne    1124 <strchr+0x24>
    1117:	eb 17                	jmp    1130 <strchr+0x30>
    1119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1120:	38 ca                	cmp    %cl,%dl
    1122:	74 0c                	je     1130 <strchr+0x30>
  for(; *s; s++)
    1124:	83 c0 01             	add    $0x1,%eax
    1127:	0f b6 10             	movzbl (%eax),%edx
    112a:	84 d2                	test   %dl,%dl
    112c:	75 f2                	jne    1120 <strchr+0x20>
      return (char*)s;
  return 0;
    112e:	31 c0                	xor    %eax,%eax
}
    1130:	5b                   	pop    %ebx
    1131:	5d                   	pop    %ebp
    1132:	c3                   	ret    
    1133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001140 <gets>:

char*
gets(char *buf, int max)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	56                   	push   %esi
    1145:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1146:	31 f6                	xor    %esi,%esi
    1148:	89 f3                	mov    %esi,%ebx
{
    114a:	83 ec 1c             	sub    $0x1c,%esp
    114d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1150:	eb 2f                	jmp    1181 <gets+0x41>
    1152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1158:	8d 45 e7             	lea    -0x19(%ebp),%eax
    115b:	83 ec 04             	sub    $0x4,%esp
    115e:	6a 01                	push   $0x1
    1160:	50                   	push   %eax
    1161:	6a 00                	push   $0x0
    1163:	e8 be 02 00 00       	call   1426 <read>
    if(cc < 1)
    1168:	83 c4 10             	add    $0x10,%esp
    116b:	85 c0                	test   %eax,%eax
    116d:	7e 1c                	jle    118b <gets+0x4b>
      break;
    buf[i++] = c;
    116f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1173:	83 c7 01             	add    $0x1,%edi
    1176:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1179:	3c 0a                	cmp    $0xa,%al
    117b:	74 23                	je     11a0 <gets+0x60>
    117d:	3c 0d                	cmp    $0xd,%al
    117f:	74 1f                	je     11a0 <gets+0x60>
  for(i=0; i+1 < max; ){
    1181:	83 c3 01             	add    $0x1,%ebx
    1184:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1187:	89 fe                	mov    %edi,%esi
    1189:	7c cd                	jl     1158 <gets+0x18>
    118b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    118d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1190:	c6 03 00             	movb   $0x0,(%ebx)
}
    1193:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1196:	5b                   	pop    %ebx
    1197:	5e                   	pop    %esi
    1198:	5f                   	pop    %edi
    1199:	5d                   	pop    %ebp
    119a:	c3                   	ret    
    119b:	90                   	nop
    119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11a0:	8b 75 08             	mov    0x8(%ebp),%esi
    11a3:	8b 45 08             	mov    0x8(%ebp),%eax
    11a6:	01 de                	add    %ebx,%esi
    11a8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11aa:	c6 03 00             	movb   $0x0,(%ebx)
}
    11ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11b0:	5b                   	pop    %ebx
    11b1:	5e                   	pop    %esi
    11b2:	5f                   	pop    %edi
    11b3:	5d                   	pop    %ebp
    11b4:	c3                   	ret    
    11b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011c0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	56                   	push   %esi
    11c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11c5:	83 ec 08             	sub    $0x8,%esp
    11c8:	6a 00                	push   $0x0
    11ca:	ff 75 08             	pushl  0x8(%ebp)
    11cd:	e8 7c 02 00 00       	call   144e <open>
  if(fd < 0)
    11d2:	83 c4 10             	add    $0x10,%esp
    11d5:	85 c0                	test   %eax,%eax
    11d7:	78 27                	js     1200 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11d9:	83 ec 08             	sub    $0x8,%esp
    11dc:	ff 75 0c             	pushl  0xc(%ebp)
    11df:	89 c3                	mov    %eax,%ebx
    11e1:	50                   	push   %eax
    11e2:	e8 7f 02 00 00       	call   1466 <fstat>
  close(fd);
    11e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    11ea:	89 c6                	mov    %eax,%esi
  close(fd);
    11ec:	e8 45 02 00 00       	call   1436 <close>
  return r;
    11f1:	83 c4 10             	add    $0x10,%esp
}
    11f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11f7:	89 f0                	mov    %esi,%eax
    11f9:	5b                   	pop    %ebx
    11fa:	5e                   	pop    %esi
    11fb:	5d                   	pop    %ebp
    11fc:	c3                   	ret    
    11fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1200:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1205:	eb ed                	jmp    11f4 <stat+0x34>
    1207:	89 f6                	mov    %esi,%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <atoi>:

int
atoi(const char *s)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	53                   	push   %ebx
    1214:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1217:	0f be 11             	movsbl (%ecx),%edx
    121a:	8d 42 d0             	lea    -0x30(%edx),%eax
    121d:	3c 09                	cmp    $0x9,%al
  n = 0;
    121f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1224:	77 1f                	ja     1245 <atoi+0x35>
    1226:	8d 76 00             	lea    0x0(%esi),%esi
    1229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1230:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1233:	83 c1 01             	add    $0x1,%ecx
    1236:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    123a:	0f be 11             	movsbl (%ecx),%edx
    123d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1240:	80 fb 09             	cmp    $0x9,%bl
    1243:	76 eb                	jbe    1230 <atoi+0x20>
  return n;
}
    1245:	5b                   	pop    %ebx
    1246:	5d                   	pop    %ebp
    1247:	c3                   	ret    
    1248:	90                   	nop
    1249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	56                   	push   %esi
    1254:	53                   	push   %ebx
    1255:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1258:	8b 45 08             	mov    0x8(%ebp),%eax
    125b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    125e:	85 db                	test   %ebx,%ebx
    1260:	7e 14                	jle    1276 <memmove+0x26>
    1262:	31 d2                	xor    %edx,%edx
    1264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1268:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    126c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    126f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1272:	39 d3                	cmp    %edx,%ebx
    1274:	75 f2                	jne    1268 <memmove+0x18>
  return vdst;
}
    1276:	5b                   	pop    %ebx
    1277:	5e                   	pop    %esi
    1278:	5d                   	pop    %ebp
    1279:	c3                   	ret    
    127a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001280 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1280:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1281:	a1 fc 19 00 00       	mov    0x19fc,%eax
{
    1286:	89 e5                	mov    %esp,%ebp
    1288:	57                   	push   %edi
    1289:	56                   	push   %esi
    128a:	53                   	push   %ebx
    128b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    128e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1298:	39 c8                	cmp    %ecx,%eax
    129a:	8b 10                	mov    (%eax),%edx
    129c:	73 32                	jae    12d0 <free+0x50>
    129e:	39 d1                	cmp    %edx,%ecx
    12a0:	72 04                	jb     12a6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12a2:	39 d0                	cmp    %edx,%eax
    12a4:	72 32                	jb     12d8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    12a6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12a9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12ac:	39 fa                	cmp    %edi,%edx
    12ae:	74 30                	je     12e0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    12b0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    12b3:	8b 50 04             	mov    0x4(%eax),%edx
    12b6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    12b9:	39 f1                	cmp    %esi,%ecx
    12bb:	74 3a                	je     12f7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    12bd:	89 08                	mov    %ecx,(%eax)
  freep = p;
    12bf:	a3 fc 19 00 00       	mov    %eax,0x19fc
}
    12c4:	5b                   	pop    %ebx
    12c5:	5e                   	pop    %esi
    12c6:	5f                   	pop    %edi
    12c7:	5d                   	pop    %ebp
    12c8:	c3                   	ret    
    12c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12d0:	39 d0                	cmp    %edx,%eax
    12d2:	72 04                	jb     12d8 <free+0x58>
    12d4:	39 d1                	cmp    %edx,%ecx
    12d6:	72 ce                	jb     12a6 <free+0x26>
{
    12d8:	89 d0                	mov    %edx,%eax
    12da:	eb bc                	jmp    1298 <free+0x18>
    12dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    12e0:	03 72 04             	add    0x4(%edx),%esi
    12e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    12e6:	8b 10                	mov    (%eax),%edx
    12e8:	8b 12                	mov    (%edx),%edx
    12ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    12ed:	8b 50 04             	mov    0x4(%eax),%edx
    12f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    12f3:	39 f1                	cmp    %esi,%ecx
    12f5:	75 c6                	jne    12bd <free+0x3d>
    p->s.size += bp->s.size;
    12f7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    12fa:	a3 fc 19 00 00       	mov    %eax,0x19fc
    p->s.size += bp->s.size;
    12ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1302:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1305:	89 10                	mov    %edx,(%eax)
}
    1307:	5b                   	pop    %ebx
    1308:	5e                   	pop    %esi
    1309:	5f                   	pop    %edi
    130a:	5d                   	pop    %ebp
    130b:	c3                   	ret    
    130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001310 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	57                   	push   %edi
    1314:	56                   	push   %esi
    1315:	53                   	push   %ebx
    1316:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1319:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    131c:	8b 15 fc 19 00 00    	mov    0x19fc,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1322:	8d 78 07             	lea    0x7(%eax),%edi
    1325:	c1 ef 03             	shr    $0x3,%edi
    1328:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    132b:	85 d2                	test   %edx,%edx
    132d:	0f 84 9d 00 00 00    	je     13d0 <malloc+0xc0>
    1333:	8b 02                	mov    (%edx),%eax
    1335:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1338:	39 cf                	cmp    %ecx,%edi
    133a:	76 6c                	jbe    13a8 <malloc+0x98>
    133c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1342:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1347:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    134a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1351:	eb 0e                	jmp    1361 <malloc+0x51>
    1353:	90                   	nop
    1354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1358:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    135a:	8b 48 04             	mov    0x4(%eax),%ecx
    135d:	39 f9                	cmp    %edi,%ecx
    135f:	73 47                	jae    13a8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1361:	39 05 fc 19 00 00    	cmp    %eax,0x19fc
    1367:	89 c2                	mov    %eax,%edx
    1369:	75 ed                	jne    1358 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    136b:	83 ec 0c             	sub    $0xc,%esp
    136e:	56                   	push   %esi
    136f:	e8 22 01 00 00       	call   1496 <sbrk>
  if(p == (char*)-1)
    1374:	83 c4 10             	add    $0x10,%esp
    1377:	83 f8 ff             	cmp    $0xffffffff,%eax
    137a:	74 1c                	je     1398 <malloc+0x88>
  hp->s.size = nu;
    137c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    137f:	83 ec 0c             	sub    $0xc,%esp
    1382:	83 c0 08             	add    $0x8,%eax
    1385:	50                   	push   %eax
    1386:	e8 f5 fe ff ff       	call   1280 <free>
  return freep;
    138b:	8b 15 fc 19 00 00    	mov    0x19fc,%edx
      if((p = morecore(nunits)) == 0)
    1391:	83 c4 10             	add    $0x10,%esp
    1394:	85 d2                	test   %edx,%edx
    1396:	75 c0                	jne    1358 <malloc+0x48>
        return 0;
  }
}
    1398:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    139b:	31 c0                	xor    %eax,%eax
}
    139d:	5b                   	pop    %ebx
    139e:	5e                   	pop    %esi
    139f:	5f                   	pop    %edi
    13a0:	5d                   	pop    %ebp
    13a1:	c3                   	ret    
    13a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    13a8:	39 cf                	cmp    %ecx,%edi
    13aa:	74 54                	je     1400 <malloc+0xf0>
        p->s.size -= nunits;
    13ac:	29 f9                	sub    %edi,%ecx
    13ae:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    13b1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    13b4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    13b7:	89 15 fc 19 00 00    	mov    %edx,0x19fc
}
    13bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    13c0:	83 c0 08             	add    $0x8,%eax
}
    13c3:	5b                   	pop    %ebx
    13c4:	5e                   	pop    %esi
    13c5:	5f                   	pop    %edi
    13c6:	5d                   	pop    %ebp
    13c7:	c3                   	ret    
    13c8:	90                   	nop
    13c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    13d0:	c7 05 fc 19 00 00 00 	movl   $0x1a00,0x19fc
    13d7:	1a 00 00 
    13da:	c7 05 00 1a 00 00 00 	movl   $0x1a00,0x1a00
    13e1:	1a 00 00 
    base.s.size = 0;
    13e4:	b8 00 1a 00 00       	mov    $0x1a00,%eax
    13e9:	c7 05 04 1a 00 00 00 	movl   $0x0,0x1a04
    13f0:	00 00 00 
    13f3:	e9 44 ff ff ff       	jmp    133c <malloc+0x2c>
    13f8:	90                   	nop
    13f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1400:	8b 08                	mov    (%eax),%ecx
    1402:	89 0a                	mov    %ecx,(%edx)
    1404:	eb b1                	jmp    13b7 <malloc+0xa7>

00001406 <fork>:
    1406:	b8 01 00 00 00       	mov    $0x1,%eax
    140b:	cd 40                	int    $0x40
    140d:	c3                   	ret    

0000140e <exit>:
    140e:	b8 02 00 00 00       	mov    $0x2,%eax
    1413:	cd 40                	int    $0x40
    1415:	c3                   	ret    

00001416 <wait>:
    1416:	b8 03 00 00 00       	mov    $0x3,%eax
    141b:	cd 40                	int    $0x40
    141d:	c3                   	ret    

0000141e <pipe>:
    141e:	b8 04 00 00 00       	mov    $0x4,%eax
    1423:	cd 40                	int    $0x40
    1425:	c3                   	ret    

00001426 <read>:
    1426:	b8 05 00 00 00       	mov    $0x5,%eax
    142b:	cd 40                	int    $0x40
    142d:	c3                   	ret    

0000142e <write>:
    142e:	b8 10 00 00 00       	mov    $0x10,%eax
    1433:	cd 40                	int    $0x40
    1435:	c3                   	ret    

00001436 <close>:
    1436:	b8 15 00 00 00       	mov    $0x15,%eax
    143b:	cd 40                	int    $0x40
    143d:	c3                   	ret    

0000143e <kill>:
    143e:	b8 06 00 00 00       	mov    $0x6,%eax
    1443:	cd 40                	int    $0x40
    1445:	c3                   	ret    

00001446 <exec>:
    1446:	b8 07 00 00 00       	mov    $0x7,%eax
    144b:	cd 40                	int    $0x40
    144d:	c3                   	ret    

0000144e <open>:
    144e:	b8 0f 00 00 00       	mov    $0xf,%eax
    1453:	cd 40                	int    $0x40
    1455:	c3                   	ret    

00001456 <mknod>:
    1456:	b8 11 00 00 00       	mov    $0x11,%eax
    145b:	cd 40                	int    $0x40
    145d:	c3                   	ret    

0000145e <unlink>:
    145e:	b8 12 00 00 00       	mov    $0x12,%eax
    1463:	cd 40                	int    $0x40
    1465:	c3                   	ret    

00001466 <fstat>:
    1466:	b8 08 00 00 00       	mov    $0x8,%eax
    146b:	cd 40                	int    $0x40
    146d:	c3                   	ret    

0000146e <link>:
    146e:	b8 13 00 00 00       	mov    $0x13,%eax
    1473:	cd 40                	int    $0x40
    1475:	c3                   	ret    

00001476 <mkdir>:
    1476:	b8 14 00 00 00       	mov    $0x14,%eax
    147b:	cd 40                	int    $0x40
    147d:	c3                   	ret    

0000147e <chdir>:
    147e:	b8 09 00 00 00       	mov    $0x9,%eax
    1483:	cd 40                	int    $0x40
    1485:	c3                   	ret    

00001486 <dup>:
    1486:	b8 0a 00 00 00       	mov    $0xa,%eax
    148b:	cd 40                	int    $0x40
    148d:	c3                   	ret    

0000148e <getpid>:
    148e:	b8 0b 00 00 00       	mov    $0xb,%eax
    1493:	cd 40                	int    $0x40
    1495:	c3                   	ret    

00001496 <sbrk>:
    1496:	b8 0c 00 00 00       	mov    $0xc,%eax
    149b:	cd 40                	int    $0x40
    149d:	c3                   	ret    

0000149e <sleep>:
    149e:	b8 0d 00 00 00       	mov    $0xd,%eax
    14a3:	cd 40                	int    $0x40
    14a5:	c3                   	ret    

000014a6 <uptime>:
    14a6:	b8 0e 00 00 00       	mov    $0xe,%eax
    14ab:	cd 40                	int    $0x40
    14ad:	c3                   	ret    

000014ae <settickets>:
    14ae:	b8 16 00 00 00       	mov    $0x16,%eax
    14b3:	cd 40                	int    $0x40
    14b5:	c3                   	ret    

000014b6 <getpinfo>:
    14b6:	b8 17 00 00 00       	mov    $0x17,%eax
    14bb:	cd 40                	int    $0x40
    14bd:	c3                   	ret    
    14be:	66 90                	xchg   %ax,%ax

000014c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    14c0:	55                   	push   %ebp
    14c1:	89 e5                	mov    %esp,%ebp
    14c3:	57                   	push   %edi
    14c4:	56                   	push   %esi
    14c5:	53                   	push   %ebx
    14c6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    14c9:	85 d2                	test   %edx,%edx
{
    14cb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    14ce:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    14d0:	79 76                	jns    1548 <printint+0x88>
    14d2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    14d6:	74 70                	je     1548 <printint+0x88>
    x = -xx;
    14d8:	f7 d8                	neg    %eax
    neg = 1;
    14da:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    14e1:	31 f6                	xor    %esi,%esi
    14e3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    14e6:	eb 0a                	jmp    14f2 <printint+0x32>
    14e8:	90                   	nop
    14e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    14f0:	89 fe                	mov    %edi,%esi
    14f2:	31 d2                	xor    %edx,%edx
    14f4:	8d 7e 01             	lea    0x1(%esi),%edi
    14f7:	f7 f1                	div    %ecx
    14f9:	0f b6 92 58 17 00 00 	movzbl 0x1758(%edx),%edx
  }while((x /= base) != 0);
    1500:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1502:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1505:	75 e9                	jne    14f0 <printint+0x30>
  if(neg)
    1507:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    150a:	85 c0                	test   %eax,%eax
    150c:	74 08                	je     1516 <printint+0x56>
    buf[i++] = '-';
    150e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1513:	8d 7e 02             	lea    0x2(%esi),%edi
    1516:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    151a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    151d:	8d 76 00             	lea    0x0(%esi),%esi
    1520:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1523:	83 ec 04             	sub    $0x4,%esp
    1526:	83 ee 01             	sub    $0x1,%esi
    1529:	6a 01                	push   $0x1
    152b:	53                   	push   %ebx
    152c:	57                   	push   %edi
    152d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1530:	e8 f9 fe ff ff       	call   142e <write>

  while(--i >= 0)
    1535:	83 c4 10             	add    $0x10,%esp
    1538:	39 de                	cmp    %ebx,%esi
    153a:	75 e4                	jne    1520 <printint+0x60>
    putc(fd, buf[i]);
}
    153c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    153f:	5b                   	pop    %ebx
    1540:	5e                   	pop    %esi
    1541:	5f                   	pop    %edi
    1542:	5d                   	pop    %ebp
    1543:	c3                   	ret    
    1544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1548:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    154f:	eb 90                	jmp    14e1 <printint+0x21>
    1551:	eb 0d                	jmp    1560 <printf>
    1553:	90                   	nop
    1554:	90                   	nop
    1555:	90                   	nop
    1556:	90                   	nop
    1557:	90                   	nop
    1558:	90                   	nop
    1559:	90                   	nop
    155a:	90                   	nop
    155b:	90                   	nop
    155c:	90                   	nop
    155d:	90                   	nop
    155e:	90                   	nop
    155f:	90                   	nop

00001560 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1560:	55                   	push   %ebp
    1561:	89 e5                	mov    %esp,%ebp
    1563:	57                   	push   %edi
    1564:	56                   	push   %esi
    1565:	53                   	push   %ebx
    1566:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1569:	8b 75 0c             	mov    0xc(%ebp),%esi
    156c:	0f b6 1e             	movzbl (%esi),%ebx
    156f:	84 db                	test   %bl,%bl
    1571:	0f 84 bf 00 00 00    	je     1636 <printf+0xd6>
    1577:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    157a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    157d:	31 d2                	xor    %edx,%edx
    157f:	eb 39                	jmp    15ba <printf+0x5a>
    1581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1588:	83 f8 25             	cmp    $0x25,%eax
    158b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    158e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1593:	74 1a                	je     15af <printf+0x4f>
  write(fd, &c, 1);
    1595:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1598:	83 ec 04             	sub    $0x4,%esp
    159b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    159e:	6a 01                	push   $0x1
    15a0:	50                   	push   %eax
    15a1:	ff 75 08             	pushl  0x8(%ebp)
    15a4:	e8 85 fe ff ff       	call   142e <write>
    15a9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    15ac:	83 c4 10             	add    $0x10,%esp
    15af:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    15b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    15b6:	84 db                	test   %bl,%bl
    15b8:	74 7c                	je     1636 <printf+0xd6>
    if(state == 0){
    15ba:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    15bc:	0f be cb             	movsbl %bl,%ecx
    15bf:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    15c2:	74 c4                	je     1588 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    15c4:	83 fa 25             	cmp    $0x25,%edx
    15c7:	75 e6                	jne    15af <printf+0x4f>
      if(c == 'd'){
    15c9:	83 f8 64             	cmp    $0x64,%eax
    15cc:	0f 84 a6 00 00 00    	je     1678 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    15d2:	83 f8 6c             	cmp    $0x6c,%eax
    15d5:	0f 84 ad 00 00 00    	je     1688 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    15db:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    15e1:	83 f9 70             	cmp    $0x70,%ecx
    15e4:	74 5a                	je     1640 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    15e6:	83 f8 73             	cmp    $0x73,%eax
    15e9:	0f 84 e1 00 00 00    	je     16d0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    15ef:	83 f8 63             	cmp    $0x63,%eax
    15f2:	0f 84 28 01 00 00    	je     1720 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    15f8:	83 f8 25             	cmp    $0x25,%eax
    15fb:	74 6b                	je     1668 <printf+0x108>
  write(fd, &c, 1);
    15fd:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1600:	83 ec 04             	sub    $0x4,%esp
    1603:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1607:	6a 01                	push   $0x1
    1609:	50                   	push   %eax
    160a:	ff 75 08             	pushl  0x8(%ebp)
    160d:	e8 1c fe ff ff       	call   142e <write>
    1612:	83 c4 0c             	add    $0xc,%esp
    1615:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1618:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    161b:	6a 01                	push   $0x1
    161d:	50                   	push   %eax
    161e:	ff 75 08             	pushl  0x8(%ebp)
    1621:	83 c6 01             	add    $0x1,%esi
    1624:	e8 05 fe ff ff       	call   142e <write>
  for(i = 0; fmt[i]; i++){
    1629:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    162d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1630:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1632:	84 db                	test   %bl,%bl
    1634:	75 84                	jne    15ba <printf+0x5a>
    }
  }
}
    1636:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1639:	5b                   	pop    %ebx
    163a:	5e                   	pop    %esi
    163b:	5f                   	pop    %edi
    163c:	5d                   	pop    %ebp
    163d:	c3                   	ret    
    163e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1640:	83 ec 0c             	sub    $0xc,%esp
    1643:	b9 10 00 00 00       	mov    $0x10,%ecx
    1648:	6a 00                	push   $0x0
    164a:	8b 17                	mov    (%edi),%edx
    164c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    164f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1652:	e8 69 fe ff ff       	call   14c0 <printint>
    1657:	83 c4 10             	add    $0x10,%esp
      state = 0;
    165a:	31 d2                	xor    %edx,%edx
    165c:	e9 4e ff ff ff       	jmp    15af <printf+0x4f>
    1661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1668:	83 ec 04             	sub    $0x4,%esp
    166b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    166e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1671:	6a 01                	push   $0x1
    1673:	eb a8                	jmp    161d <printf+0xbd>
    1675:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1678:	83 ec 0c             	sub    $0xc,%esp
    167b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1680:	6a 01                	push   $0x1
    1682:	eb c6                	jmp    164a <printf+0xea>
    1684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1688:	8b 57 04             	mov    0x4(%edi),%edx
    168b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    168d:	85 d2                	test   %edx,%edx
    168f:	74 15                	je     16a6 <printf+0x146>
    1691:	83 ec 0c             	sub    $0xc,%esp
    1694:	8b 45 08             	mov    0x8(%ebp),%eax
    1697:	b9 10 00 00 00       	mov    $0x10,%ecx
    169c:	6a 00                	push   $0x0
    169e:	e8 1d fe ff ff       	call   14c0 <printint>
    16a3:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    16a6:	83 ec 0c             	sub    $0xc,%esp
    16a9:	8b 45 08             	mov    0x8(%ebp),%eax
    16ac:	89 da                	mov    %ebx,%edx
    16ae:	6a 00                	push   $0x0
    16b0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    16b5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    16b8:	e8 03 fe ff ff       	call   14c0 <printint>
    16bd:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16c0:	31 d2                	xor    %edx,%edx
    16c2:	e9 e8 fe ff ff       	jmp    15af <printf+0x4f>
    16c7:	89 f6                	mov    %esi,%esi
    16c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    16d0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    16d2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    16d5:	85 c9                	test   %ecx,%ecx
    16d7:	74 6a                	je     1743 <printf+0x1e3>
        while(*s != 0){
    16d9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    16dc:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    16de:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    16e0:	84 c0                	test   %al,%al
    16e2:	0f 84 c7 fe ff ff    	je     15af <printf+0x4f>
    16e8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    16eb:	89 de                	mov    %ebx,%esi
    16ed:	8b 5d 08             	mov    0x8(%ebp),%ebx
    16f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    16f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    16f6:	83 ec 04             	sub    $0x4,%esp
    16f9:	6a 01                	push   $0x1
          s++;
    16fb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    16fe:	50                   	push   %eax
    16ff:	53                   	push   %ebx
    1700:	e8 29 fd ff ff       	call   142e <write>
        while(*s != 0){
    1705:	0f b6 06             	movzbl (%esi),%eax
    1708:	83 c4 10             	add    $0x10,%esp
    170b:	84 c0                	test   %al,%al
    170d:	75 e1                	jne    16f0 <printf+0x190>
    170f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1712:	31 d2                	xor    %edx,%edx
    1714:	e9 96 fe ff ff       	jmp    15af <printf+0x4f>
    1719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1720:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1722:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1725:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1728:	6a 01                	push   $0x1
        putc(fd, *ap);
    172a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    172d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1730:	50                   	push   %eax
    1731:	ff 75 08             	pushl  0x8(%ebp)
    1734:	e8 f5 fc ff ff       	call   142e <write>
    1739:	83 c4 10             	add    $0x10,%esp
      state = 0;
    173c:	31 d2                	xor    %edx,%edx
    173e:	e9 6c fe ff ff       	jmp    15af <printf+0x4f>
          s = "(null)";
    1743:	bb 50 17 00 00       	mov    $0x1750,%ebx
        while(*s != 0){
    1748:	b8 28 00 00 00       	mov    $0x28,%eax
    174d:	eb 99                	jmp    16e8 <printf+0x188>
