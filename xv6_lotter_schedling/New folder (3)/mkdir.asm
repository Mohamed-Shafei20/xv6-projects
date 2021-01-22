
_mkdir:     file format elf32-i386


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
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	bf 01 00 00 00       	mov    $0x1,%edi
    1016:	83 ec 08             	sub    $0x8,%esp
    1019:	8b 31                	mov    (%ecx),%esi
    101b:	8b 59 04             	mov    0x4(%ecx),%ebx
    101e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
    1021:	83 fe 01             	cmp    $0x1,%esi
    1024:	7e 3e                	jle    1064 <main+0x64>
    1026:	8d 76 00             	lea    0x0(%esi),%esi
    1029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
    1030:	83 ec 0c             	sub    $0xc,%esp
    1033:	ff 33                	pushl  (%ebx)
    1035:	e8 8c 04 00 00       	call   14c6 <mkdir>
    103a:	83 c4 10             	add    $0x10,%esp
    103d:	85 c0                	test   %eax,%eax
    103f:	78 0f                	js     1050 <main+0x50>
  for(i = 1; i < argc; i++){
    1041:	83 c7 01             	add    $0x1,%edi
    1044:	83 c3 04             	add    $0x4,%ebx
    1047:	39 fe                	cmp    %edi,%esi
    1049:	75 e5                	jne    1030 <main+0x30>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
    104b:	e8 0e 04 00 00       	call   145e <exit>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
    1050:	50                   	push   %eax
    1051:	ff 33                	pushl  (%ebx)
    1053:	68 b7 17 00 00       	push   $0x17b7
    1058:	6a 02                	push   $0x2
    105a:	e8 51 05 00 00       	call   15b0 <printf>
      break;
    105f:	83 c4 10             	add    $0x10,%esp
    1062:	eb e7                	jmp    104b <main+0x4b>
    printf(2, "Usage: mkdir files...\n");
    1064:	52                   	push   %edx
    1065:	52                   	push   %edx
    1066:	68 a0 17 00 00       	push   $0x17a0
    106b:	6a 02                	push   $0x2
    106d:	e8 3e 05 00 00       	call   15b0 <printf>
    exit();
    1072:	e8 e7 03 00 00       	call   145e <exit>
    1077:	66 90                	xchg   %ax,%ax
    1079:	66 90                	xchg   %ax,%ax
    107b:	66 90                	xchg   %ax,%ax
    107d:	66 90                	xchg   %ax,%ax
    107f:	90                   	nop

00001080 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	53                   	push   %ebx
    1084:	8b 45 08             	mov    0x8(%ebp),%eax
    1087:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    108a:	89 c2                	mov    %eax,%edx
    108c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1090:	83 c1 01             	add    $0x1,%ecx
    1093:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1097:	83 c2 01             	add    $0x1,%edx
    109a:	84 db                	test   %bl,%bl
    109c:	88 5a ff             	mov    %bl,-0x1(%edx)
    109f:	75 ef                	jne    1090 <strcpy+0x10>
    ;
  return os;
}
    10a1:	5b                   	pop    %ebx
    10a2:	5d                   	pop    %ebp
    10a3:	c3                   	ret    
    10a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	53                   	push   %ebx
    10b4:	8b 55 08             	mov    0x8(%ebp),%edx
    10b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10ba:	0f b6 02             	movzbl (%edx),%eax
    10bd:	0f b6 19             	movzbl (%ecx),%ebx
    10c0:	84 c0                	test   %al,%al
    10c2:	75 1c                	jne    10e0 <strcmp+0x30>
    10c4:	eb 2a                	jmp    10f0 <strcmp+0x40>
    10c6:	8d 76 00             	lea    0x0(%esi),%esi
    10c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10d0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10d6:	83 c1 01             	add    $0x1,%ecx
    10d9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    10dc:	84 c0                	test   %al,%al
    10de:	74 10                	je     10f0 <strcmp+0x40>
    10e0:	38 d8                	cmp    %bl,%al
    10e2:	74 ec                	je     10d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10e4:	29 d8                	sub    %ebx,%eax
}
    10e6:	5b                   	pop    %ebx
    10e7:	5d                   	pop    %ebp
    10e8:	c3                   	ret    
    10e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10f2:	29 d8                	sub    %ebx,%eax
}
    10f4:	5b                   	pop    %ebx
    10f5:	5d                   	pop    %ebp
    10f6:	c3                   	ret    
    10f7:	89 f6                	mov    %esi,%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001100 <strlen>:

