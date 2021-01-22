
_echo:     file format elf32-i386


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
    100d:	56                   	push   %esi
    100e:	53                   	push   %ebx
    100f:	51                   	push   %ecx
    1010:	83 ec 0c             	sub    $0xc,%esp
    1013:	8b 01                	mov    (%ecx),%eax
    1015:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  for(i = 1; i < argc; i++)
    1018:	83 f8 01             	cmp    $0x1,%eax
    101b:	7e 3f                	jle    105c <main+0x5c>
    101d:	8d 5a 04             	lea    0x4(%edx),%ebx
    1020:	8d 34 82             	lea    (%edx,%eax,4),%esi
    1023:	eb 18                	jmp    103d <main+0x3d>
    1025:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
    1028:	68 90 17 00 00       	push   $0x1790
    102d:	50                   	push   %eax
    102e:	68 92 17 00 00       	push   $0x1792
    1033:	6a 01                	push   $0x1
    1035:	e8 66 05 00 00       	call   15a0 <printf>
    103a:	83 c4 10             	add    $0x10,%esp
    103d:	83 c3 04             	add    $0x4,%ebx
    1040:	8b 43 fc             	mov    -0x4(%ebx),%eax
    1043:	39 f3                	cmp    %esi,%ebx
    1045:	75 e1                	jne    1028 <main+0x28>
    1047:	68 97 17 00 00       	push   $0x1797
    104c:	50                   	push   %eax
    104d:	68 92 17 00 00       	push   $0x1792
    1052:	6a 01                	push   $0x1
    1054:	e8 47 05 00 00       	call   15a0 <printf>
    1059:	83 c4 10             	add    $0x10,%esp
  exit();
    105c:	e8 ed 03 00 00       	call   144e <exit>
    1061:	66 90                	xchg   %ax,%ax
    1063:	66 90                	xchg   %ax,%ax
    1065:	66 90                	xchg   %ax,%ax
    1067:	66 90                	xchg   %ax,%ax
    1069:	66 90                	xchg   %ax,%ax
    106b:	66 90                	xchg   %ax,%ax
    106d:	66 90                	xchg   %ax,%ax
    106f:	90                   	nop

00001070 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    1070:	55                   	push   %ebp
    1071:	89 e5                	mov    %esp,%ebp
    1073:	53                   	push   %ebx
    1074:	8b 45 08             	mov    0x8(%ebp),%eax
    1077:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    107a:	89 c2                	mov    %eax,%edx
    107c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1080:	83 c1 01             	add    $0x1,%ecx
    1083:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1087:	83 c2 01             	add    $0x1,%edx
    108a:	84 db                	test   %bl,%bl
    108c:	88 5a ff             	mov    %bl,-0x1(%edx)
    108f:	75 ef                	jne    1080 <strcpy+0x10>
    ;
  return os;
}
    1091:	5b                   	pop    %ebx
    1092:	5d                   	pop    %ebp
    1093:	c3                   	ret    
    1094:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    109a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	53                   	push   %ebx
    10a4:	8b 55 08             	mov    0x8(%ebp),%edx
    10a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10aa:	0f b6 02             	movzbl (%edx),%eax
    10ad:	0f b6 19             	movzbl (%ecx),%ebx
    10b0:	84 c0                	test   %al,%al
    10b2:	75 1c                	jne    10d0 <strcmp+0x30>
    10b4:	eb 2a                	jmp    10e0 <strcmp+0x40>
    10b6:	8d 76 00             	lea    0x0(%esi),%esi
    10b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10c0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10c6:	83 c1 01             	add    $0x1,%ecx
    10c9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    10cc:	84 c0                	test   %al,%al
    10ce:	74 10                	je     10e0 <strcmp+0x40>
    10d0:	38 d8                	cmp    %bl,%al
    10d2:	74 ec                	je     10c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10d4:	29 d8                	sub    %ebx,%eax
}
    10d6:	5b                   	pop    %ebx
    10d7:	5d                   	pop    %ebp
    10d8:	c3                   	ret    
    10d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10e2:	29 d8                	sub    %ebx,%eax
}
    10e4:	5b                   	pop    %ebx
    10e5:	5d                   	pop    %ebp
    10e6:	c3                   	ret    
    10e7:	89 f6                	mov    %esi,%esi
    10e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010f0 <strlen>:

