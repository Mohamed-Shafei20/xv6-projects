
_protection_test:     file format elf32-i386


Disassembly of section .text:

00001000 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	53                   	push   %ebx
    1004:	8b 45 08             	mov    0x8(%ebp),%eax
    1007:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    100a:	89 c2                	mov    %eax,%edx
    100c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1010:	83 c1 01             	add    $0x1,%ecx
    1013:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1017:	83 c2 01             	add    $0x1,%edx
    101a:	84 db                	test   %bl,%bl
    101c:	88 5a ff             	mov    %bl,-0x1(%edx)
    101f:	75 ef                	jne    1010 <strcpy+0x10>
    ;
  return os;
}
    1021:	5b                   	pop    %ebx
    1022:	5d                   	pop    %ebp
    1023:	c3                   	ret    
    1024:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    102a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001030 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	53                   	push   %ebx
    1034:	8b 55 08             	mov    0x8(%ebp),%edx
    1037:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    103a:	0f b6 02             	movzbl (%edx),%eax
    103d:	0f b6 19             	movzbl (%ecx),%ebx
    1040:	84 c0                	test   %al,%al
    1042:	75 1c                	jne    1060 <strcmp+0x30>
    1044:	eb 2a                	jmp    1070 <strcmp+0x40>
    1046:	8d 76 00             	lea    0x0(%esi),%esi
    1049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1050:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1053:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1056:	83 c1 01             	add    $0x1,%ecx
    1059:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    105c:	84 c0                	test   %al,%al
    105e:	74 10                	je     1070 <strcmp+0x40>
    1060:	38 d8                	cmp    %bl,%al
    1062:	74 ec                	je     1050 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1064:	29 d8                	sub    %ebx,%eax
}
    1066:	5b                   	pop    %ebx
    1067:	5d                   	pop    %ebp
    1068:	c3                   	ret    
    1069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1070:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1072:	29 d8                	sub    %ebx,%eax
}
    1074:	5b                   	pop    %ebx
    1075:	5d                   	pop    %ebp
    1076:	c3                   	ret    
    1077:	89 f6                	mov    %esi,%esi
    1079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001080 <strlen>:

uint
strlen(const char *s)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1086:	80 39 00             	cmpb   $0x0,(%ecx)
    1089:	74 15                	je     10a0 <strlen+0x20>
    108b:	31 d2                	xor    %edx,%edx
    108d:	8d 76 00             	lea    0x0(%esi),%esi
    1090:	83 c2 01             	add    $0x1,%edx
    1093:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1097:	89 d0                	mov    %edx,%eax
    1099:	75 f5                	jne    1090 <strlen+0x10>
    ;
  return n;
}
    109b:	5d                   	pop    %ebp
    109c:	c3                   	ret    
    109d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    10a0:	31 c0                	xor    %eax,%eax
}
    10a2:	5d                   	pop    %ebp
    10a3:	c3                   	ret    
    10a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	57                   	push   %edi
    10b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    10bd:	89 d7                	mov    %edx,%edi
    10bf:	fc                   	cld    
    10c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10c2:	89 d0                	mov    %edx,%eax
    10c4:	5f                   	pop    %edi
    10c5:	5d                   	pop    %ebp
    10c6:	c3                   	ret    
    10c7:	89 f6                	mov    %esi,%esi
    10c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010d0 <strchr>:

char*
strchr(const char *s, char c)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	53                   	push   %ebx
    10d4:	8b 45 08             	mov    0x8(%ebp),%eax
    10d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    10da:	0f b6 10             	movzbl (%eax),%edx
    10dd:	84 d2                	test   %dl,%dl
    10df:	74 1d                	je     10fe <strchr+0x2e>
    if(*s == c)
    10e1:	38 d3                	cmp    %dl,%bl
    10e3:	89 d9                	mov    %ebx,%ecx
    10e5:	75 0d                	jne    10f4 <strchr+0x24>
    10e7:	eb 17                	jmp    1100 <strchr+0x30>
    10e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10f0:	38 ca                	cmp    %cl,%dl
    10f2:	74 0c                	je     1100 <strchr+0x30>
  for(; *s; s++)
    10f4:	83 c0 01             	add    $0x1,%eax
    10f7:	0f b6 10             	movzbl (%eax),%edx
    10fa:	84 d2                	test   %dl,%dl
    10fc:	75 f2                	jne    10f0 <strchr+0x20>
      return (char*)s;
  return 0;
    10fe:	31 c0                	xor    %eax,%eax
}
    1100:	5b                   	pop    %ebx
    1101:	5d                   	pop    %ebp
    1102:	c3                   	ret    
    1103:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001110 <gets>:

char*
gets(char *buf, int max)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	57                   	push   %edi
    1114:	56                   	push   %esi
    1115:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1116:	31 f6                	xor    %esi,%esi
    1118:	89 f3                	mov    %esi,%ebx
{
    111a:	83 ec 1c             	sub    $0x1c,%esp
    111d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1120:	eb 2f                	jmp    1151 <gets+0x41>
    1122:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1128:	8d 45 e7             	lea    -0x19(%ebp),%eax
    112b:	83 ec 04             	sub    $0x4,%esp
    112e:	6a 01                	push   $0x1
    1130:	50                   	push   %eax
    1131:	6a 00                	push   $0x0
    1133:	e8 be 02 00 00       	call   13f6 <read>
    if(cc < 1)
    1138:	83 c4 10             	add    $0x10,%esp
    113b:	85 c0                	test   %eax,%eax
    113d:	7e 1c                	jle    115b <gets+0x4b>
      break;
    buf[i++] = c;
    113f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1143:	83 c7 01             	add    $0x1,%edi
    1146:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1149:	3c 0a                	cmp    $0xa,%al
    114b:	74 23                	je     1170 <gets+0x60>
    114d:	3c 0d                	cmp    $0xd,%al
    114f:	74 1f                	je     1170 <gets+0x60>
  for(i=0; i+1 < max; ){
    1151:	83 c3 01             	add    $0x1,%ebx
    1154:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1157:	89 fe                	mov    %edi,%esi
    1159:	7c cd                	jl     1128 <gets+0x18>
    115b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    115d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1160:	c6 03 00             	movb   $0x0,(%ebx)
}
    1163:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1166:	5b                   	pop    %ebx
    1167:	5e                   	pop    %esi
    1168:	5f                   	pop    %edi
    1169:	5d                   	pop    %ebp
    116a:	c3                   	ret    
    116b:	90                   	nop
    116c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1170:	8b 75 08             	mov    0x8(%ebp),%esi
    1173:	8b 45 08             	mov    0x8(%ebp),%eax
    1176:	01 de                	add    %ebx,%esi
    1178:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    117a:	c6 03 00             	movb   $0x0,(%ebx)
}
    117d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1180:	5b                   	pop    %ebx
    1181:	5e                   	pop    %esi
    1182:	5f                   	pop    %edi
    1183:	5d                   	pop    %ebp
    1184:	c3                   	ret    
    1185:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001190 <stat>:

int
stat(const char *n, struct stat *st)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	56                   	push   %esi
    1194:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1195:	83 ec 08             	sub    $0x8,%esp
    1198:	6a 00                	push   $0x0
    119a:	ff 75 08             	pushl  0x8(%ebp)
    119d:	e8 7c 02 00 00       	call   141e <open>
  if(fd < 0)
    11a2:	83 c4 10             	add    $0x10,%esp
    11a5:	85 c0                	test   %eax,%eax
    11a7:	78 27                	js     11d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11a9:	83 ec 08             	sub    $0x8,%esp
    11ac:	ff 75 0c             	pushl  0xc(%ebp)
    11af:	89 c3                	mov    %eax,%ebx
    11b1:	50                   	push   %eax
    11b2:	e8 7f 02 00 00       	call   1436 <fstat>
  close(fd);
    11b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    11ba:	89 c6                	mov    %eax,%esi
  close(fd);
    11bc:	e8 45 02 00 00       	call   1406 <close>
  return r;
    11c1:	83 c4 10             	add    $0x10,%esp
}
    11c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11c7:	89 f0                	mov    %esi,%eax
    11c9:	5b                   	pop    %ebx
    11ca:	5e                   	pop    %esi
    11cb:	5d                   	pop    %ebp
    11cc:	c3                   	ret    
    11cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    11d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    11d5:	eb ed                	jmp    11c4 <stat+0x34>
    11d7:	89 f6                	mov    %esi,%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <atoi>:

int
atoi(const char *s)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	53                   	push   %ebx
    11e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    11e7:	0f be 11             	movsbl (%ecx),%edx
    11ea:	8d 42 d0             	lea    -0x30(%edx),%eax
    11ed:	3c 09                	cmp    $0x9,%al
  n = 0;
    11ef:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    11f4:	77 1f                	ja     1215 <atoi+0x35>
    11f6:	8d 76 00             	lea    0x0(%esi),%esi
    11f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1200:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1203:	83 c1 01             	add    $0x1,%ecx
    1206:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    120a:	0f be 11             	movsbl (%ecx),%edx
    120d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1210:	80 fb 09             	cmp    $0x9,%bl
    1213:	76 eb                	jbe    1200 <atoi+0x20>
  return n;
}
    1215:	5b                   	pop    %ebx
    1216:	5d                   	pop    %ebp
    1217:	c3                   	ret    
    1218:	90                   	nop
    1219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001220 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	56                   	push   %esi
    1224:	53                   	push   %ebx
    1225:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1228:	8b 45 08             	mov    0x8(%ebp),%eax
    122b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    122e:	85 db                	test   %ebx,%ebx
    1230:	7e 14                	jle    1246 <memmove+0x26>
    1232:	31 d2                	xor    %edx,%edx
    1234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1238:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    123c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    123f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1242:	39 d3                	cmp    %edx,%ebx
    1244:	75 f2                	jne    1238 <memmove+0x18>
  return vdst;
}
    1246:	5b                   	pop    %ebx
    1247:	5e                   	pop    %esi
    1248:	5d                   	pop    %ebp
    1249:	c3                   	ret    
    124a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001250 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1250:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1251:	a1 b8 19 00 00       	mov    0x19b8,%eax
{
    1256:	89 e5                	mov    %esp,%ebp
    1258:	57                   	push   %edi
    1259:	56                   	push   %esi
    125a:	53                   	push   %ebx
    125b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    125e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1268:	39 c8                	cmp    %ecx,%eax
    126a:	8b 10                	mov    (%eax),%edx
    126c:	73 32                	jae    12a0 <free+0x50>
    126e:	39 d1                	cmp    %edx,%ecx
    1270:	72 04                	jb     1276 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1272:	39 d0                	cmp    %edx,%eax
    1274:	72 32                	jb     12a8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1276:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1279:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    127c:	39 fa                	cmp    %edi,%edx
    127e:	74 30                	je     12b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1280:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1283:	8b 50 04             	mov    0x4(%eax),%edx
    1286:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1289:	39 f1                	cmp    %esi,%ecx
    128b:	74 3a                	je     12c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    128d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    128f:	a3 b8 19 00 00       	mov    %eax,0x19b8
}
    1294:	5b                   	pop    %ebx
    1295:	5e                   	pop    %esi
    1296:	5f                   	pop    %edi
    1297:	5d                   	pop    %ebp
    1298:	c3                   	ret    
    1299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12a0:	39 d0                	cmp    %edx,%eax
    12a2:	72 04                	jb     12a8 <free+0x58>
    12a4:	39 d1                	cmp    %edx,%ecx
    12a6:	72 ce                	jb     1276 <free+0x26>
{
    12a8:	89 d0                	mov    %edx,%eax
    12aa:	eb bc                	jmp    1268 <free+0x18>
    12ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    12b0:	03 72 04             	add    0x4(%edx),%esi
    12b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    12b6:	8b 10                	mov    (%eax),%edx
    12b8:	8b 12                	mov    (%edx),%edx
    12ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    12bd:	8b 50 04             	mov    0x4(%eax),%edx
    12c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    12c3:	39 f1                	cmp    %esi,%ecx
    12c5:	75 c6                	jne    128d <free+0x3d>
    p->s.size += bp->s.size;
    12c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    12ca:	a3 b8 19 00 00       	mov    %eax,0x19b8
    p->s.size += bp->s.size;
    12cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    12d2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    12d5:	89 10                	mov    %edx,(%eax)
}
    12d7:	5b                   	pop    %ebx
    12d8:	5e                   	pop    %esi
    12d9:	5f                   	pop    %edi
    12da:	5d                   	pop    %ebp
    12db:	c3                   	ret    
    12dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    12e0:	55                   	push   %ebp
    12e1:	89 e5                	mov    %esp,%ebp
    12e3:	57                   	push   %edi
    12e4:	56                   	push   %esi
    12e5:	53                   	push   %ebx
    12e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    12e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    12ec:	8b 15 b8 19 00 00    	mov    0x19b8,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    12f2:	8d 78 07             	lea    0x7(%eax),%edi
    12f5:	c1 ef 03             	shr    $0x3,%edi
    12f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    12fb:	85 d2                	test   %edx,%edx
    12fd:	0f 84 9d 00 00 00    	je     13a0 <malloc+0xc0>
    1303:	8b 02                	mov    (%edx),%eax
    1305:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1308:	39 cf                	cmp    %ecx,%edi
    130a:	76 6c                	jbe    1378 <malloc+0x98>
    130c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1312:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1317:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    131a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1321:	eb 0e                	jmp    1331 <malloc+0x51>
    1323:	90                   	nop
    1324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1328:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    132a:	8b 48 04             	mov    0x4(%eax),%ecx
    132d:	39 f9                	cmp    %edi,%ecx
    132f:	73 47                	jae    1378 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1331:	39 05 b8 19 00 00    	cmp    %eax,0x19b8
    1337:	89 c2                	mov    %eax,%edx
    1339:	75 ed                	jne    1328 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    133b:	83 ec 0c             	sub    $0xc,%esp
    133e:	56                   	push   %esi
    133f:	e8 22 01 00 00       	call   1466 <sbrk>
  if(p == (char*)-1)
    1344:	83 c4 10             	add    $0x10,%esp
    1347:	83 f8 ff             	cmp    $0xffffffff,%eax
    134a:	74 1c                	je     1368 <malloc+0x88>
  hp->s.size = nu;
    134c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    134f:	83 ec 0c             	sub    $0xc,%esp
    1352:	83 c0 08             	add    $0x8,%eax
    1355:	50                   	push   %eax
    1356:	e8 f5 fe ff ff       	call   1250 <free>
  return freep;
    135b:	8b 15 b8 19 00 00    	mov    0x19b8,%edx
      if((p = morecore(nunits)) == 0)
    1361:	83 c4 10             	add    $0x10,%esp
    1364:	85 d2                	test   %edx,%edx
    1366:	75 c0                	jne    1328 <malloc+0x48>
        return 0;
  }
}
    1368:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    136b:	31 c0                	xor    %eax,%eax
}
    136d:	5b                   	pop    %ebx
    136e:	5e                   	pop    %esi
    136f:	5f                   	pop    %edi
    1370:	5d                   	pop    %ebp
    1371:	c3                   	ret    
    1372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1378:	39 cf                	cmp    %ecx,%edi
    137a:	74 54                	je     13d0 <malloc+0xf0>
        p->s.size -= nunits;
    137c:	29 f9                	sub    %edi,%ecx
    137e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1381:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1384:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1387:	89 15 b8 19 00 00    	mov    %edx,0x19b8
}
    138d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1390:	83 c0 08             	add    $0x8,%eax
}
    1393:	5b                   	pop    %ebx
    1394:	5e                   	pop    %esi
    1395:	5f                   	pop    %edi
    1396:	5d                   	pop    %ebp
    1397:	c3                   	ret    
    1398:	90                   	nop
    1399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    13a0:	c7 05 b8 19 00 00 bc 	movl   $0x19bc,0x19b8
    13a7:	19 00 00 
    13aa:	c7 05 bc 19 00 00 bc 	movl   $0x19bc,0x19bc
    13b1:	19 00 00 
    base.s.size = 0;
    13b4:	b8 bc 19 00 00       	mov    $0x19bc,%eax
    13b9:	c7 05 c0 19 00 00 00 	movl   $0x0,0x19c0
    13c0:	00 00 00 
    13c3:	e9 44 ff ff ff       	jmp    130c <malloc+0x2c>
    13c8:	90                   	nop
    13c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    13d0:	8b 08                	mov    (%eax),%ecx
    13d2:	89 0a                	mov    %ecx,(%edx)
    13d4:	eb b1                	jmp    1387 <malloc+0xa7>