uint
strlen(const char *s)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1106:	80 39 00             	cmpb   $0x0,(%ecx)
    1109:	74 15                	je     1120 <strlen+0x20>
    110b:	31 d2                	xor    %edx,%edx
    110d:	8d 76 00             	lea    0x0(%esi),%esi
    1110:	83 c2 01             	add    $0x1,%edx
    1113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1117:	89 d0                	mov    %edx,%eax
    1119:	75 f5                	jne    1110 <strlen+0x10>
    ;
  return n;
}
    111b:	5d                   	pop    %ebp
    111c:	c3                   	ret    
    111d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1120:	31 c0                	xor    %eax,%eax
}
    1122:	5d                   	pop    %ebp
    1123:	c3                   	ret    
    1124:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    112a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001130 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	57                   	push   %edi
    1134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1137:	8b 4d 10             	mov    0x10(%ebp),%ecx
    113a:	8b 45 0c             	mov    0xc(%ebp),%eax
    113d:	89 d7                	mov    %edx,%edi
    113f:	fc                   	cld    
    1140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1142:	89 d0                	mov    %edx,%eax
    1144:	5f                   	pop    %edi
    1145:	5d                   	pop    %ebp
    1146:	c3                   	ret    
    1147:	89 f6                	mov    %esi,%esi
    1149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001150 <strchr>:

char*
strchr(const char *s, char c)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	53                   	push   %ebx
    1154:	8b 45 08             	mov    0x8(%ebp),%eax
    1157:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    115a:	0f b6 10             	movzbl (%eax),%edx
    115d:	84 d2                	test   %dl,%dl
    115f:	74 1d                	je     117e <strchr+0x2e>
    if(*s == c)
    1161:	38 d3                	cmp    %dl,%bl
    1163:	89 d9                	mov    %ebx,%ecx
    1165:	75 0d                	jne    1174 <strchr+0x24>
    1167:	eb 17                	jmp    1180 <strchr+0x30>
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1170:	38 ca                	cmp    %cl,%dl
    1172:	74 0c                	je     1180 <strchr+0x30>
  for(; *s; s++)
    1174:	83 c0 01             	add    $0x1,%eax
    1177:	0f b6 10             	movzbl (%eax),%edx
    117a:	84 d2                	test   %dl,%dl
    117c:	75 f2                	jne    1170 <strchr+0x20>
      return (char*)s;
  return 0;
    117e:	31 c0                	xor    %eax,%eax
}
    1180:	5b                   	pop    %ebx
    1181:	5d                   	pop    %ebp
    1182:	c3                   	ret    
    1183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001190 <gets>:

char*
gets(char *buf, int max)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	57                   	push   %edi
    1194:	56                   	push   %esi
    1195:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1196:	31 f6                	xor    %esi,%esi
    1198:	89 f3                	mov    %esi,%ebx
{
    119a:	83 ec 1c             	sub    $0x1c,%esp
    119d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    11a0:	eb 2f                	jmp    11d1 <gets+0x41>
    11a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    11a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11ab:	83 ec 04             	sub    $0x4,%esp
    11ae:	6a 01                	push   $0x1
    11b0:	50                   	push   %eax
    11b1:	6a 00                	push   $0x0
    11b3:	e8 be 02 00 00       	call   1476 <read>
    if(cc < 1)
    11b8:	83 c4 10             	add    $0x10,%esp
    11bb:	85 c0                	test   %eax,%eax
    11bd:	7e 1c                	jle    11db <gets+0x4b>
      break;
    buf[i++] = c;
    11bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11c3:	83 c7 01             	add    $0x1,%edi
    11c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11c9:	3c 0a                	cmp    $0xa,%al
    11cb:	74 23                	je     11f0 <gets+0x60>
    11cd:	3c 0d                	cmp    $0xd,%al
    11cf:	74 1f                	je     11f0 <gets+0x60>
  for(i=0; i+1 < max; ){
    11d1:	83 c3 01             	add    $0x1,%ebx
    11d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11d7:	89 fe                	mov    %edi,%esi
    11d9:	7c cd                	jl     11a8 <gets+0x18>
    11db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11e0:	c6 03 00             	movb   $0x0,(%ebx)
}
    11e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11e6:	5b                   	pop    %ebx
    11e7:	5e                   	pop    %esi
    11e8:	5f                   	pop    %edi
    11e9:	5d                   	pop    %ebp
    11ea:	c3                   	ret    
    11eb:	90                   	nop
    11ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11f0:	8b 75 08             	mov    0x8(%ebp),%esi
    11f3:	8b 45 08             	mov    0x8(%ebp),%eax
    11f6:	01 de                	add    %ebx,%esi
    11f8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11fa:	c6 03 00             	movb   $0x0,(%ebx)
}
    11fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1200:	5b                   	pop    %ebx
    1201:	5e                   	pop    %esi
    1202:	5f                   	pop    %edi
    1203:	5d                   	pop    %ebp
    1204:	c3                   	ret    
    1205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <stat>:

int
stat(const char *n, struct stat *st)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	56                   	push   %esi
    1214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1215:	83 ec 08             	sub    $0x8,%esp
    1218:	6a 00                	push   $0x0
    121a:	ff 75 08             	pushl  0x8(%ebp)
    121d:	e8 7c 02 00 00       	call   149e <open>
  if(fd < 0)
    1222:	83 c4 10             	add    $0x10,%esp
    1225:	85 c0                	test   %eax,%eax
    1227:	78 27                	js     1250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1229:	83 ec 08             	sub    $0x8,%esp
    122c:	ff 75 0c             	pushl  0xc(%ebp)
    122f:	89 c3                	mov    %eax,%ebx
    1231:	50                   	push   %eax
    1232:	e8 7f 02 00 00       	call   14b6 <fstat>
  close(fd);
    1237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    123a:	89 c6                	mov    %eax,%esi
  close(fd);
    123c:	e8 45 02 00 00       	call   1486 <close>
  return r;
    1241:	83 c4 10             	add    $0x10,%esp
}
    1244:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1247:	89 f0                	mov    %esi,%eax
    1249:	5b                   	pop    %ebx
    124a:	5e                   	pop    %esi
    124b:	5d                   	pop    %ebp
    124c:	c3                   	ret    
    124d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1250:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1255:	eb ed                	jmp    1244 <stat+0x34>
    1257:	89 f6                	mov    %esi,%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001260 <atoi>:

int
atoi(const char *s)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	53                   	push   %ebx
    1264:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1267:	0f be 11             	movsbl (%ecx),%edx
    126a:	8d 42 d0             	lea    -0x30(%edx),%eax
    126d:	3c 09                	cmp    $0x9,%al
  n = 0;
    126f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1274:	77 1f                	ja     1295 <atoi+0x35>
    1276:	8d 76 00             	lea    0x0(%esi),%esi
    1279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1280:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1283:	83 c1 01             	add    $0x1,%ecx
    1286:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    128a:	0f be 11             	movsbl (%ecx),%edx
    128d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1290:	80 fb 09             	cmp    $0x9,%bl
    1293:	76 eb                	jbe    1280 <atoi+0x20>
  return n;
}
    1295:	5b                   	pop    %ebx
    1296:	5d                   	pop    %ebp
    1297:	c3                   	ret    
    1298:	90                   	nop
    1299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	56                   	push   %esi
    12a4:	53                   	push   %ebx
    12a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    12a8:	8b 45 08             	mov    0x8(%ebp),%eax
    12ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ae:	85 db                	test   %ebx,%ebx
    12b0:	7e 14                	jle    12c6 <memmove+0x26>
    12b2:	31 d2                	xor    %edx,%edx
    12b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    12b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    12bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    12bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    12c2:	39 d3                	cmp    %edx,%ebx
    12c4:	75 f2                	jne    12b8 <memmove+0x18>
  return vdst;
}
    12c6:	5b                   	pop    %ebx
    12c7:	5e                   	pop    %esi
    12c8:	5d                   	pop    %ebp
    12c9:	c3                   	ret    
    12ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000012d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12d1:	a1 8c 1a 00 00       	mov    0x1a8c,%eax
{
    12d6:	89 e5                	mov    %esp,%ebp
    12d8:	57                   	push   %edi
    12d9:	56                   	push   %esi
    12da:	53                   	push   %ebx
    12db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    12de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    12e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12e8:	39 c8                	cmp    %ecx,%eax
    12ea:	8b 10                	mov    (%eax),%edx
    12ec:	73 32                	jae    1320 <free+0x50>
    12ee:	39 d1                	cmp    %edx,%ecx
    12f0:	72 04                	jb     12f6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12f2:	39 d0                	cmp    %edx,%eax
    12f4:	72 32                	jb     1328 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    12f6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12f9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12fc:	39 fa                	cmp    %edi,%edx
    12fe:	74 30                	je     1330 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1300:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1303:	8b 50 04             	mov    0x4(%eax),%edx
    1306:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1309:	39 f1                	cmp    %esi,%ecx
    130b:	74 3a                	je     1347 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    130d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    130f:	a3 8c 1a 00 00       	mov    %eax,0x1a8c
}
    1314:	5b                   	pop    %ebx
    1315:	5e                   	pop    %esi
    1316:	5f                   	pop    %edi
    1317:	5d                   	pop    %ebp
    1318:	c3                   	ret    
    1319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1320:	39 d0                	cmp    %edx,%eax
    1322:	72 04                	jb     1328 <free+0x58>
    1324:	39 d1                	cmp    %edx,%ecx
    1326:	72 ce                	jb     12f6 <free+0x26>
{
    1328:	89 d0                	mov    %edx,%eax
    132a:	eb bc                	jmp    12e8 <free+0x18>
    132c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1330:	03 72 04             	add    0x4(%edx),%esi
    1333:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1336:	8b 10                	mov    (%eax),%edx
    1338:	8b 12                	mov    (%edx),%edx
    133a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    133d:	8b 50 04             	mov    0x4(%eax),%edx
    1340:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1343:	39 f1                	cmp    %esi,%ecx
    1345:	75 c6                	jne    130d <free+0x3d>
    p->s.size += bp->s.size;
    1347:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    134a:	a3 8c 1a 00 00       	mov    %eax,0x1a8c
    p->s.size += bp->s.size;
    134f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1352:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1355:	89 10                	mov    %edx,(%eax)
}
    1357:	5b                   	pop    %ebx
    1358:	5e                   	pop    %esi
    1359:	5f                   	pop    %edi
    135a:	5d                   	pop    %ebp
    135b:	c3                   	ret    
    135c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001360 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	57                   	push   %edi
    1364:	56                   	push   %esi
    1365:	53                   	push   %ebx
    1366:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1369:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    136c:	8b 15 8c 1a 00 00    	mov    0x1a8c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1372:	8d 78 07             	lea    0x7(%eax),%edi
    1375:	c1 ef 03             	shr    $0x3,%edi
    1378:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    137b:	85 d2                	test   %edx,%edx
    137d:	0f 84 9d 00 00 00    	je     1420 <malloc+0xc0>
    1383:	8b 02                	mov    (%edx),%eax
    1385:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1388:	39 cf                	cmp    %ecx,%edi
    138a:	76 6c                	jbe    13f8 <malloc+0x98>
    138c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1392:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1397:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    139a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    13a1:	eb 0e                	jmp    13b1 <malloc+0x51>
    13a3:	90                   	nop
    13a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    13aa:	8b 48 04             	mov    0x4(%eax),%ecx
    13ad:	39 f9                	cmp    %edi,%ecx
    13af:	73 47                	jae    13f8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    13b1:	39 05 8c 1a 00 00    	cmp    %eax,0x1a8c
    13b7:	89 c2                	mov    %eax,%edx
    13b9:	75 ed                	jne    13a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    13bb:	83 ec 0c             	sub    $0xc,%esp
    13be:	56                   	push   %esi
    13bf:	e8 22 01 00 00       	call   14e6 <sbrk>
  if(p == (char*)-1)
    13c4:	83 c4 10             	add    $0x10,%esp
    13c7:	83 f8 ff             	cmp    $0xffffffff,%eax
    13ca:	74 1c                	je     13e8 <malloc+0x88>
  hp->s.size = nu;
    13cc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    13cf:	83 ec 0c             	sub    $0xc,%esp
    13d2:	83 c0 08             	add    $0x8,%eax
    13d5:	50                   	push   %eax
    13d6:	e8 f5 fe ff ff       	call   12d0 <free>
  return freep;
    13db:	8b 15 8c 1a 00 00    	mov    0x1a8c,%edx
      if((p = morecore(nunits)) == 0)
    13e1:	83 c4 10             	add    $0x10,%esp
    13e4:	85 d2                	test   %edx,%edx
    13e6:	75 c0                	jne    13a8 <malloc+0x48>
        return 0;
  }
}
    13e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    13eb:	31 c0                	xor    %eax,%eax
}
    13ed:	5b                   	pop    %ebx
    13ee:	5e                   	pop    %esi
    13ef:	5f                   	pop    %edi
    13f0:	5d                   	pop    %ebp
    13f1:	c3                   	ret    
    13f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    13f8:	39 cf                	cmp    %ecx,%edi
    13fa:	74 54                	je     1450 <malloc+0xf0>
        p->s.size -= nunits;
    13fc:	29 f9                	sub    %edi,%ecx
    13fe:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1401:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1404:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1407:	89 15 8c 1a 00 00    	mov    %edx,0x1a8c
}
    140d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1410:	83 c0 08             	add    $0x8,%eax
}
    1413:	5b                   	pop    %ebx
    1414:	5e                   	pop    %esi
    1415:	5f                   	pop    %edi
    1416:	5d                   	pop    %ebp
    1417:	c3                   	ret    
    1418:	90                   	nop
    1419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1420:	c7 05 8c 1a 00 00 90 	movl   $0x1a90,0x1a8c
    1427:	1a 00 00 
    142a:	c7 05 90 1a 00 00 90 	movl   $0x1a90,0x1a90
    1431:	1a 00 00 
    base.s.size = 0;
    1434:	b8 90 1a 00 00       	mov    $0x1a90,%eax
    1439:	c7 05 94 1a 00 00 00 	movl   $0x0,0x1a94
    1440:	00 00 00 
    1443:	e9 44 ff ff ff       	jmp    138c <malloc+0x2c>
    1448:	90                   	nop
    1449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1450:	8b 08                	mov    (%eax),%ecx
    1452:	89 0a                	mov    %ecx,(%edx)
    1454:	eb b1                	jmp    1407 <malloc+0xa7>