uint
strlen(const char *s)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10f6:	80 39 00             	cmpb   $0x0,(%ecx)
    10f9:	74 15                	je     1110 <strlen+0x20>
    10fb:	31 d2                	xor    %edx,%edx
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
    1100:	83 c2 01             	add    $0x1,%edx
    1103:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1107:	89 d0                	mov    %edx,%eax
    1109:	75 f5                	jne    1100 <strlen+0x10>
    ;
  return n;
}
    110b:	5d                   	pop    %ebp
    110c:	c3                   	ret    
    110d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1110:	31 c0                	xor    %eax,%eax
}
    1112:	5d                   	pop    %ebp
    1113:	c3                   	ret    
    1114:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    111a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001120 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	57                   	push   %edi
    1124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1127:	8b 4d 10             	mov    0x10(%ebp),%ecx
    112a:	8b 45 0c             	mov    0xc(%ebp),%eax
    112d:	89 d7                	mov    %edx,%edi
    112f:	fc                   	cld    
    1130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1132:	89 d0                	mov    %edx,%eax
    1134:	5f                   	pop    %edi
    1135:	5d                   	pop    %ebp
    1136:	c3                   	ret    
    1137:	89 f6                	mov    %esi,%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001140 <strchr>:

char*
strchr(const char *s, char c)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	53                   	push   %ebx
    1144:	8b 45 08             	mov    0x8(%ebp),%eax
    1147:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    114a:	0f b6 10             	movzbl (%eax),%edx
    114d:	84 d2                	test   %dl,%dl
    114f:	74 1d                	je     116e <strchr+0x2e>
    if(*s == c)
    1151:	38 d3                	cmp    %dl,%bl
    1153:	89 d9                	mov    %ebx,%ecx
    1155:	75 0d                	jne    1164 <strchr+0x24>
    1157:	eb 17                	jmp    1170 <strchr+0x30>
    1159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1160:	38 ca                	cmp    %cl,%dl
    1162:	74 0c                	je     1170 <strchr+0x30>
  for(; *s; s++)
    1164:	83 c0 01             	add    $0x1,%eax
    1167:	0f b6 10             	movzbl (%eax),%edx
    116a:	84 d2                	test   %dl,%dl
    116c:	75 f2                	jne    1160 <strchr+0x20>
      return (char*)s;
  return 0;
    116e:	31 c0                	xor    %eax,%eax
}
    1170:	5b                   	pop    %ebx
    1171:	5d                   	pop    %ebp
    1172:	c3                   	ret    
    1173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001180 <gets>:

char*
gets(char *buf, int max)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	57                   	push   %edi
    1184:	56                   	push   %esi
    1185:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1186:	31 f6                	xor    %esi,%esi
    1188:	89 f3                	mov    %esi,%ebx
{
    118a:	83 ec 1c             	sub    $0x1c,%esp
    118d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1190:	eb 2f                	jmp    11c1 <gets+0x41>
    1192:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1198:	8d 45 e7             	lea    -0x19(%ebp),%eax
    119b:	83 ec 04             	sub    $0x4,%esp
    119e:	6a 01                	push   $0x1
    11a0:	50                   	push   %eax
    11a1:	6a 00                	push   $0x0
    11a3:	e8 be 02 00 00       	call   1466 <read>
    if(cc < 1)
    11a8:	83 c4 10             	add    $0x10,%esp
    11ab:	85 c0                	test   %eax,%eax
    11ad:	7e 1c                	jle    11cb <gets+0x4b>
      break;
    buf[i++] = c;
    11af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11b3:	83 c7 01             	add    $0x1,%edi
    11b6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11b9:	3c 0a                	cmp    $0xa,%al
    11bb:	74 23                	je     11e0 <gets+0x60>
    11bd:	3c 0d                	cmp    $0xd,%al
    11bf:	74 1f                	je     11e0 <gets+0x60>
  for(i=0; i+1 < max; ){
    11c1:	83 c3 01             	add    $0x1,%ebx
    11c4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11c7:	89 fe                	mov    %edi,%esi
    11c9:	7c cd                	jl     1198 <gets+0x18>
    11cb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11cd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11d0:	c6 03 00             	movb   $0x0,(%ebx)
}
    11d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11d6:	5b                   	pop    %ebx
    11d7:	5e                   	pop    %esi
    11d8:	5f                   	pop    %edi
    11d9:	5d                   	pop    %ebp
    11da:	c3                   	ret    
    11db:	90                   	nop
    11dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11e0:	8b 75 08             	mov    0x8(%ebp),%esi
    11e3:	8b 45 08             	mov    0x8(%ebp),%eax
    11e6:	01 de                	add    %ebx,%esi
    11e8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11ea:	c6 03 00             	movb   $0x0,(%ebx)
}
    11ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11f0:	5b                   	pop    %ebx
    11f1:	5e                   	pop    %esi
    11f2:	5f                   	pop    %edi
    11f3:	5d                   	pop    %ebp
    11f4:	c3                   	ret    
    11f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001200 <stat>:

int
stat(const char *n, struct stat *st)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	56                   	push   %esi
    1204:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1205:	83 ec 08             	sub    $0x8,%esp
    1208:	6a 00                	push   $0x0
    120a:	ff 75 08             	pushl  0x8(%ebp)
    120d:	e8 7c 02 00 00       	call   148e <open>
  if(fd < 0)
    1212:	83 c4 10             	add    $0x10,%esp
    1215:	85 c0                	test   %eax,%eax
    1217:	78 27                	js     1240 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1219:	83 ec 08             	sub    $0x8,%esp
    121c:	ff 75 0c             	pushl  0xc(%ebp)
    121f:	89 c3                	mov    %eax,%ebx
    1221:	50                   	push   %eax
    1222:	e8 7f 02 00 00       	call   14a6 <fstat>
  close(fd);
    1227:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    122a:	89 c6                	mov    %eax,%esi
  close(fd);
    122c:	e8 45 02 00 00       	call   1476 <close>
  return r;
    1231:	83 c4 10             	add    $0x10,%esp
}
    1234:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1237:	89 f0                	mov    %esi,%eax
    1239:	5b                   	pop    %ebx
    123a:	5e                   	pop    %esi
    123b:	5d                   	pop    %ebp
    123c:	c3                   	ret    
    123d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1240:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1245:	eb ed                	jmp    1234 <stat+0x34>
    1247:	89 f6                	mov    %esi,%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001250 <atoi>:

int
atoi(const char *s)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	53                   	push   %ebx
    1254:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1257:	0f be 11             	movsbl (%ecx),%edx
    125a:	8d 42 d0             	lea    -0x30(%edx),%eax
    125d:	3c 09                	cmp    $0x9,%al
  n = 0;
    125f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1264:	77 1f                	ja     1285 <atoi+0x35>
    1266:	8d 76 00             	lea    0x0(%esi),%esi
    1269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1270:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1273:	83 c1 01             	add    $0x1,%ecx
    1276:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    127a:	0f be 11             	movsbl (%ecx),%edx
    127d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1280:	80 fb 09             	cmp    $0x9,%bl
    1283:	76 eb                	jbe    1270 <atoi+0x20>
  return n;
}
    1285:	5b                   	pop    %ebx
    1286:	5d                   	pop    %ebp
    1287:	c3                   	ret    
    1288:	90                   	nop
    1289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	56                   	push   %esi
    1294:	53                   	push   %ebx
    1295:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1298:	8b 45 08             	mov    0x8(%ebp),%eax
    129b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    129e:	85 db                	test   %ebx,%ebx
    12a0:	7e 14                	jle    12b6 <memmove+0x26>
    12a2:	31 d2                	xor    %edx,%edx
    12a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    12a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    12ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    12af:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    12b2:	39 d3                	cmp    %edx,%ebx
    12b4:	75 f2                	jne    12a8 <memmove+0x18>
  return vdst;
}
    12b6:	5b                   	pop    %ebx
    12b7:	5e                   	pop    %esi
    12b8:	5d                   	pop    %ebp
    12b9:	c3                   	ret    
    12ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000012c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12c1:	a1 4c 1a 00 00       	mov    0x1a4c,%eax
{
    12c6:	89 e5                	mov    %esp,%ebp
    12c8:	57                   	push   %edi
    12c9:	56                   	push   %esi
    12ca:	53                   	push   %ebx
    12cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    12ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    12d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12d8:	39 c8                	cmp    %ecx,%eax
    12da:	8b 10                	mov    (%eax),%edx
    12dc:	73 32                	jae    1310 <free+0x50>
    12de:	39 d1                	cmp    %edx,%ecx
    12e0:	72 04                	jb     12e6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12e2:	39 d0                	cmp    %edx,%eax
    12e4:	72 32                	jb     1318 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    12e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12ec:	39 fa                	cmp    %edi,%edx
    12ee:	74 30                	je     1320 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    12f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    12f3:	8b 50 04             	mov    0x4(%eax),%edx
    12f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    12f9:	39 f1                	cmp    %esi,%ecx
    12fb:	74 3a                	je     1337 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    12fd:	89 08                	mov    %ecx,(%eax)
  freep = p;
    12ff:	a3 4c 1a 00 00       	mov    %eax,0x1a4c
}
    1304:	5b                   	pop    %ebx
    1305:	5e                   	pop    %esi
    1306:	5f                   	pop    %edi
    1307:	5d                   	pop    %ebp
    1308:	c3                   	ret    
    1309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1310:	39 d0                	cmp    %edx,%eax
    1312:	72 04                	jb     1318 <free+0x58>
    1314:	39 d1                	cmp    %edx,%ecx
    1316:	72 ce                	jb     12e6 <free+0x26>
{
    1318:	89 d0                	mov    %edx,%eax
    131a:	eb bc                	jmp    12d8 <free+0x18>
    131c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1320:	03 72 04             	add    0x4(%edx),%esi
    1323:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1326:	8b 10                	mov    (%eax),%edx
    1328:	8b 12                	mov    (%edx),%edx
    132a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    132d:	8b 50 04             	mov    0x4(%eax),%edx
    1330:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1333:	39 f1                	cmp    %esi,%ecx
    1335:	75 c6                	jne    12fd <free+0x3d>
    p->s.size += bp->s.size;
    1337:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    133a:	a3 4c 1a 00 00       	mov    %eax,0x1a4c
    p->s.size += bp->s.size;
    133f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1342:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1345:	89 10                	mov    %edx,(%eax)
}
    1347:	5b                   	pop    %ebx
    1348:	5e                   	pop    %esi
    1349:	5f                   	pop    %edi
    134a:	5d                   	pop    %ebp
    134b:	c3                   	ret    
    134c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001350 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	57                   	push   %edi
    1354:	56                   	push   %esi
    1355:	53                   	push   %ebx
    1356:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1359:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    135c:	8b 15 4c 1a 00 00    	mov    0x1a4c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1362:	8d 78 07             	lea    0x7(%eax),%edi
    1365:	c1 ef 03             	shr    $0x3,%edi
    1368:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    136b:	85 d2                	test   %edx,%edx
    136d:	0f 84 9d 00 00 00    	je     1410 <malloc+0xc0>
    1373:	8b 02                	mov    (%edx),%eax
    1375:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1378:	39 cf                	cmp    %ecx,%edi
    137a:	76 6c                	jbe    13e8 <malloc+0x98>
    137c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1382:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1387:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    138a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1391:	eb 0e                	jmp    13a1 <malloc+0x51>
    1393:	90                   	nop
    1394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1398:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    139a:	8b 48 04             	mov    0x4(%eax),%ecx
    139d:	39 f9                	cmp    %edi,%ecx
    139f:	73 47                	jae    13e8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    13a1:	39 05 4c 1a 00 00    	cmp    %eax,0x1a4c
    13a7:	89 c2                	mov    %eax,%edx
    13a9:	75 ed                	jne    1398 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    13ab:	83 ec 0c             	sub    $0xc,%esp
    13ae:	56                   	push   %esi
    13af:	e8 22 01 00 00       	call   14d6 <sbrk>
  if(p == (char*)-1)
    13b4:	83 c4 10             	add    $0x10,%esp
    13b7:	83 f8 ff             	cmp    $0xffffffff,%eax
    13ba:	74 1c                	je     13d8 <malloc+0x88>
  hp->s.size = nu;
    13bc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    13bf:	83 ec 0c             	sub    $0xc,%esp
    13c2:	83 c0 08             	add    $0x8,%eax
    13c5:	50                   	push   %eax
    13c6:	e8 f5 fe ff ff       	call   12c0 <free>
  return freep;
    13cb:	8b 15 4c 1a 00 00    	mov    0x1a4c,%edx
      if((p = morecore(nunits)) == 0)
    13d1:	83 c4 10             	add    $0x10,%esp
    13d4:	85 d2                	test   %edx,%edx
    13d6:	75 c0                	jne    1398 <malloc+0x48>
        return 0;
  }
}
    13d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    13db:	31 c0                	xor    %eax,%eax
}
    13dd:	5b                   	pop    %ebx
    13de:	5e                   	pop    %esi
    13df:	5f                   	pop    %edi
    13e0:	5d                   	pop    %ebp
    13e1:	c3                   	ret    
    13e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    13e8:	39 cf                	cmp    %ecx,%edi
    13ea:	74 54                	je     1440 <malloc+0xf0>
        p->s.size -= nunits;
    13ec:	29 f9                	sub    %edi,%ecx
    13ee:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    13f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    13f4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    13f7:	89 15 4c 1a 00 00    	mov    %edx,0x1a4c
}
    13fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1400:	83 c0 08             	add    $0x8,%eax
}
    1403:	5b                   	pop    %ebx
    1404:	5e                   	pop    %esi
    1405:	5f                   	pop    %edi
    1406:	5d                   	pop    %ebp
    1407:	c3                   	ret    
    1408:	90                   	nop
    1409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1410:	c7 05 4c 1a 00 00 50 	movl   $0x1a50,0x1a4c
    1417:	1a 00 00 
    141a:	c7 05 50 1a 00 00 50 	movl   $0x1a50,0x1a50
    1421:	1a 00 00 
    base.s.size = 0;
    1424:	b8 50 1a 00 00       	mov    $0x1a50,%eax
    1429:	c7 05 54 1a 00 00 00 	movl   $0x0,0x1a54
    1430:	00 00 00 
    1433:	e9 44 ff ff ff       	jmp    137c <malloc+0x2c>
    1438:	90                   	nop
    1439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1440:	8b 08                	mov    (%eax),%ecx
    1442:	89 0a                	mov    %ecx,(%edx)
    1444:	eb b1                	jmp    13f7 <malloc+0xa7>