000013d6 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    13d6:	b8 01 00 00 00       	mov    $0x1,%eax
    13db:	cd 40                	int    $0x40
    13dd:	c3                   	ret    

000013de <exit>:
SYSCALL(exit)
    13de:	b8 02 00 00 00       	mov    $0x2,%eax
    13e3:	cd 40                	int    $0x40
    13e5:	c3                   	ret    

000013e6 <wait>:
SYSCALL(wait)
    13e6:	b8 03 00 00 00       	mov    $0x3,%eax
    13eb:	cd 40                	int    $0x40
    13ed:	c3                   	ret    

000013ee <pipe>:
SYSCALL(pipe)
    13ee:	b8 04 00 00 00       	mov    $0x4,%eax
    13f3:	cd 40                	int    $0x40
    13f5:	c3                   	ret    

000013f6 <read>:
SYSCALL(read)
    13f6:	b8 05 00 00 00       	mov    $0x5,%eax
    13fb:	cd 40                	int    $0x40
    13fd:	c3                   	ret    

000013fe <write>:
SYSCALL(write)
    13fe:	b8 10 00 00 00       	mov    $0x10,%eax
    1403:	cd 40                	int    $0x40
    1405:	c3                   	ret    

00001406 <close>:
SYSCALL(close)
    1406:	b8 15 00 00 00       	mov    $0x15,%eax
    140b:	cd 40                	int    $0x40
    140d:	c3                   	ret    