00001456 <fork>:
    1456:	b8 01 00 00 00       	mov    $0x1,%eax
    145b:	cd 40                	int    $0x40
    145d:	c3                   	ret    

0000145e <exit>:
    145e:	b8 02 00 00 00       	mov    $0x2,%eax
    1463:	cd 40                	int    $0x40
    1465:	c3                   	ret    

00001466 <wait>:
    1466:	b8 03 00 00 00       	mov    $0x3,%eax
    146b:	cd 40                	int    $0x40
    146d:	c3                   	ret    

0000146e <pipe>:
    146e:	b8 04 00 00 00       	mov    $0x4,%eax
    1473:	cd 40                	int    $0x40
    1475:	c3                   	ret    

00001476 <read>:
    1476:	b8 05 00 00 00       	mov    $0x5,%eax
    147b:	cd 40                	int    $0x40
    147d:	c3                   	ret    

0000147e <write>:
    147e:	b8 10 00 00 00       	mov    $0x10,%eax
    1483:	cd 40                	int    $0x40
    1485:	c3                   	ret    

00001486 <close>:
    1486:	b8 15 00 00 00       	mov    $0x15,%eax
    148b:	cd 40                	int    $0x40
    148d:	c3                   	ret    

0000148e <kill>:
    148e:	b8 06 00 00 00       	mov    $0x6,%eax
    1493:	cd 40                	int    $0x40
    1495:	c3                   	ret    

00001496 <exec>:
    1496:	b8 07 00 00 00       	mov    $0x7,%eax
    149b:	cd 40                	int    $0x40
    149d:	c3                   	ret    

0000149e <open>:
    149e:	b8 0f 00 00 00       	mov    $0xf,%eax
    14a3:	cd 40                	int    $0x40
    14a5:	c3                   	ret    

000014a6 <mknod>:
    14a6:	b8 11 00 00 00       	mov    $0x11,%eax
    14ab:	cd 40                	int    $0x40
    14ad:	c3                   	ret    