00001446 <fork>:
    1446:	b8 01 00 00 00       	mov    $0x1,%eax
    144b:	cd 40                	int    $0x40
    144d:	c3                   	ret    

0000144e <exit>:
    144e:	b8 02 00 00 00       	mov    $0x2,%eax
    1453:	cd 40                	int    $0x40
    1455:	c3                   	ret    

00001456 <wait>:
    1456:	b8 03 00 00 00       	mov    $0x3,%eax
    145b:	cd 40                	int    $0x40
    145d:	c3                   	ret    

0000145e <pipe>:
    145e:	b8 04 00 00 00       	mov    $0x4,%eax
    1463:	cd 40                	int    $0x40
    1465:	c3                   	ret    

00001466 <read>:
    1466:	b8 05 00 00 00       	mov    $0x5,%eax
    146b:	cd 40                	int    $0x40
    146d:	c3                   	ret    

0000146e <write>:
    146e:	b8 10 00 00 00       	mov    $0x10,%eax
    1473:	cd 40                	int    $0x40
    1475:	c3                   	ret    

00001476 <close>:
    1476:	b8 15 00 00 00       	mov    $0x15,%eax
    147b:	cd 40                	int    $0x40
    147d:	c3                   	ret    

0000147e <kill>:
    147e:	b8 06 00 00 00       	mov    $0x6,%eax
    1483:	cd 40                	int    $0x40
    1485:	c3                   	ret    

00001486 <exec>:
    1486:	b8 07 00 00 00       	mov    $0x7,%eax
    148b:	cd 40                	int    $0x40
    148d:	c3                   	ret    

0000148e <open>:
    148e:	b8 0f 00 00 00       	mov    $0xf,%eax
    1493:	cd 40                	int    $0x40
    1495:	c3                   	ret    

00001496 <mknod>:
    1496:	b8 11 00 00 00       	mov    $0x11,%eax
    149b:	cd 40                	int    $0x40
    149d:	c3                   	ret    

0000149e <unlink>:
    149e:	b8 12 00 00 00       	mov    $0x12,%eax
    14a3:	cd 40                	int    $0x40
    14a5:	c3                   	ret    