0000140e <kill>:
SYSCALL(kill)
    140e:	b8 06 00 00 00       	mov    $0x6,%eax
    1413:	cd 40                	int    $0x40
    1415:	c3                   	ret    

00001416 <exec>:
SYSCALL(exec)
    1416:	b8 07 00 00 00       	mov    $0x7,%eax
    141b:	cd 40                	int    $0x40
    141d:	c3                   	ret    

0000141e <open>:
SYSCALL(open)
    141e:	b8 0f 00 00 00       	mov    $0xf,%eax
    1423:	cd 40                	int    $0x40
    1425:	c3                   	ret    

00001426 <mknod>:
SYSCALL(mknod)
    1426:	b8 11 00 00 00       	mov    $0x11,%eax
    142b:	cd 40                	int    $0x40
    142d:	c3                   	ret    

0000142e <unlink>:
SYSCALL(unlink)
    142e:	b8 12 00 00 00       	mov    $0x12,%eax
    1433:	cd 40                	int    $0x40
    1435:	c3                   	ret    

00001436 <fstat>:
SYSCALL(fstat)
    1436:	b8 08 00 00 00       	mov    $0x8,%eax
    143b:	cd 40                	int    $0x40
    143d:	c3                   	ret    

0000143e <link>:
SYSCALL(link)
    143e:	b8 13 00 00 00       	mov    $0x13,%eax
    1443:	cd 40                	int    $0x40
    1445:	c3                   	ret    

00001446 <mkdir>:
SYSCALL(mkdir)
    1446:	b8 14 00 00 00       	mov    $0x14,%eax
    144b:	cd 40                	int    $0x40
    144d:	c3                   	ret    

0000144e <chdir>:
SYSCALL(chdir)
    144e:	b8 09 00 00 00       	mov    $0x9,%eax
    1453:	cd 40                	int    $0x40
    1455:	c3                   	ret    

00001456 <dup>:
SYSCALL(dup)
    1456:	b8 0a 00 00 00       	mov    $0xa,%eax
    145b:	cd 40                	int    $0x40
    145d:	c3                   	ret    

0000145e <getpid>:
SYSCALL(getpid)
    145e:	b8 0b 00 00 00       	mov    $0xb,%eax
    1463:	cd 40                	int    $0x40
    1465:	c3                   	ret    