000014ae <unlink>:
    14ae:	b8 12 00 00 00       	mov    $0x12,%eax
    14b3:	cd 40                	int    $0x40
    14b5:	c3                   	ret    

000014b6 <fstat>:
    14b6:	b8 08 00 00 00       	mov    $0x8,%eax
    14bb:	cd 40                	int    $0x40
    14bd:	c3                   	ret    

000014be <link>:
    14be:	b8 13 00 00 00       	mov    $0x13,%eax
    14c3:	cd 40                	int    $0x40
    14c5:	c3                   	ret    

000014c6 <mkdir>:
    14c6:	b8 14 00 00 00       	mov    $0x14,%eax
    14cb:	cd 40                	int    $0x40
    14cd:	c3                   	ret    

000014ce <chdir>:
    14ce:	b8 09 00 00 00       	mov    $0x9,%eax
    14d3:	cd 40                	int    $0x40
    14d5:	c3                   	ret    

000014d6 <dup>:
    14d6:	b8 0a 00 00 00       	mov    $0xa,%eax
    14db:	cd 40                	int    $0x40
    14dd:	c3                   	ret    

000014de <getpid>:
    14de:	b8 0b 00 00 00       	mov    $0xb,%eax
    14e3:	cd 40                	int    $0x40
    14e5:	c3                   	ret    

000014e6 <sbrk>:
    14e6:	b8 0c 00 00 00       	mov    $0xc,%eax
    14eb:	cd 40                	int    $0x40
    14ed:	c3                   	ret    

000014ee <sleep>:
    14ee:	b8 0d 00 00 00       	mov    $0xd,%eax
    14f3:	cd 40                	int    $0x40
    14f5:	c3                   	ret    

000014f6 <uptime>:
    14f6:	b8 0e 00 00 00       	mov    $0xe,%eax
    14fb:	cd 40                	int    $0x40
    14fd:	c3                   	ret    

000014fe <settickets>:
    14fe:	b8 16 00 00 00       	mov    $0x16,%eax
    1503:	cd 40                	int    $0x40
    1505:	c3                   	ret    

00001506 <getpinfo>:
    1506:	b8 17 00 00 00       	mov    $0x17,%eax
    150b:	cd 40                	int    $0x40
    150d:	c3                   	ret    
    150e:	66 90                	xchg   %ax,%ax

00001510 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1510:	55                   	push   %ebp
    1511:	89 e5                	mov    %esp,%ebp
    1513:	57                   	push   %edi
    1514:	56                   	push   %esi
    1515:	53                   	push   %ebx
    1516:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1519:	85 d2                	test   %edx,%edx
{
    151b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    151e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1520:	79 76                	jns    1598 <printint+0x88>
    1522:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1526:	74 70                	je     1598 <printint+0x88>
    x = -xx;
    1528:	f7 d8                	neg    %eax
    neg = 1;
    152a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1531:	31 f6                	xor    %esi,%esi
    1533:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1536:	eb 0a                	jmp    1542 <printint+0x32>
    1538:	90                   	nop
    1539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1540:	89 fe                	mov    %edi,%esi
    1542:	31 d2                	xor    %edx,%edx
    1544:	8d 7e 01             	lea    0x1(%esi),%edi
    1547:	f7 f1                	div    %ecx
    1549:	0f b6 92 dc 17 00 00 	movzbl 0x17dc(%edx),%edx
  }while((x /= base) != 0);
    1550:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1552:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1555:	75 e9                	jne    1540 <printint+0x30>
  if(neg)
    1557:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    155a:	85 c0                	test   %eax,%eax
    155c:	74 08                	je     1566 <printint+0x56>
    buf[i++] = '-';
    155e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1563:	8d 7e 02             	lea    0x2(%esi),%edi
    1566:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    156a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    156d:	8d 76 00             	lea    0x0(%esi),%esi
    1570:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1573:	83 ec 04             	sub    $0x4,%esp
    1576:	83 ee 01             	sub    $0x1,%esi
    1579:	6a 01                	push   $0x1
    157b:	53                   	push   %ebx
    157c:	57                   	push   %edi
    157d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1580:	e8 f9 fe ff ff       	call   147e <write>

  while(--i >= 0)
    1585:	83 c4 10             	add    $0x10,%esp
    1588:	39 de                	cmp    %ebx,%esi
    158a:	75 e4                	jne    1570 <printint+0x60>
    putc(fd, buf[i]);
}
    158c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    158f:	5b                   	pop    %ebx
    1590:	5e                   	pop    %esi
    1591:	5f                   	pop    %edi
    1592:	5d                   	pop    %ebp
    1593:	c3                   	ret    
    1594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1598:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    159f:	eb 90                	jmp    1531 <printint+0x21>
    15a1:	eb 0d                	jmp    15b0 <printf>
    15a3:	90                   	nop
    15a4:	90                   	nop
    15a5:	90                   	nop
    15a6:	90                   	nop
    15a7:	90                   	nop
    15a8:	90                   	nop
    15a9:	90                   	nop
    15aa:	90                   	nop
    15ab:	90                   	nop
    15ac:	90                   	nop
    15ad:	90                   	nop
    15ae:	90                   	nop
    15af:	90                   	nop

