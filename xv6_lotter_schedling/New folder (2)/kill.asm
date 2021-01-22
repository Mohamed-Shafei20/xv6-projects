
_kill:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	56                   	push   %esi
    100e:	53                   	push   %ebx
    100f:	51                   	push   %ecx
    1010:	83 ec 0c             	sub    $0xc,%esp
    1013:	8b 01                	mov    (%ecx),%eax
    1015:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
    1018:	83 f8 01             	cmp    $0x1,%eax
    101b:	7e 2c                	jle    1049 <main+0x49>
    101d:	8d 5a 04             	lea    0x4(%edx),%ebx
    1020:	8d 34 82             	lea    (%edx,%eax,4),%esi
    1023:	90                   	nop
    1024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
    1028:	83 ec 0c             	sub    $0xc,%esp
    102b:	ff 33                	pushl  (%ebx)
    102d:	83 c3 04             	add    $0x4,%ebx
    1030:	e8 0b 02 00 00       	call   1240 <atoi>
    1035:	89 04 24             	mov    %eax,(%esp)
    1038:	e8 31 04 00 00       	call   146e <kill>
  for(i=1; i<argc; i++)
    103d:	83 c4 10             	add    $0x10,%esp
    1040:	39 f3                	cmp    %esi,%ebx
    1042:	75 e4                	jne    1028 <main+0x28>
  exit();
    1044:	e8 f5 03 00 00       	call   143e <exit>
    printf(2, "usage: kill pid...\n");
    1049:	50                   	push   %eax
    104a:	50                   	push   %eax
    104b:	68 80 17 00 00       	push   $0x1780
    1050:	6a 02                	push   $0x2
    1052:	e8 39 05 00 00       	call   1590 <printf>
    exit();
    1057:	e8 e2 03 00 00       	call   143e <exit>
    105c:	66 90                	xchg   %ax,%ax
    105e:	66 90                	xchg   %ax,%ax

00001060 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	53                   	push   %ebx
    1064:	8b 45 08             	mov    0x8(%ebp),%eax
    1067:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    106a:	89 c2                	mov    %eax,%edx
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1070:	83 c1 01             	add    $0x1,%ecx
    1073:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1077:	83 c2 01             	add    $0x1,%edx
    107a:	84 db                	test   %bl,%bl
    107c:	88 5a ff             	mov    %bl,-0x1(%edx)
    107f:	75 ef                	jne    1070 <strcpy+0x10>
    ;
  return os;
}
    1081:	5b                   	pop    %ebx
    1082:	5d                   	pop    %ebp
    1083:	c3                   	ret    
    1084:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    108a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	53                   	push   %ebx
    1094:	8b 55 08             	mov    0x8(%ebp),%edx
    1097:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    109a:	0f b6 02             	movzbl (%edx),%eax
    109d:	0f b6 19             	movzbl (%ecx),%ebx
    10a0:	84 c0                	test   %al,%al
    10a2:	75 1c                	jne    10c0 <strcmp+0x30>
    10a4:	eb 2a                	jmp    10d0 <strcmp+0x40>
    10a6:	8d 76 00             	lea    0x0(%esi),%esi
    10a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10b0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10b6:	83 c1 01             	add    $0x1,%ecx
    10b9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    10bc:	84 c0                	test   %al,%al
    10be:	74 10                	je     10d0 <strcmp+0x40>
    10c0:	38 d8                	cmp    %bl,%al
    10c2:	74 ec                	je     10b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10c4:	29 d8                	sub    %ebx,%eax
}
    10c6:	5b                   	pop    %ebx
    10c7:	5d                   	pop    %ebp
    10c8:	c3                   	ret    
    10c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10d2:	29 d8                	sub    %ebx,%eax
}
    10d4:	5b                   	pop    %ebx
    10d5:	5d                   	pop    %ebp
    10d6:	c3                   	ret    
    10d7:	89 f6                	mov    %esi,%esi
    10d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010e0 <strlen>:

uint
strlen(const char *s)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10e6:	80 39 00             	cmpb   $0x0,(%ecx)
    10e9:	74 15                	je     1100 <strlen+0x20>
    10eb:	31 d2                	xor    %edx,%edx
    10ed:	8d 76 00             	lea    0x0(%esi),%esi
    10f0:	83 c2 01             	add    $0x1,%edx
    10f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10f7:	89 d0                	mov    %edx,%eax
    10f9:	75 f5                	jne    10f0 <strlen+0x10>
    ;
  return n;
}
    10fb:	5d                   	pop    %ebp
    10fc:	c3                   	ret    
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1100:	31 c0                	xor    %eax,%eax
}
    1102:	5d                   	pop    %ebp
    1103:	c3                   	ret    
    1104:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    110a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001110 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	57                   	push   %edi
    1114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1117:	8b 4d 10             	mov    0x10(%ebp),%ecx
    111a:	8b 45 0c             	mov    0xc(%ebp),%eax
    111d:	89 d7                	mov    %edx,%edi
    111f:	fc                   	cld    
    1120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1122:	89 d0                	mov    %edx,%eax
    1124:	5f                   	pop    %edi
    1125:	5d                   	pop    %ebp
    1126:	c3                   	ret    
    1127:	89 f6                	mov    %esi,%esi
    1129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001130 <strchr>:

char*
strchr(const char *s, char c)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	53                   	push   %ebx
    1134:	8b 45 08             	mov    0x8(%ebp),%eax
    1137:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    113a:	0f b6 10             	movzbl (%eax),%edx
    113d:	84 d2                	test   %dl,%dl
    113f:	74 1d                	je     115e <strchr+0x2e>
    if(*s == c)
    1141:	38 d3                	cmp    %dl,%bl
    1143:	89 d9                	mov    %ebx,%ecx
    1145:	75 0d                	jne    1154 <strchr+0x24>
    1147:	eb 17                	jmp    1160 <strchr+0x30>
    1149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1150:	38 ca                	cmp    %cl,%dl
    1152:	74 0c                	je     1160 <strchr+0x30>
  for(; *s; s++)
    1154:	83 c0 01             	add    $0x1,%eax
    1157:	0f b6 10             	movzbl (%eax),%edx
    115a:	84 d2                	test   %dl,%dl
    115c:	75 f2                	jne    1150 <strchr+0x20>
      return (char*)s;
  return 0;
    115e:	31 c0                	xor    %eax,%eax
}
    1160:	5b                   	pop    %ebx
    1161:	5d                   	pop    %ebp
    1162:	c3                   	ret    
    1163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001170 <gets>:

char*
gets(char *buf, int max)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	57                   	push   %edi
    1174:	56                   	push   %esi
    1175:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1176:	31 f6                	xor    %esi,%esi
    1178:	89 f3                	mov    %esi,%ebx
{
    117a:	83 ec 1c             	sub    $0x1c,%esp
    117d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1180:	eb 2f                	jmp    11b1 <gets+0x41>
    1182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1188:	8d 45 e7             	lea    -0x19(%ebp),%eax
    118b:	83 ec 04             	sub    $0x4,%esp
    118e:	6a 01                	push   $0x1
    1190:	50                   	push   %eax
    1191:	6a 00                	push   $0x0
    1193:	e8 be 02 00 00       	call   1456 <read>
    if(cc < 1)
    1198:	83 c4 10             	add    $0x10,%esp
    119b:	85 c0                	test   %eax,%eax
    119d:	7e 1c                	jle    11bb <gets+0x4b>
      break;
    buf[i++] = c;
    119f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11a3:	83 c7 01             	add    $0x1,%edi
    11a6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11a9:	3c 0a                	cmp    $0xa,%al
    11ab:	74 23                	je     11d0 <gets+0x60>
    11ad:	3c 0d                	cmp    $0xd,%al
    11af:	74 1f                	je     11d0 <gets+0x60>
  for(i=0; i+1 < max; ){
    11b1:	83 c3 01             	add    $0x1,%ebx
    11b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11b7:	89 fe                	mov    %edi,%esi
    11b9:	7c cd                	jl     1188 <gets+0x18>
    11bb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11bd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11c0:	c6 03 00             	movb   $0x0,(%ebx)
}
    11c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11c6:	5b                   	pop    %ebx
    11c7:	5e                   	pop    %esi
    11c8:	5f                   	pop    %edi
    11c9:	5d                   	pop    %ebp
    11ca:	c3                   	ret    
    11cb:	90                   	nop
    11cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11d0:	8b 75 08             	mov    0x8(%ebp),%esi
    11d3:	8b 45 08             	mov    0x8(%ebp),%eax
    11d6:	01 de                	add    %ebx,%esi
    11d8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11da:	c6 03 00             	movb   $0x0,(%ebx)
}
    11dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11e0:	5b                   	pop    %ebx
    11e1:	5e                   	pop    %esi
    11e2:	5f                   	pop    %edi
    11e3:	5d                   	pop    %ebp
    11e4:	c3                   	ret    
    11e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011f0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	56                   	push   %esi
    11f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11f5:	83 ec 08             	sub    $0x8,%esp
    11f8:	6a 00                	push   $0x0
    11fa:	ff 75 08             	pushl  0x8(%ebp)
    11fd:	e8 7c 02 00 00       	call   147e <open>
  if(fd < 0)
    1202:	83 c4 10             	add    $0x10,%esp
    1205:	85 c0                	test   %eax,%eax
    1207:	78 27                	js     1230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1209:	83 ec 08             	sub    $0x8,%esp
    120c:	ff 75 0c             	pushl  0xc(%ebp)
    120f:	89 c3                	mov    %eax,%ebx
    1211:	50                   	push   %eax
    1212:	e8 7f 02 00 00       	call   1496 <fstat>
  close(fd);
    1217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    121a:	89 c6                	mov    %eax,%esi
  close(fd);
    121c:	e8 45 02 00 00       	call   1466 <close>
  return r;
    1221:	83 c4 10             	add    $0x10,%esp
}
    1224:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1227:	89 f0                	mov    %esi,%eax
    1229:	5b                   	pop    %ebx
    122a:	5e                   	pop    %esi
    122b:	5d                   	pop    %ebp
    122c:	c3                   	ret    
    122d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1230:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1235:	eb ed                	jmp    1224 <stat+0x34>
    1237:	89 f6                	mov    %esi,%esi
    1239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001240 <atoi>:

int
atoi(const char *s)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	53                   	push   %ebx
    1244:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1247:	0f be 11             	movsbl (%ecx),%edx
    124a:	8d 42 d0             	lea    -0x30(%edx),%eax
    124d:	3c 09                	cmp    $0x9,%al
  n = 0;
    124f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1254:	77 1f                	ja     1275 <atoi+0x35>
    1256:	8d 76 00             	lea    0x0(%esi),%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1260:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1263:	83 c1 01             	add    $0x1,%ecx
    1266:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    126a:	0f be 11             	movsbl (%ecx),%edx
    126d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1270:	80 fb 09             	cmp    $0x9,%bl
    1273:	76 eb                	jbe    1260 <atoi+0x20>
  return n;
}
    1275:	5b                   	pop    %ebx
    1276:	5d                   	pop    %ebp
    1277:	c3                   	ret    
    1278:	90                   	nop
    1279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	56                   	push   %esi
    1284:	53                   	push   %ebx
    1285:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1288:	8b 45 08             	mov    0x8(%ebp),%eax
    128b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    128e:	85 db                	test   %ebx,%ebx
    1290:	7e 14                	jle    12a6 <memmove+0x26>
    1292:	31 d2                	xor    %edx,%edx
    1294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1298:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    129c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    129f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    12a2:	39 d3                	cmp    %edx,%ebx
    12a4:	75 f2                	jne    1298 <memmove+0x18>
  return vdst;
}
    12a6:	5b                   	pop    %ebx
    12a7:	5e                   	pop    %esi
    12a8:	5d                   	pop    %ebp
    12a9:	c3                   	ret    
    12aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000012b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12b1:	a1 48 1a 00 00       	mov    0x1a48,%eax
{
    12b6:	89 e5                	mov    %esp,%ebp
    12b8:	57                   	push   %edi
    12b9:	56                   	push   %esi
    12ba:	53                   	push   %ebx
    12bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    12be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    12c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12c8:	39 c8                	cmp    %ecx,%eax
    12ca:	8b 10                	mov    (%eax),%edx
    12cc:	73 32                	jae    1300 <free+0x50>
    12ce:	39 d1                	cmp    %edx,%ecx
    12d0:	72 04                	jb     12d6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12d2:	39 d0                	cmp    %edx,%eax
    12d4:	72 32                	jb     1308 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    12d6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12d9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12dc:	39 fa                	cmp    %edi,%edx
    12de:	74 30                	je     1310 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    12e0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    12e3:	8b 50 04             	mov    0x4(%eax),%edx
    12e6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    12e9:	39 f1                	cmp    %esi,%ecx
    12eb:	74 3a                	je     1327 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    12ed:	89 08                	mov    %ecx,(%eax)
  freep = p;
    12ef:	a3 48 1a 00 00       	mov    %eax,0x1a48
}
    12f4:	5b                   	pop    %ebx
    12f5:	5e                   	pop    %esi
    12f6:	5f                   	pop    %edi
    12f7:	5d                   	pop    %ebp
    12f8:	c3                   	ret    
    12f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1300:	39 d0                	cmp    %edx,%eax
    1302:	72 04                	jb     1308 <free+0x58>
    1304:	39 d1                	cmp    %edx,%ecx
    1306:	72 ce                	jb     12d6 <free+0x26>
{
    1308:	89 d0                	mov    %edx,%eax
    130a:	eb bc                	jmp    12c8 <free+0x18>
    130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1310:	03 72 04             	add    0x4(%edx),%esi
    1313:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1316:	8b 10                	mov    (%eax),%edx
    1318:	8b 12                	mov    (%edx),%edx
    131a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    131d:	8b 50 04             	mov    0x4(%eax),%edx
    1320:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1323:	39 f1                	cmp    %esi,%ecx
    1325:	75 c6                	jne    12ed <free+0x3d>
    p->s.size += bp->s.size;
    1327:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    132a:	a3 48 1a 00 00       	mov    %eax,0x1a48
    p->s.size += bp->s.size;
    132f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1332:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1335:	89 10                	mov    %edx,(%eax)
}
    1337:	5b                   	pop    %ebx
    1338:	5e                   	pop    %esi
    1339:	5f                   	pop    %edi
    133a:	5d                   	pop    %ebp
    133b:	c3                   	ret    
    133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001340 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	57                   	push   %edi
    1344:	56                   	push   %esi
    1345:	53                   	push   %ebx
    1346:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1349:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    134c:	8b 15 48 1a 00 00    	mov    0x1a48,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1352:	8d 78 07             	lea    0x7(%eax),%edi
    1355:	c1 ef 03             	shr    $0x3,%edi
    1358:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    135b:	85 d2                	test   %edx,%edx
    135d:	0f 84 9d 00 00 00    	je     1400 <malloc+0xc0>
    1363:	8b 02                	mov    (%edx),%eax
    1365:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1368:	39 cf                	cmp    %ecx,%edi
    136a:	76 6c                	jbe    13d8 <malloc+0x98>
    136c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1372:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1377:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    137a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1381:	eb 0e                	jmp    1391 <malloc+0x51>
    1383:	90                   	nop
    1384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1388:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    138a:	8b 48 04             	mov    0x4(%eax),%ecx
    138d:	39 f9                	cmp    %edi,%ecx
    138f:	73 47                	jae    13d8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1391:	39 05 48 1a 00 00    	cmp    %eax,0x1a48
    1397:	89 c2                	mov    %eax,%edx
    1399:	75 ed                	jne    1388 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    139b:	83 ec 0c             	sub    $0xc,%esp
    139e:	56                   	push   %esi
    139f:	e8 22 01 00 00       	call   14c6 <sbrk>
  if(p == (char*)-1)
    13a4:	83 c4 10             	add    $0x10,%esp
    13a7:	83 f8 ff             	cmp    $0xffffffff,%eax
    13aa:	74 1c                	je     13c8 <malloc+0x88>
  hp->s.size = nu;
    13ac:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    13af:	83 ec 0c             	sub    $0xc,%esp
    13b2:	83 c0 08             	add    $0x8,%eax
    13b5:	50                   	push   %eax
    13b6:	e8 f5 fe ff ff       	call   12b0 <free>
  return freep;
    13bb:	8b 15 48 1a 00 00    	mov    0x1a48,%edx
      if((p = morecore(nunits)) == 0)
    13c1:	83 c4 10             	add    $0x10,%esp
    13c4:	85 d2                	test   %edx,%edx
    13c6:	75 c0                	jne    1388 <malloc+0x48>
        return 0;
  }
}
    13c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    13cb:	31 c0                	xor    %eax,%eax
}
    13cd:	5b                   	pop    %ebx
    13ce:	5e                   	pop    %esi
    13cf:	5f                   	pop    %edi
    13d0:	5d                   	pop    %ebp
    13d1:	c3                   	ret    
    13d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    13d8:	39 cf                	cmp    %ecx,%edi
    13da:	74 54                	je     1430 <malloc+0xf0>
        p->s.size -= nunits;
    13dc:	29 f9                	sub    %edi,%ecx
    13de:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    13e1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    13e4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    13e7:	89 15 48 1a 00 00    	mov    %edx,0x1a48
}
    13ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    13f0:	83 c0 08             	add    $0x8,%eax
}
    13f3:	5b                   	pop    %ebx
    13f4:	5e                   	pop    %esi
    13f5:	5f                   	pop    %edi
    13f6:	5d                   	pop    %ebp
    13f7:	c3                   	ret    
    13f8:	90                   	nop
    13f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1400:	c7 05 48 1a 00 00 4c 	movl   $0x1a4c,0x1a48
    1407:	1a 00 00 
    140a:	c7 05 4c 1a 00 00 4c 	movl   $0x1a4c,0x1a4c
    1411:	1a 00 00 
    base.s.size = 0;
    1414:	b8 4c 1a 00 00       	mov    $0x1a4c,%eax
    1419:	c7 05 50 1a 00 00 00 	movl   $0x0,0x1a50
    1420:	00 00 00 
    1423:	e9 44 ff ff ff       	jmp    136c <malloc+0x2c>
    1428:	90                   	nop
    1429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1430:	8b 08                	mov    (%eax),%ecx
    1432:	89 0a                	mov    %ecx,(%edx)
    1434:	eb b1                	jmp    13e7 <malloc+0xa7>