00001466 <sbrk>:
SYSCALL(sbrk)
    1466:	b8 0c 00 00 00       	mov    $0xc,%eax
    146b:	cd 40                	int    $0x40
    146d:	c3                   	ret    

0000146e <sleep>:
SYSCALL(sleep)
    146e:	b8 0d 00 00 00       	mov    $0xd,%eax
    1473:	cd 40                	int    $0x40
    1475:	c3                   	ret    

00001476 <uptime>:
SYSCALL(uptime)
    1476:	b8 0e 00 00 00       	mov    $0xe,%eax
    147b:	cd 40                	int    $0x40
    147d:	c3                   	ret    

0000147e <getreadcount>:
SYSCALL(getreadcount)
    147e:	b8 16 00 00 00       	mov    $0x16,%eax
    1483:	cd 40                	int    $0x40
    1485:	c3                   	ret    

00001486 <gettime>:
SYSCALL(gettime)
    1486:	b8 17 00 00 00       	mov    $0x17,%eax
    148b:	cd 40                	int    $0x40
    148d:	c3                   	ret    

0000148e <settickets>:

SYSCALL(settickets)//updated
    148e:	b8 18 00 00 00       	mov    $0x18,%eax
    1493:	cd 40                	int    $0x40
    1495:	c3                   	ret    

00001496 <getpinfo>:
SYSCALL(getpinfo)//updated
    1496:	b8 19 00 00 00       	mov    $0x19,%eax
    149b:	cd 40                	int    $0x40
    149d:	c3                   	ret    
    149e:	66 90                	xchg   %ax,%ax

000014a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    14a0:	55                   	push   %ebp
    14a1:	89 e5                	mov    %esp,%ebp
    14a3:	57                   	push   %edi
    14a4:	56                   	push   %esi
    14a5:	53                   	push   %ebx
    14a6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    14a9:	85 d2                	test   %edx,%edx
{
    14ab:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    14ae:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    14b0:	79 76                	jns    1528 <printint+0x88>
    14b2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    14b6:	74 70                	je     1528 <printint+0x88>
    x = -xx;
    14b8:	f7 d8                	neg    %eax
    neg = 1;
    14ba:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    14c1:	31 f6                	xor    %esi,%esi
    14c3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    14c6:	eb 0a                	jmp    14d2 <printint+0x32>
    14c8:	90                   	nop
    14c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    14d0:	89 fe                	mov    %edi,%esi
    14d2:	31 d2                	xor    %edx,%edx
    14d4:	8d 7e 01             	lea    0x1(%esi),%edi
    14d7:	f7 f1                	div    %ecx
    14d9:	0f b6 92 38 17 00 00 	movzbl 0x1738(%edx),%edx
  }while((x /= base) != 0);
    14e0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    14e2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    14e5:	75 e9                	jne    14d0 <printint+0x30>
  if(neg)
    14e7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    14ea:	85 c0                	test   %eax,%eax
    14ec:	74 08                	je     14f6 <printint+0x56>
    buf[i++] = '-';
    14ee:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    14f3:	8d 7e 02             	lea    0x2(%esi),%edi
    14f6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    14fa:	8b 7d c0             	mov    -0x40(%ebp),%edi
    14fd:	8d 76 00             	lea    0x0(%esi),%esi
    1500:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1503:	83 ec 04             	sub    $0x4,%esp
    1506:	83 ee 01             	sub    $0x1,%esi
    1509:	6a 01                	push   $0x1
    150b:	53                   	push   %ebx
    150c:	57                   	push   %edi
    150d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1510:	e8 e9 fe ff ff       	call   13fe <write>

  while(--i >= 0)
    1515:	83 c4 10             	add    $0x10,%esp
    1518:	39 de                	cmp    %ebx,%esi
    151a:	75 e4                	jne    1500 <printint+0x60>
    putc(fd, buf[i]);
}
    151c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    151f:	5b                   	pop    %ebx
    1520:	5e                   	pop    %esi
    1521:	5f                   	pop    %edi
    1522:	5d                   	pop    %ebp
    1523:	c3                   	ret    
    1524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1528:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    152f:	eb 90                	jmp    14c1 <printint+0x21>
    1531:	eb 0d                	jmp    1540 <printf>
    1533:	90                   	nop
    1534:	90                   	nop
    1535:	90                   	nop
    1536:	90                   	nop
    1537:	90                   	nop
    1538:	90                   	nop
    1539:	90                   	nop
    153a:	90                   	nop
    153b:	90                   	nop
    153c:	90                   	nop
    153d:	90                   	nop
    153e:	90                   	nop
    153f:	90                   	nop