000015b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    15b0:	55                   	push   %ebp
    15b1:	89 e5                	mov    %esp,%ebp
    15b3:	57                   	push   %edi
    15b4:	56                   	push   %esi
    15b5:	53                   	push   %ebx
    15b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15b9:	8b 75 0c             	mov    0xc(%ebp),%esi
    15bc:	0f b6 1e             	movzbl (%esi),%ebx
    15bf:	84 db                	test   %bl,%bl
    15c1:	0f 84 bf 00 00 00    	je     1686 <printf+0xd6>
    15c7:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    15ca:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    15cd:	31 d2                	xor    %edx,%edx
    15cf:	eb 39                	jmp    160a <printf+0x5a>
    15d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    15d8:	83 f8 25             	cmp    $0x25,%eax
    15db:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    15de:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    15e3:	74 1a                	je     15ff <printf+0x4f>
  write(fd, &c, 1);
    15e5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    15e8:	83 ec 04             	sub    $0x4,%esp
    15eb:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    15ee:	6a 01                	push   $0x1
    15f0:	50                   	push   %eax
    15f1:	ff 75 08             	pushl  0x8(%ebp)
    15f4:	e8 85 fe ff ff       	call   147e <write>
    15f9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    15fc:	83 c4 10             	add    $0x10,%esp
    15ff:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1602:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1606:	84 db                	test   %bl,%bl
    1608:	74 7c                	je     1686 <printf+0xd6>
    if(state == 0){
    160a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    160c:	0f be cb             	movsbl %bl,%ecx
    160f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1612:	74 c4                	je     15d8 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1614:	83 fa 25             	cmp    $0x25,%edx
    1617:	75 e6                	jne    15ff <printf+0x4f>
      if(c == 'd'){
    1619:	83 f8 64             	cmp    $0x64,%eax
    161c:	0f 84 a6 00 00 00    	je     16c8 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1622:	83 f8 6c             	cmp    $0x6c,%eax
    1625:	0f 84 ad 00 00 00    	je     16d8 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    162b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1631:	83 f9 70             	cmp    $0x70,%ecx
    1634:	74 5a                	je     1690 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1636:	83 f8 73             	cmp    $0x73,%eax
    1639:	0f 84 e1 00 00 00    	je     1720 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    163f:	83 f8 63             	cmp    $0x63,%eax
    1642:	0f 84 28 01 00 00    	je     1770 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1648:	83 f8 25             	cmp    $0x25,%eax
    164b:	74 6b                	je     16b8 <printf+0x108>
  write(fd, &c, 1);
    164d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1650:	83 ec 04             	sub    $0x4,%esp
    1653:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1657:	6a 01                	push   $0x1
    1659:	50                   	push   %eax
    165a:	ff 75 08             	pushl  0x8(%ebp)
    165d:	e8 1c fe ff ff       	call   147e <write>
    1662:	83 c4 0c             	add    $0xc,%esp
    1665:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1668:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    166b:	6a 01                	push   $0x1
    166d:	50                   	push   %eax
    166e:	ff 75 08             	pushl  0x8(%ebp)
    1671:	83 c6 01             	add    $0x1,%esi
    1674:	e8 05 fe ff ff       	call   147e <write>
  for(i = 0; fmt[i]; i++){
    1679:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    167d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1680:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1682:	84 db                	test   %bl,%bl
    1684:	75 84                	jne    160a <printf+0x5a>
    }
  }
}
    1686:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1689:	5b                   	pop    %ebx
    168a:	5e                   	pop    %esi
    168b:	5f                   	pop    %edi
    168c:	5d                   	pop    %ebp
    168d:	c3                   	ret    
    168e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1690:	83 ec 0c             	sub    $0xc,%esp
    1693:	b9 10 00 00 00       	mov    $0x10,%ecx
    1698:	6a 00                	push   $0x0
    169a:	8b 17                	mov    (%edi),%edx
    169c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    169f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    16a2:	e8 69 fe ff ff       	call   1510 <printint>
    16a7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16aa:	31 d2                	xor    %edx,%edx
    16ac:	e9 4e ff ff ff       	jmp    15ff <printf+0x4f>
    16b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    16b8:	83 ec 04             	sub    $0x4,%esp
    16bb:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    16be:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16c1:	6a 01                	push   $0x1
    16c3:	eb a8                	jmp    166d <printf+0xbd>
    16c5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    16c8:	83 ec 0c             	sub    $0xc,%esp
    16cb:	b9 0a 00 00 00       	mov    $0xa,%ecx
    16d0:	6a 01                	push   $0x1
    16d2:	eb c6                	jmp    169a <printf+0xea>
    16d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    16d8:	8b 57 04             	mov    0x4(%edi),%edx
    16db:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    16dd:	85 d2                	test   %edx,%edx
    16df:	74 15                	je     16f6 <printf+0x146>
    16e1:	83 ec 0c             	sub    $0xc,%esp
    16e4:	8b 45 08             	mov    0x8(%ebp),%eax
    16e7:	b9 10 00 00 00       	mov    $0x10,%ecx
    16ec:	6a 00                	push   $0x0
    16ee:	e8 1d fe ff ff       	call   1510 <printint>
    16f3:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    16f6:	83 ec 0c             	sub    $0xc,%esp
    16f9:	8b 45 08             	mov    0x8(%ebp),%eax
    16fc:	89 da                	mov    %ebx,%edx
    16fe:	6a 00                	push   $0x0
    1700:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1705:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1708:	e8 03 fe ff ff       	call   1510 <printint>
    170d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1710:	31 d2                	xor    %edx,%edx
    1712:	e9 e8 fe ff ff       	jmp    15ff <printf+0x4f>
    1717:	89 f6                	mov    %esi,%esi
    1719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1720:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1722:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1725:	85 c9                	test   %ecx,%ecx
    1727:	74 6a                	je     1793 <printf+0x1e3>
        while(*s != 0){
    1729:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    172c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    172e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1730:	84 c0                	test   %al,%al
    1732:	0f 84 c7 fe ff ff    	je     15ff <printf+0x4f>
    1738:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    173b:	89 de                	mov    %ebx,%esi
    173d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1740:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1743:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1746:	83 ec 04             	sub    $0x4,%esp
    1749:	6a 01                	push   $0x1
          s++;
    174b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    174e:	50                   	push   %eax
    174f:	53                   	push   %ebx
    1750:	e8 29 fd ff ff       	call   147e <write>
        while(*s != 0){
    1755:	0f b6 06             	movzbl (%esi),%eax
    1758:	83 c4 10             	add    $0x10,%esp
    175b:	84 c0                	test   %al,%al
    175d:	75 e1                	jne    1740 <printf+0x190>
    175f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1762:	31 d2                	xor    %edx,%edx
    1764:	e9 96 fe ff ff       	jmp    15ff <printf+0x4f>
    1769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1770:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1772:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1775:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1778:	6a 01                	push   $0x1
        putc(fd, *ap);
    177a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    177d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1780:	50                   	push   %eax
    1781:	ff 75 08             	pushl  0x8(%ebp)
    1784:	e8 f5 fc ff ff       	call   147e <write>
    1789:	83 c4 10             	add    $0x10,%esp
      state = 0;
    178c:	31 d2                	xor    %edx,%edx
    178e:	e9 6c fe ff ff       	jmp    15ff <printf+0x4f>
          s = "(null)";
    1793:	bb d3 17 00 00       	mov    $0x17d3,%ebx
        while(*s != 0){
    1798:	b8 28 00 00 00       	mov    $0x28,%eax
    179d:	eb 99                	jmp    1738 <printf+0x188>