00001436 <fork>:
    1436:	b8 01 00 00 00       	mov    $0x1,%eax
    143b:	cd 40                	int    $0x40
    143d:	c3                   	ret    

0000143e <exit>:
    143e:	b8 02 00 00 00       	mov    $0x2,%eax
    1443:	cd 40                	int    $0x40
    1445:	c3                   	ret    

00001446 <wait>:
    1446:	b8 03 00 00 00       	mov    $0x3,%eax
    144b:	cd 40                	int    $0x40
    144d:	c3                   	ret    

0000144e <pipe>:
    144e:	b8 04 00 00 00       	mov    $0x4,%eax
    1453:	cd 40                	int    $0x40
    1455:	c3                   	ret    

00001456 <read>:
    1456:	b8 05 00 00 00       	mov    $0x5,%eax
    145b:	cd 40                	int    $0x40
    145d:	c3                   	ret    

0000145e <write>:
    145e:	b8 10 00 00 00       	mov    $0x10,%eax
    1463:	cd 40                	int    $0x40
    1465:	c3                   	ret    

00001466 <close>:
    1466:	b8 15 00 00 00       	mov    $0x15,%eax
    146b:	cd 40                	int    $0x40
    146d:	c3                   	ret    

0000146e <kill>:
    146e:	b8 06 00 00 00       	mov    $0x6,%eax
    1473:	cd 40                	int    $0x40
    1475:	c3                   	ret    