000014a6 <fstat>:
    14a6:	b8 08 00 00 00       	mov    $0x8,%eax
    14ab:	cd 40                	int    $0x40
    14ad:	c3                   	ret    

000014ae <link>:
    14ae:	b8 13 00 00 00       	mov    $0x13,%eax
    14b3:	cd 40                	int    $0x40
    14b5:	c3                   	ret    

000014b6 <mkdir>:
    14b6:	b8 14 00 00 00       	mov    $0x14,%eax
    14bb:	cd 40                	int    $0x40
    14bd:	c3                   	ret    

000014be <chdir>:
    14be:	b8 09 00 00 00       	mov    $0x9,%eax
    14c3:	cd 40                	int    $0x40
    14c5:	c3                   	ret    

000014c6 <dup>:
    14c6:	b8 0a 00 00 00       	mov    $0xa,%eax
    14cb:	cd 40                	int    $0x40
    14cd:	c3                   	ret    

000014ce <getpid>:
    14ce:	b8 0b 00 00 00       	mov    $0xb,%eax
    14d3:	cd 40                	int    $0x40
    14d5:	c3                   	ret    

000014d6 <sbrk>:
    14d6:	b8 0c 00 00 00       	mov    $0xc,%eax
    14db:	cd 40                	int    $0x40
    14dd:	c3                   	ret    

000014de <sleep>:
    14de:	b8 0d 00 00 00       	mov    $0xd,%eax
    14e3:	cd 40                	int    $0x40
    14e5:	c3                   	ret    

000014e6 <uptime>:
    14e6:	b8 0e 00 00 00       	mov    $0xe,%eax
    14eb:	cd 40                	int    $0x40
    14ed:	c3                   	ret    

000014ee <settickets>:
    14ee:	b8 16 00 00 00       	mov    $0x16,%eax
    14f3:	cd 40                	int    $0x40
    14f5:	c3                   	ret    

000014f6 <getpinfo>:
    14f6:	b8 17 00 00 00       	mov    $0x17,%eax
    14fb:	cd 40                	int    $0x40
    14fd:	c3                   	ret    
    14fe:	66 90                	xchg   %ax,%ax

00001500 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1500:	55                   	push   %ebp
    1501:	89 e5                	mov    %esp,%ebp
    1503:	57                   	push   %edi
    1504:	56                   	push   %esi
    1505:	53                   	push   %ebx
    1506:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1509:	85 d2                	test   %edx,%edx
{
    150b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    150e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1510:	79 76                	jns    1588 <printint+0x88>
    1512:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1516:	74 70                	je     1588 <printint+0x88>
    x = -xx;
    1518:	f7 d8                	neg    %eax
    neg = 1;
    151a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1521:	31 f6                	xor    %esi,%esi
    1523:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1526:	eb 0a                	jmp    1532 <printint+0x32>
    1528:	90                   	nop
    1529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1530:	89 fe                	mov    %edi,%esi
    1532:	31 d2                	xor    %edx,%edx
    1534:	8d 7e 01             	lea    0x1(%esi),%edi
    1537:	f7 f1                	div    %ecx
    1539:	0f b6 92 a0 17 00 00 	movzbl 0x17a0(%edx),%edx
  }while((x /= base) != 0);
    1540:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1542:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1545:	75 e9                	jne    1530 <printint+0x30>
  if(neg)
    1547:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    154a:	85 c0                	test   %eax,%eax
    154c:	74 08                	je     1556 <printint+0x56>
    buf[i++] = '-';
    154e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1553:	8d 7e 02             	lea    0x2(%esi),%edi
    1556:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    155a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    155d:	8d 76 00             	lea    0x0(%esi),%esi
    1560:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1563:	83 ec 04             	sub    $0x4,%esp
    1566:	83 ee 01             	sub    $0x1,%esi
    1569:	6a 01                	push   $0x1
    156b:	53                   	push   %ebx
    156c:	57                   	push   %edi
    156d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1570:	e8 f9 fe ff ff       	call   146e <write>

  while(--i >= 0)
    1575:	83 c4 10             	add    $0x10,%esp
    1578:	39 de                	cmp    %ebx,%esi
    157a:	75 e4                	jne    1560 <printint+0x60>
    putc(fd, buf[i]);
}
    157c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    157f:	5b                   	pop    %ebx
    1580:	5e                   	pop    %esi
    1581:	5f                   	pop    %edi
    1582:	5d                   	pop    %ebp
    1583:	c3                   	ret    
    1584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1588:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    158f:	eb 90                	jmp    1521 <printint+0x21>
    1591:	eb 0d                	jmp    15a0 <printf>
    1593:	90                   	nop
    1594:	90                   	nop
    1595:	90                   	nop
    1596:	90                   	nop
    1597:	90                   	nop
    1598:	90                   	nop
    1599:	90                   	nop
    159a:	90                   	nop
    159b:	90                   	nop
    159c:	90                   	nop
    159d:	90                   	nop
    159e:	90                   	nop
    159f:	90                   	nop