00001540 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1540:	55                   	push   %ebp
    1541:	89 e5                	mov    %esp,%ebp
    1543:	57                   	push   %edi
    1544:	56                   	push   %esi
    1545:	53                   	push   %ebx
    1546:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1549:	8b 75 0c             	mov    0xc(%ebp),%esi
    154c:	0f b6 1e             	movzbl (%esi),%ebx
    154f:	84 db                	test   %bl,%bl
    1551:	0f 84 bf 00 00 00    	je     1616 <printf+0xd6>
    1557:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    155a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    155d:	31 d2                	xor    %edx,%edx
    155f:	eb 39                	jmp    159a <printf+0x5a>
    1561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1568:	83 f8 25             	cmp    $0x25,%eax
    156b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    156e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1573:	74 1a                	je     158f <printf+0x4f>
  write(fd, &c, 1);
    1575:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1578:	83 ec 04             	sub    $0x4,%esp
    157b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    157e:	6a 01                	push   $0x1
    1580:	50                   	push   %eax
    1581:	ff 75 08             	pushl  0x8(%ebp)
    1584:	e8 75 fe ff ff       	call   13fe <write>
    1589:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    158c:	83 c4 10             	add    $0x10,%esp
    158f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1592:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1596:	84 db                	test   %bl,%bl
    1598:	74 7c                	je     1616 <printf+0xd6>
    if(state == 0){
    159a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    159c:	0f be cb             	movsbl %bl,%ecx
    159f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    15a2:	74 c4                	je     1568 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    15a4:	83 fa 25             	cmp    $0x25,%edx
    15a7:	75 e6                	jne    158f <printf+0x4f>
      if(c == 'd'){
    15a9:	83 f8 64             	cmp    $0x64,%eax
    15ac:	0f 84 a6 00 00 00    	je     1658 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    15b2:	83 f8 6c             	cmp    $0x6c,%eax
    15b5:	0f 84 ad 00 00 00    	je     1668 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    15bb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    15c1:	83 f9 70             	cmp    $0x70,%ecx
    15c4:	74 5a                	je     1620 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    15c6:	83 f8 73             	cmp    $0x73,%eax
    15c9:	0f 84 e1 00 00 00    	je     16b0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    15cf:	83 f8 63             	cmp    $0x63,%eax
    15d2:	0f 84 28 01 00 00    	je     1700 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    15d8:	83 f8 25             	cmp    $0x25,%eax
    15db:	74 6b                	je     1648 <printf+0x108>
  write(fd, &c, 1);
    15dd:	8d 45 e7             	lea    -0x19(%ebp),%eax
    15e0:	83 ec 04             	sub    $0x4,%esp
    15e3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    15e7:	6a 01                	push   $0x1
    15e9:	50                   	push   %eax
    15ea:	ff 75 08             	pushl  0x8(%ebp)
    15ed:	e8 0c fe ff ff       	call   13fe <write>
    15f2:	83 c4 0c             	add    $0xc,%esp
    15f5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    15f8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    15fb:	6a 01                	push   $0x1
    15fd:	50                   	push   %eax
    15fe:	ff 75 08             	pushl  0x8(%ebp)
    1601:	83 c6 01             	add    $0x1,%esi
    1604:	e8 f5 fd ff ff       	call   13fe <write>
  for(i = 0; fmt[i]; i++){
    1609:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    160d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1610:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1612:	84 db                	test   %bl,%bl
    1614:	75 84                	jne    159a <printf+0x5a>
    }
  }
}
    1616:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1619:	5b                   	pop    %ebx
    161a:	5e                   	pop    %esi
    161b:	5f                   	pop    %edi
    161c:	5d                   	pop    %ebp
    161d:	c3                   	ret    
    161e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1620:	83 ec 0c             	sub    $0xc,%esp
    1623:	b9 10 00 00 00       	mov    $0x10,%ecx
    1628:	6a 00                	push   $0x0
    162a:	8b 17                	mov    (%edi),%edx
    162c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    162f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1632:	e8 69 fe ff ff       	call   14a0 <printint>
    1637:	83 c4 10             	add    $0x10,%esp
      state = 0;
    163a:	31 d2                	xor    %edx,%edx
    163c:	e9 4e ff ff ff       	jmp    158f <printf+0x4f>
    1641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1648:	83 ec 04             	sub    $0x4,%esp
    164b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    164e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1651:	6a 01                	push   $0x1
    1653:	eb a8                	jmp    15fd <printf+0xbd>
    1655:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1658:	83 ec 0c             	sub    $0xc,%esp
    165b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1660:	6a 01                	push   $0x1
    1662:	eb c6                	jmp    162a <printf+0xea>
    1664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1668:	8b 57 04             	mov    0x4(%edi),%edx
    166b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    166d:	85 d2                	test   %edx,%edx
    166f:	74 15                	je     1686 <printf+0x146>
    1671:	83 ec 0c             	sub    $0xc,%esp
    1674:	8b 45 08             	mov    0x8(%ebp),%eax
    1677:	b9 10 00 00 00       	mov    $0x10,%ecx
    167c:	6a 00                	push   $0x0
    167e:	e8 1d fe ff ff       	call   14a0 <printint>
    1683:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1686:	83 ec 0c             	sub    $0xc,%esp
    1689:	8b 45 08             	mov    0x8(%ebp),%eax
    168c:	89 da                	mov    %ebx,%edx
    168e:	6a 00                	push   $0x0
    1690:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1695:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1698:	e8 03 fe ff ff       	call   14a0 <printint>
    169d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16a0:	31 d2                	xor    %edx,%edx
    16a2:	e9 e8 fe ff ff       	jmp    158f <printf+0x4f>
    16a7:	89 f6                	mov    %esi,%esi
    16a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    16b0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    16b2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    16b5:	85 c9                	test   %ecx,%ecx
    16b7:	74 6a                	je     1723 <printf+0x1e3>
        while(*s != 0){
    16b9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    16bc:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    16be:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    16c0:	84 c0                	test   %al,%al
    16c2:	0f 84 c7 fe ff ff    	je     158f <printf+0x4f>
    16c8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    16cb:	89 de                	mov    %ebx,%esi
    16cd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    16d0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    16d3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    16d6:	83 ec 04             	sub    $0x4,%esp
    16d9:	6a 01                	push   $0x1
          s++;
    16db:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    16de:	50                   	push   %eax
    16df:	53                   	push   %ebx
    16e0:	e8 19 fd ff ff       	call   13fe <write>
        while(*s != 0){
    16e5:	0f b6 06             	movzbl (%esi),%eax
    16e8:	83 c4 10             	add    $0x10,%esp
    16eb:	84 c0                	test   %al,%al
    16ed:	75 e1                	jne    16d0 <printf+0x190>
    16ef:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    16f2:	31 d2                	xor    %edx,%edx
    16f4:	e9 96 fe ff ff       	jmp    158f <printf+0x4f>
    16f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1700:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1702:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1705:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1708:	6a 01                	push   $0x1
        putc(fd, *ap);
    170a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    170d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1710:	50                   	push   %eax
    1711:	ff 75 08             	pushl  0x8(%ebp)
    1714:	e8 e5 fc ff ff       	call   13fe <write>
    1719:	83 c4 10             	add    $0x10,%esp
      state = 0;
    171c:	31 d2                	xor    %edx,%edx
    171e:	e9 6c fe ff ff       	jmp    158f <printf+0x4f>
          s = "(null)";
    1723:	bb 30 17 00 00       	mov    $0x1730,%ebx
        while(*s != 0){
    1728:	b8 28 00 00 00       	mov    $0x28,%eax
    172d:	eb 99                	jmp    16c8 <printf+0x188>