00001476 <exec>:
    1476:	b8 07 00 00 00       	mov    $0x7,%eax
    147b:	cd 40                	int    $0x40
    147d:	c3                   	ret    

0000147e <open>:
    147e:	b8 0f 00 00 00       	mov    $0xf,%eax
    1483:	cd 40                	int    $0x40
    1485:	c3                   	ret    

00001486 <mknod>:
    1486:	b8 11 00 00 00       	mov    $0x11,%eax
    148b:	cd 40                	int    $0x40
    148d:	c3                   	ret    

0000148e <unlink>:
    148e:	b8 12 00 00 00       	mov    $0x12,%eax
    1493:	cd 40                	int    $0x40
    1495:	c3                   	ret    

00001496 <fstat>:
    1496:	b8 08 00 00 00       	mov    $0x8,%eax
    149b:	cd 40                	int    $0x40
    149d:	c3                   	ret    

0000149e <link>:
    149e:	b8 13 00 00 00       	mov    $0x13,%eax
    14a3:	cd 40                	int    $0x40
    14a5:	c3                   	ret    

000014a6 <mkdir>:
    14a6:	b8 14 00 00 00       	mov    $0x14,%eax
    14ab:	cd 40                	int    $0x40
    14ad:	c3                   	ret    

000014ae <chdir>:
    14ae:	b8 09 00 00 00       	mov    $0x9,%eax
    14b3:	cd 40                	int    $0x40
    14b5:	c3                   	ret    

000014b6 <dup>:
    14b6:	b8 0a 00 00 00       	mov    $0xa,%eax
    14bb:	cd 40                	int    $0x40
    14bd:	c3                   	ret    

000014be <getpid>:
    14be:	b8 0b 00 00 00       	mov    $0xb,%eax
    14c3:	cd 40                	int    $0x40
    14c5:	c3                   	ret    

000014c6 <sbrk>:
    14c6:	b8 0c 00 00 00       	mov    $0xc,%eax
    14cb:	cd 40                	int    $0x40
    14cd:	c3                   	ret    

000014ce <sleep>:
    14ce:	b8 0d 00 00 00       	mov    $0xd,%eax
    14d3:	cd 40                	int    $0x40
    14d5:	c3                   	ret    

000014d6 <uptime>:
    14d6:	b8 0e 00 00 00       	mov    $0xe,%eax
    14db:	cd 40                	int    $0x40
    14dd:	c3                   	ret    

000014de <settickets>:
    14de:	b8 16 00 00 00       	mov    $0x16,%eax
    14e3:	cd 40                	int    $0x40
    14e5:	c3                   	ret    

000014e6 <getpinfo>:
    14e6:	b8 17 00 00 00       	mov    $0x17,%eax
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
    1529:	0f b6 92 9c 17 00 00 	movzbl 0x179c(%edx),%edx
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
    1560:	e8 f9 fe ff ff       	call   145e <write>

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
    15d4:	e8 85 fe ff ff       	call   145e <write>
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
    163d:	e8 1c fe ff ff       	call   145e <write>
    1642:	83 c4 0c             	add    $0xc,%esp
    1645:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1648:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    164b:	6a 01                	push   $0x1
    164d:	50                   	push   %eax
    164e:	ff 75 08             	pushl  0x8(%ebp)
    1651:	83 c6 01             	add    $0x1,%esi
    1654:	e8 05 fe ff ff       	call   145e <write>
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
    1730:	e8 29 fd ff ff       	call   145e <write>
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
    1764:	e8 f5 fc ff ff       	call   145e <write>
    1769:	83 c4 10             	add    $0x10,%esp
      state = 0;
    176c:	31 d2                	xor    %edx,%edx
    176e:	e9 6c fe ff ff       	jmp    15df <printf+0x4f>
          s = "(null)";
    1773:	bb 94 17 00 00       	mov    $0x1794,%ebx
        while(*s != 0){
    1778:	b8 28 00 00 00       	mov    $0x28,%eax
    177d:	eb 99                	jmp    1718 <printf+0x188>