000015a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    15a0:	55                   	push   %ebp
    15a1:	89 e5                	mov    %esp,%ebp
    15a3:	57                   	push   %edi
    15a4:	56                   	push   %esi
    15a5:	53                   	push   %ebx
    15a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15a9:	8b 75 0c             	mov    0xc(%ebp),%esi
    15ac:	0f b6 1e             	movzbl (%esi),%ebx
    15af:	84 db                	test   %bl,%bl
    15b1:	0f 84 bf 00 00 00    	je     1676 <printf+0xd6>
    15b7:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    15ba:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    15bd:	31 d2                	xor    %edx,%edx
    15bf:	eb 39                	jmp    15fa <printf+0x5a>
    15c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    15c8:	83 f8 25             	cmp    $0x25,%eax
    15cb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    15ce:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    15d3:	74 1a                	je     15ef <printf+0x4f>
  write(fd, &c, 1);
    15d5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    15d8:	83 ec 04             	sub    $0x4,%esp
    15db:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    15de:	6a 01                	push   $0x1
    15e0:	50                   	push   %eax
    15e1:	ff 75 08             	pushl  0x8(%ebp)
    15e4:	e8 85 fe ff ff       	call   146e <write>
    15e9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    15ec:	83 c4 10             	add    $0x10,%esp
    15ef:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    15f2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    15f6:	84 db                	test   %bl,%bl
    15f8:	74 7c                	je     1676 <printf+0xd6>
    if(state == 0){
    15fa:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    15fc:	0f be cb             	movsbl %bl,%ecx
    15ff:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1602:	74 c4                	je     15c8 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1604:	83 fa 25             	cmp    $0x25,%edx
    1607:	75 e6                	jne    15ef <printf+0x4f>
      if(c == 'd'){
    1609:	83 f8 64             	cmp    $0x64,%eax
    160c:	0f 84 a6 00 00 00    	je     16b8 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1612:	83 f8 6c             	cmp    $0x6c,%eax
    1615:	0f 84 ad 00 00 00    	je     16c8 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    161b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1621:	83 f9 70             	cmp    $0x70,%ecx
    1624:	74 5a                	je     1680 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1626:	83 f8 73             	cmp    $0x73,%eax
    1629:	0f 84 e1 00 00 00    	je     1710 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    162f:	83 f8 63             	cmp    $0x63,%eax
    1632:	0f 84 28 01 00 00    	je     1760 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1638:	83 f8 25             	cmp    $0x25,%eax
    163b:	74 6b                	je     16a8 <printf+0x108>
  write(fd, &c, 1);
    163d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1640:	83 ec 04             	sub    $0x4,%esp
    1643:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1647:	6a 01                	push   $0x1
    1649:	50                   	push   %eax
    164a:	ff 75 08             	pushl  0x8(%ebp)
    164d:	e8 1c fe ff ff       	call   146e <write>
    1652:	83 c4 0c             	add    $0xc,%esp
    1655:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1658:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    165b:	6a 01                	push   $0x1
    165d:	50                   	push   %eax
    165e:	ff 75 08             	pushl  0x8(%ebp)
    1661:	83 c6 01             	add    $0x1,%esi
    1664:	e8 05 fe ff ff       	call   146e <write>
  for(i = 0; fmt[i]; i++){
    1669:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    166d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1670:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1672:	84 db                	test   %bl,%bl
    1674:	75 84                	jne    15fa <printf+0x5a>
    }
  }
}
    1676:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1679:	5b                   	pop    %ebx
    167a:	5e                   	pop    %esi
    167b:	5f                   	pop    %edi
    167c:	5d                   	pop    %ebp
    167d:	c3                   	ret    
    167e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1680:	83 ec 0c             	sub    $0xc,%esp
    1683:	b9 10 00 00 00       	mov    $0x10,%ecx
    1688:	6a 00                	push   $0x0
    168a:	8b 17                	mov    (%edi),%edx
    168c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    168f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1692:	e8 69 fe ff ff       	call   1500 <printint>
    1697:	83 c4 10             	add    $0x10,%esp
      state = 0;
    169a:	31 d2                	xor    %edx,%edx
    169c:	e9 4e ff ff ff       	jmp    15ef <printf+0x4f>
    16a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    16a8:	83 ec 04             	sub    $0x4,%esp
    16ab:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    16ae:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16b1:	6a 01                	push   $0x1
    16b3:	eb a8                	jmp    165d <printf+0xbd>
    16b5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    16b8:	83 ec 0c             	sub    $0xc,%esp
    16bb:	b9 0a 00 00 00       	mov    $0xa,%ecx
    16c0:	6a 01                	push   $0x1
    16c2:	eb c6                	jmp    168a <printf+0xea>
    16c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    16c8:	8b 57 04             	mov    0x4(%edi),%edx
    16cb:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    16cd:	85 d2                	test   %edx,%edx
    16cf:	74 15                	je     16e6 <printf+0x146>
    16d1:	83 ec 0c             	sub    $0xc,%esp
    16d4:	8b 45 08             	mov    0x8(%ebp),%eax
    16d7:	b9 10 00 00 00       	mov    $0x10,%ecx
    16dc:	6a 00                	push   $0x0
    16de:	e8 1d fe ff ff       	call   1500 <printint>
    16e3:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    16e6:	83 ec 0c             	sub    $0xc,%esp
    16e9:	8b 45 08             	mov    0x8(%ebp),%eax
    16ec:	89 da                	mov    %ebx,%edx
    16ee:	6a 00                	push   $0x0
    16f0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    16f5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    16f8:	e8 03 fe ff ff       	call   1500 <printint>
    16fd:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1700:	31 d2                	xor    %edx,%edx
    1702:	e9 e8 fe ff ff       	jmp    15ef <printf+0x4f>
    1707:	89 f6                	mov    %esi,%esi
    1709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1710:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1712:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1715:	85 c9                	test   %ecx,%ecx
    1717:	74 6a                	je     1783 <printf+0x1e3>
        while(*s != 0){
    1719:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    171c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    171e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1720:	84 c0                	test   %al,%al
    1722:	0f 84 c7 fe ff ff    	je     15ef <printf+0x4f>
    1728:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    172b:	89 de                	mov    %ebx,%esi
    172d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1730:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1733:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1736:	83 ec 04             	sub    $0x4,%esp
    1739:	6a 01                	push   $0x1
          s++;
    173b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    173e:	50                   	push   %eax
    173f:	53                   	push   %ebx
    1740:	e8 29 fd ff ff       	call   146e <write>
        while(*s != 0){
    1745:	0f b6 06             	movzbl (%esi),%eax
    1748:	83 c4 10             	add    $0x10,%esp
    174b:	84 c0                	test   %al,%al
    174d:	75 e1                	jne    1730 <printf+0x190>
    174f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1752:	31 d2                	xor    %edx,%edx
    1754:	e9 96 fe ff ff       	jmp    15ef <printf+0x4f>
    1759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1760:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1762:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1765:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1768:	6a 01                	push   $0x1
        putc(fd, *ap);
    176a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    176d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1770:	50                   	push   %eax
    1771:	ff 75 08             	pushl  0x8(%ebp)
    1774:	e8 f5 fc ff ff       	call   146e <write>
    1779:	83 c4 10             	add    $0x10,%esp
      state = 0;
    177c:	31 d2                	xor    %edx,%edx
    177e:	e9 6c fe ff ff       	jmp    15ef <printf+0x4f>
          s = "(null)";
    1783:	bb 99 17 00 00       	mov    $0x1799,%ebx
        while(*s != 0){
    1788:	b8 28 00 00 00       	mov    $0x28,%eax
    178d:	eb 99                	jmp    1728 <printf+0x188>
