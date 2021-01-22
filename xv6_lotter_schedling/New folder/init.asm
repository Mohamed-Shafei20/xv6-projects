
_init:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	53                   	push   %ebx
    100e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    100f:	83 ec 08             	sub    $0x8,%esp
    1012:	6a 02                	push   $0x2
    1014:	68 10 18 00 00       	push   $0x1810
    1019:	e8 f0 04 00 00       	call   150e <open>
    101e:	83 c4 10             	add    $0x10,%esp
    1021:	85 c0                	test   %eax,%eax
    1023:	0f 88 9f 00 00 00    	js     10c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
    1029:	83 ec 0c             	sub    $0xc,%esp
    102c:	6a 00                	push   $0x0
    102e:	e8 13 05 00 00       	call   1546 <dup>
  dup(0);  // stderr
    1033:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    103a:	e8 07 05 00 00       	call   1546 <dup>
    103f:	83 c4 10             	add    $0x10,%esp
    1042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
    1048:	83 ec 08             	sub    $0x8,%esp
    104b:	68 18 18 00 00       	push   $0x1818
    1050:	6a 01                	push   $0x1
    1052:	e8 c9 05 00 00       	call   1620 <printf>
    pid = fork();
    1057:	e8 6a 04 00 00       	call   14c6 <fork>
    if(pid < 0){
    105c:	83 c4 10             	add    $0x10,%esp
    105f:	85 c0                	test   %eax,%eax
    pid = fork();
    1061:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    1063:	78 2c                	js     1091 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
    1065:	74 3d                	je     10a4 <main+0xa4>
    1067:	89 f6                	mov    %esi,%esi
    1069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
    1070:	e8 61 04 00 00       	call   14d6 <wait>
    1075:	85 c0                	test   %eax,%eax
    1077:	78 cf                	js     1048 <main+0x48>
    1079:	39 c3                	cmp    %eax,%ebx
    107b:	74 cb                	je     1048 <main+0x48>
      printf(1, "zombie!\n");
    107d:	83 ec 08             	sub    $0x8,%esp
    1080:	68 57 18 00 00       	push   $0x1857
    1085:	6a 01                	push   $0x1
    1087:	e8 94 05 00 00       	call   1620 <printf>
    108c:	83 c4 10             	add    $0x10,%esp
    108f:	eb df                	jmp    1070 <main+0x70>
      printf(1, "init: fork failed\n");
    1091:	53                   	push   %ebx
    1092:	53                   	push   %ebx
    1093:	68 2b 18 00 00       	push   $0x182b
    1098:	6a 01                	push   $0x1
    109a:	e8 81 05 00 00       	call   1620 <printf>
      exit();
    109f:	e8 2a 04 00 00       	call   14ce <exit>
      exec("sh", argv);
    10a4:	50                   	push   %eax
    10a5:	50                   	push   %eax
    10a6:	68 10 1b 00 00       	push   $0x1b10
    10ab:	68 3e 18 00 00       	push   $0x183e
    10b0:	e8 51 04 00 00       	call   1506 <exec>
      printf(1, "init: exec sh failed\n");
    10b5:	5a                   	pop    %edx
    10b6:	59                   	pop    %ecx
    10b7:	68 41 18 00 00       	push   $0x1841
    10bc:	6a 01                	push   $0x1
    10be:	e8 5d 05 00 00       	call   1620 <printf>
      exit();
    10c3:	e8 06 04 00 00       	call   14ce <exit>
    mknod("console", 1, 1);
    10c8:	50                   	push   %eax
    10c9:	6a 01                	push   $0x1
    10cb:	6a 01                	push   $0x1
    10cd:	68 10 18 00 00       	push   $0x1810
    10d2:	e8 3f 04 00 00       	call   1516 <mknod>
    open("console", O_RDWR);
    10d7:	58                   	pop    %eax
    10d8:	5a                   	pop    %edx
    10d9:	6a 02                	push   $0x2
    10db:	68 10 18 00 00       	push   $0x1810
    10e0:	e8 29 04 00 00       	call   150e <open>
    10e5:	83 c4 10             	add    $0x10,%esp
    10e8:	e9 3c ff ff ff       	jmp    1029 <main+0x29>
    10ed:	66 90                	xchg   %ax,%ax
    10ef:	90                   	nop

000010f0 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	53                   	push   %ebx
    10f4:	8b 45 08             	mov    0x8(%ebp),%eax
    10f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10fa:	89 c2                	mov    %eax,%edx
    10fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1100:	83 c1 01             	add    $0x1,%ecx
    1103:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1107:	83 c2 01             	add    $0x1,%edx
    110a:	84 db                	test   %bl,%bl
    110c:	88 5a ff             	mov    %bl,-0x1(%edx)
    110f:	75 ef                	jne    1100 <strcpy+0x10>
    ;
  return os;
}
    1111:	5b                   	pop    %ebx
    1112:	5d                   	pop    %ebp
    1113:	c3                   	ret    
    1114:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    111a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	53                   	push   %ebx
    1124:	8b 55 08             	mov    0x8(%ebp),%edx
    1127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    112a:	0f b6 02             	movzbl (%edx),%eax
    112d:	0f b6 19             	movzbl (%ecx),%ebx
    1130:	84 c0                	test   %al,%al
    1132:	75 1c                	jne    1150 <strcmp+0x30>
    1134:	eb 2a                	jmp    1160 <strcmp+0x40>
    1136:	8d 76 00             	lea    0x0(%esi),%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1140:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1143:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1146:	83 c1 01             	add    $0x1,%ecx
    1149:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    114c:	84 c0                	test   %al,%al
    114e:	74 10                	je     1160 <strcmp+0x40>
    1150:	38 d8                	cmp    %bl,%al
    1152:	74 ec                	je     1140 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1154:	29 d8                	sub    %ebx,%eax
}
    1156:	5b                   	pop    %ebx
    1157:	5d                   	pop    %ebp
    1158:	c3                   	ret    
    1159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1160:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1162:	29 d8                	sub    %ebx,%eax
}
    1164:	5b                   	pop    %ebx
    1165:	5d                   	pop    %ebp
    1166:	c3                   	ret    
    1167:	89 f6                	mov    %esi,%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001170 <strlen>:

uint
strlen(const char *s)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1176:	80 39 00             	cmpb   $0x0,(%ecx)
    1179:	74 15                	je     1190 <strlen+0x20>
    117b:	31 d2                	xor    %edx,%edx
    117d:	8d 76 00             	lea    0x0(%esi),%esi
    1180:	83 c2 01             	add    $0x1,%edx
    1183:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1187:	89 d0                	mov    %edx,%eax
    1189:	75 f5                	jne    1180 <strlen+0x10>
    ;
  return n;
}
    118b:	5d                   	pop    %ebp
    118c:	c3                   	ret    
    118d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1190:	31 c0                	xor    %eax,%eax
}
    1192:	5d                   	pop    %ebp
    1193:	c3                   	ret    
    1194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    119a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000011a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	57                   	push   %edi
    11a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ad:	89 d7                	mov    %edx,%edi
    11af:	fc                   	cld    
    11b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11b2:	89 d0                	mov    %edx,%eax
    11b4:	5f                   	pop    %edi
    11b5:	5d                   	pop    %ebp
    11b6:	c3                   	ret    
    11b7:	89 f6                	mov    %esi,%esi
    11b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011c0 <strchr>:

char*
strchr(const char *s, char c)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	53                   	push   %ebx
    11c4:	8b 45 08             	mov    0x8(%ebp),%eax
    11c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    11ca:	0f b6 10             	movzbl (%eax),%edx
    11cd:	84 d2                	test   %dl,%dl
    11cf:	74 1d                	je     11ee <strchr+0x2e>
    if(*s == c)
    11d1:	38 d3                	cmp    %dl,%bl
    11d3:	89 d9                	mov    %ebx,%ecx
    11d5:	75 0d                	jne    11e4 <strchr+0x24>
    11d7:	eb 17                	jmp    11f0 <strchr+0x30>
    11d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11e0:	38 ca                	cmp    %cl,%dl
    11e2:	74 0c                	je     11f0 <strchr+0x30>
  for(; *s; s++)
    11e4:	83 c0 01             	add    $0x1,%eax
    11e7:	0f b6 10             	movzbl (%eax),%edx
    11ea:	84 d2                	test   %dl,%dl
    11ec:	75 f2                	jne    11e0 <strchr+0x20>
      return (char*)s;
  return 0;
    11ee:	31 c0                	xor    %eax,%eax
}
    11f0:	5b                   	pop    %ebx
    11f1:	5d                   	pop    %ebp
    11f2:	c3                   	ret    
    11f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001200 <gets>:

char*
gets(char *buf, int max)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	57                   	push   %edi
    1204:	56                   	push   %esi
    1205:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1206:	31 f6                	xor    %esi,%esi
    1208:	89 f3                	mov    %esi,%ebx
{
    120a:	83 ec 1c             	sub    $0x1c,%esp
    120d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1210:	eb 2f                	jmp    1241 <gets+0x41>
    1212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1218:	8d 45 e7             	lea    -0x19(%ebp),%eax
    121b:	83 ec 04             	sub    $0x4,%esp
    121e:	6a 01                	push   $0x1
    1220:	50                   	push   %eax
    1221:	6a 00                	push   $0x0
    1223:	e8 be 02 00 00       	call   14e6 <read>
    if(cc < 1)
    1228:	83 c4 10             	add    $0x10,%esp
    122b:	85 c0                	test   %eax,%eax
    122d:	7e 1c                	jle    124b <gets+0x4b>
      break;
    buf[i++] = c;
    122f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1233:	83 c7 01             	add    $0x1,%edi
    1236:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1239:	3c 0a                	cmp    $0xa,%al
    123b:	74 23                	je     1260 <gets+0x60>
    123d:	3c 0d                	cmp    $0xd,%al
    123f:	74 1f                	je     1260 <gets+0x60>
  for(i=0; i+1 < max; ){
    1241:	83 c3 01             	add    $0x1,%ebx
    1244:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1247:	89 fe                	mov    %edi,%esi
    1249:	7c cd                	jl     1218 <gets+0x18>
    124b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    124d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1250:	c6 03 00             	movb   $0x0,(%ebx)
}
    1253:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1256:	5b                   	pop    %ebx
    1257:	5e                   	pop    %esi
    1258:	5f                   	pop    %edi
    1259:	5d                   	pop    %ebp
    125a:	c3                   	ret    
    125b:	90                   	nop
    125c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1260:	8b 75 08             	mov    0x8(%ebp),%esi
    1263:	8b 45 08             	mov    0x8(%ebp),%eax
    1266:	01 de                	add    %ebx,%esi
    1268:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    126a:	c6 03 00             	movb   $0x0,(%ebx)
}
    126d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1270:	5b                   	pop    %ebx
    1271:	5e                   	pop    %esi
    1272:	5f                   	pop    %edi
    1273:	5d                   	pop    %ebp
    1274:	c3                   	ret    
    1275:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001280 <stat>:

int
stat(const char *n, struct stat *st)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	56                   	push   %esi
    1284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1285:	83 ec 08             	sub    $0x8,%esp
    1288:	6a 00                	push   $0x0
    128a:	ff 75 08             	pushl  0x8(%ebp)
    128d:	e8 7c 02 00 00       	call   150e <open>
  if(fd < 0)
    1292:	83 c4 10             	add    $0x10,%esp
    1295:	85 c0                	test   %eax,%eax
    1297:	78 27                	js     12c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1299:	83 ec 08             	sub    $0x8,%esp
    129c:	ff 75 0c             	pushl  0xc(%ebp)
    129f:	89 c3                	mov    %eax,%ebx
    12a1:	50                   	push   %eax
    12a2:	e8 7f 02 00 00       	call   1526 <fstat>
  close(fd);
    12a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12aa:	89 c6                	mov    %eax,%esi
  close(fd);
    12ac:	e8 45 02 00 00       	call   14f6 <close>
  return r;
    12b1:	83 c4 10             	add    $0x10,%esp
}
    12b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12b7:	89 f0                	mov    %esi,%eax
    12b9:	5b                   	pop    %ebx
    12ba:	5e                   	pop    %esi
    12bb:	5d                   	pop    %ebp
    12bc:	c3                   	ret    
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    12c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12c5:	eb ed                	jmp    12b4 <stat+0x34>
    12c7:	89 f6                	mov    %esi,%esi
    12c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012d0 <atoi>:

int
atoi(const char *s)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	53                   	push   %ebx
    12d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12d7:	0f be 11             	movsbl (%ecx),%edx
    12da:	8d 42 d0             	lea    -0x30(%edx),%eax
    12dd:	3c 09                	cmp    $0x9,%al
  n = 0;
    12df:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    12e4:	77 1f                	ja     1305 <atoi+0x35>
    12e6:	8d 76 00             	lea    0x0(%esi),%esi
    12e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    12f0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    12f3:	83 c1 01             	add    $0x1,%ecx
    12f6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    12fa:	0f be 11             	movsbl (%ecx),%edx
    12fd:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1300:	80 fb 09             	cmp    $0x9,%bl
    1303:	76 eb                	jbe    12f0 <atoi+0x20>
  return n;
}
    1305:	5b                   	pop    %ebx
    1306:	5d                   	pop    %ebp
    1307:	c3                   	ret    
    1308:	90                   	nop
    1309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	56                   	push   %esi
    1314:	53                   	push   %ebx
    1315:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1318:	8b 45 08             	mov    0x8(%ebp),%eax
    131b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    131e:	85 db                	test   %ebx,%ebx
    1320:	7e 14                	jle    1336 <memmove+0x26>
    1322:	31 d2                	xor    %edx,%edx
    1324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1328:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    132c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    132f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1332:	39 d3                	cmp    %edx,%ebx
    1334:	75 f2                	jne    1328 <memmove+0x18>
  return vdst;
}
    1336:	5b                   	pop    %ebx
    1337:	5e                   	pop    %esi
    1338:	5d                   	pop    %ebp
    1339:	c3                   	ret    
    133a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001340 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1340:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1341:	a1 18 1b 00 00       	mov    0x1b18,%eax
{
    1346:	89 e5                	mov    %esp,%ebp
    1348:	57                   	push   %edi
    1349:	56                   	push   %esi
    134a:	53                   	push   %ebx
    134b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    134e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1358:	39 c8                	cmp    %ecx,%eax
    135a:	8b 10                	mov    (%eax),%edx
    135c:	73 32                	jae    1390 <free+0x50>
    135e:	39 d1                	cmp    %edx,%ecx
    1360:	72 04                	jb     1366 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1362:	39 d0                	cmp    %edx,%eax
    1364:	72 32                	jb     1398 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1366:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1369:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    136c:	39 fa                	cmp    %edi,%edx
    136e:	74 30                	je     13a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1370:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1373:	8b 50 04             	mov    0x4(%eax),%edx
    1376:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1379:	39 f1                	cmp    %esi,%ecx
    137b:	74 3a                	je     13b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    137d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    137f:	a3 18 1b 00 00       	mov    %eax,0x1b18
}
    1384:	5b                   	pop    %ebx
    1385:	5e                   	pop    %esi
    1386:	5f                   	pop    %edi
    1387:	5d                   	pop    %ebp
    1388:	c3                   	ret    
    1389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1390:	39 d0                	cmp    %edx,%eax
    1392:	72 04                	jb     1398 <free+0x58>
    1394:	39 d1                	cmp    %edx,%ecx
    1396:	72 ce                	jb     1366 <free+0x26>
{
    1398:	89 d0                	mov    %edx,%eax
    139a:	eb bc                	jmp    1358 <free+0x18>
    139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    13a0:	03 72 04             	add    0x4(%edx),%esi
    13a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    13a6:	8b 10                	mov    (%eax),%edx
    13a8:	8b 12                	mov    (%edx),%edx
    13aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    13ad:	8b 50 04             	mov    0x4(%eax),%edx
    13b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    13b3:	39 f1                	cmp    %esi,%ecx
    13b5:	75 c6                	jne    137d <free+0x3d>
    p->s.size += bp->s.size;
    13b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    13ba:	a3 18 1b 00 00       	mov    %eax,0x1b18
    p->s.size += bp->s.size;
    13bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    13c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    13c5:	89 10                	mov    %edx,(%eax)
}
    13c7:	5b                   	pop    %ebx
    13c8:	5e                   	pop    %esi
    13c9:	5f                   	pop    %edi
    13ca:	5d                   	pop    %ebp
    13cb:	c3                   	ret    
    13cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    13d3:	57                   	push   %edi
    13d4:	56                   	push   %esi
    13d5:	53                   	push   %ebx
    13d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    13dc:	8b 15 18 1b 00 00    	mov    0x1b18,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13e2:	8d 78 07             	lea    0x7(%eax),%edi
    13e5:	c1 ef 03             	shr    $0x3,%edi
    13e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    13eb:	85 d2                	test   %edx,%edx
    13ed:	0f 84 9d 00 00 00    	je     1490 <malloc+0xc0>
    13f3:	8b 02                	mov    (%edx),%eax
    13f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    13f8:	39 cf                	cmp    %ecx,%edi
    13fa:	76 6c                	jbe    1468 <malloc+0x98>
    13fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1402:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1407:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    140a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1411:	eb 0e                	jmp    1421 <malloc+0x51>
    1413:	90                   	nop
    1414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1418:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    141a:	8b 48 04             	mov    0x4(%eax),%ecx
    141d:	39 f9                	cmp    %edi,%ecx
    141f:	73 47                	jae    1468 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1421:	39 05 18 1b 00 00    	cmp    %eax,0x1b18
    1427:	89 c2                	mov    %eax,%edx
    1429:	75 ed                	jne    1418 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    142b:	83 ec 0c             	sub    $0xc,%esp
    142e:	56                   	push   %esi
    142f:	e8 22 01 00 00       	call   1556 <sbrk>
  if(p == (char*)-1)
    1434:	83 c4 10             	add    $0x10,%esp
    1437:	83 f8 ff             	cmp    $0xffffffff,%eax
    143a:	74 1c                	je     1458 <malloc+0x88>
  hp->s.size = nu;
    143c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    143f:	83 ec 0c             	sub    $0xc,%esp
    1442:	83 c0 08             	add    $0x8,%eax
    1445:	50                   	push   %eax
    1446:	e8 f5 fe ff ff       	call   1340 <free>
  return freep;
    144b:	8b 15 18 1b 00 00    	mov    0x1b18,%edx
      if((p = morecore(nunits)) == 0)
    1451:	83 c4 10             	add    $0x10,%esp
    1454:	85 d2                	test   %edx,%edx
    1456:	75 c0                	jne    1418 <malloc+0x48>
        return 0;
  }
}
    1458:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    145b:	31 c0                	xor    %eax,%eax
}
    145d:	5b                   	pop    %ebx
    145e:	5e                   	pop    %esi
    145f:	5f                   	pop    %edi
    1460:	5d                   	pop    %ebp
    1461:	c3                   	ret    
    1462:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1468:	39 cf                	cmp    %ecx,%edi
    146a:	74 54                	je     14c0 <malloc+0xf0>
        p->s.size -= nunits;
    146c:	29 f9                	sub    %edi,%ecx
    146e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1471:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1474:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1477:	89 15 18 1b 00 00    	mov    %edx,0x1b18
}
    147d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1480:	83 c0 08             	add    $0x8,%eax
}
    1483:	5b                   	pop    %ebx
    1484:	5e                   	pop    %esi
    1485:	5f                   	pop    %edi
    1486:	5d                   	pop    %ebp
    1487:	c3                   	ret    
    1488:	90                   	nop
    1489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1490:	c7 05 18 1b 00 00 1c 	movl   $0x1b1c,0x1b18
    1497:	1b 00 00 
    149a:	c7 05 1c 1b 00 00 1c 	movl   $0x1b1c,0x1b1c
    14a1:	1b 00 00 
    base.s.size = 0;
    14a4:	b8 1c 1b 00 00       	mov    $0x1b1c,%eax
    14a9:	c7 05 20 1b 00 00 00 	movl   $0x0,0x1b20
    14b0:	00 00 00 
    14b3:	e9 44 ff ff ff       	jmp    13fc <malloc+0x2c>
    14b8:	90                   	nop
    14b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    14c0:	8b 08                	mov    (%eax),%ecx
    14c2:	89 0a                	mov    %ecx,(%edx)
    14c4:	eb b1                	jmp    1477 <malloc+0xa7>

000014c6 <fork>:
    14c6:	b8 01 00 00 00       	mov    $0x1,%eax
    14cb:	cd 40                	int    $0x40
    14cd:	c3                   	ret    

000014ce <exit>:
    14ce:	b8 02 00 00 00       	mov    $0x2,%eax
    14d3:	cd 40                	int    $0x40
    14d5:	c3                   	ret    

000014d6 <wait>:
    14d6:	b8 03 00 00 00       	mov    $0x3,%eax
    14db:	cd 40                	int    $0x40
    14dd:	c3                   	ret    

000014de <pipe>:
    14de:	b8 04 00 00 00       	mov    $0x4,%eax
    14e3:	cd 40                	int    $0x40
    14e5:	c3                   	ret    

000014e6 <read>:
    14e6:	b8 05 00 00 00       	mov    $0x5,%eax
    14eb:	cd 40                	int    $0x40
    14ed:	c3                   	ret    

000014ee <write>:
    14ee:	b8 10 00 00 00       	mov    $0x10,%eax
    14f3:	cd 40                	int    $0x40
    14f5:	c3                   	ret    

000014f6 <close>:
    14f6:	b8 15 00 00 00       	mov    $0x15,%eax
    14fb:	cd 40                	int    $0x40
    14fd:	c3                   	ret    

000014fe <kill>:
    14fe:	b8 06 00 00 00       	mov    $0x6,%eax
    1503:	cd 40                	int    $0x40
    1505:	c3                   	ret    

00001506 <exec>:
    1506:	b8 07 00 00 00       	mov    $0x7,%eax
    150b:	cd 40                	int    $0x40
    150d:	c3                   	ret    

0000150e <open>:
    150e:	b8 0f 00 00 00       	mov    $0xf,%eax
    1513:	cd 40                	int    $0x40
    1515:	c3                   	ret    

00001516 <mknod>:
    1516:	b8 11 00 00 00       	mov    $0x11,%eax
    151b:	cd 40                	int    $0x40
    151d:	c3                   	ret    

0000151e <unlink>:
    151e:	b8 12 00 00 00       	mov    $0x12,%eax
    1523:	cd 40                	int    $0x40
    1525:	c3                   	ret    

00001526 <fstat>:
    1526:	b8 08 00 00 00       	mov    $0x8,%eax
    152b:	cd 40                	int    $0x40
    152d:	c3                   	ret    

0000152e <link>:
    152e:	b8 13 00 00 00       	mov    $0x13,%eax
    1533:	cd 40                	int    $0x40
    1535:	c3                   	ret    

00001536 <mkdir>:
    1536:	b8 14 00 00 00       	mov    $0x14,%eax
    153b:	cd 40                	int    $0x40
    153d:	c3                   	ret    

0000153e <chdir>:
    153e:	b8 09 00 00 00       	mov    $0x9,%eax
    1543:	cd 40                	int    $0x40
    1545:	c3                   	ret    

00001546 <dup>:
    1546:	b8 0a 00 00 00       	mov    $0xa,%eax
    154b:	cd 40                	int    $0x40
    154d:	c3                   	ret    

0000154e <getpid>:
    154e:	b8 0b 00 00 00       	mov    $0xb,%eax
    1553:	cd 40                	int    $0x40
    1555:	c3                   	ret    

00001556 <sbrk>:
    1556:	b8 0c 00 00 00       	mov    $0xc,%eax
    155b:	cd 40                	int    $0x40
    155d:	c3                   	ret    

0000155e <sleep>:
    155e:	b8 0d 00 00 00       	mov    $0xd,%eax
    1563:	cd 40                	int    $0x40
    1565:	c3                   	ret    

00001566 <uptime>:
    1566:	b8 0e 00 00 00       	mov    $0xe,%eax
    156b:	cd 40                	int    $0x40
    156d:	c3                   	ret    

0000156e <settickets>:
    156e:	b8 16 00 00 00       	mov    $0x16,%eax
    1573:	cd 40                	int    $0x40
    1575:	c3                   	ret    

00001576 <getpinfo>:
    1576:	b8 17 00 00 00       	mov    $0x17,%eax
    157b:	cd 40                	int    $0x40
    157d:	c3                   	ret    
    157e:	66 90                	xchg   %ax,%ax

00001580 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1580:	55                   	push   %ebp
    1581:	89 e5                	mov    %esp,%ebp
    1583:	57                   	push   %edi
    1584:	56                   	push   %esi
    1585:	53                   	push   %ebx
    1586:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1589:	85 d2                	test   %edx,%edx
{
    158b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    158e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1590:	79 76                	jns    1608 <printint+0x88>
    1592:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1596:	74 70                	je     1608 <printint+0x88>
    x = -xx;
    1598:	f7 d8                	neg    %eax
    neg = 1;
    159a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    15a1:	31 f6                	xor    %esi,%esi
    15a3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    15a6:	eb 0a                	jmp    15b2 <printint+0x32>
    15a8:	90                   	nop
    15a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    15b0:	89 fe                	mov    %edi,%esi
    15b2:	31 d2                	xor    %edx,%edx
    15b4:	8d 7e 01             	lea    0x1(%esi),%edi
    15b7:	f7 f1                	div    %ecx
    15b9:	0f b6 92 68 18 00 00 	movzbl 0x1868(%edx),%edx
  }while((x /= base) != 0);
    15c0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    15c2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    15c5:	75 e9                	jne    15b0 <printint+0x30>
  if(neg)
    15c7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    15ca:	85 c0                	test   %eax,%eax
    15cc:	74 08                	je     15d6 <printint+0x56>
    buf[i++] = '-';
    15ce:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    15d3:	8d 7e 02             	lea    0x2(%esi),%edi
    15d6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    15da:	8b 7d c0             	mov    -0x40(%ebp),%edi
    15dd:	8d 76 00             	lea    0x0(%esi),%esi
    15e0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    15e3:	83 ec 04             	sub    $0x4,%esp
    15e6:	83 ee 01             	sub    $0x1,%esi
    15e9:	6a 01                	push   $0x1
    15eb:	53                   	push   %ebx
    15ec:	57                   	push   %edi
    15ed:	88 45 d7             	mov    %al,-0x29(%ebp)
    15f0:	e8 f9 fe ff ff       	call   14ee <write>

  while(--i >= 0)
    15f5:	83 c4 10             	add    $0x10,%esp
    15f8:	39 de                	cmp    %ebx,%esi
    15fa:	75 e4                	jne    15e0 <printint+0x60>
    putc(fd, buf[i]);
}
    15fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15ff:	5b                   	pop    %ebx
    1600:	5e                   	pop    %esi
    1601:	5f                   	pop    %edi
    1602:	5d                   	pop    %ebp
    1603:	c3                   	ret    
    1604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1608:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    160f:	eb 90                	jmp    15a1 <printint+0x21>
    1611:	eb 0d                	jmp    1620 <printf>
    1613:	90                   	nop
    1614:	90                   	nop
    1615:	90                   	nop
    1616:	90                   	nop
    1617:	90                   	nop
    1618:	90                   	nop
    1619:	90                   	nop
    161a:	90                   	nop
    161b:	90                   	nop
    161c:	90                   	nop
    161d:	90                   	nop
    161e:	90                   	nop
    161f:	90                   	nop

00001620 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1620:	55                   	push   %ebp
    1621:	89 e5                	mov    %esp,%ebp
    1623:	57                   	push   %edi
    1624:	56                   	push   %esi
    1625:	53                   	push   %ebx
    1626:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1629:	8b 75 0c             	mov    0xc(%ebp),%esi
    162c:	0f b6 1e             	movzbl (%esi),%ebx
    162f:	84 db                	test   %bl,%bl
    1631:	0f 84 bf 00 00 00    	je     16f6 <printf+0xd6>
    1637:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    163a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    163d:	31 d2                	xor    %edx,%edx
    163f:	eb 39                	jmp    167a <printf+0x5a>
    1641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1648:	83 f8 25             	cmp    $0x25,%eax
    164b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    164e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1653:	74 1a                	je     166f <printf+0x4f>
  write(fd, &c, 1);
    1655:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1658:	83 ec 04             	sub    $0x4,%esp
    165b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    165e:	6a 01                	push   $0x1
    1660:	50                   	push   %eax
    1661:	ff 75 08             	pushl  0x8(%ebp)
    1664:	e8 85 fe ff ff       	call   14ee <write>
    1669:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    166c:	83 c4 10             	add    $0x10,%esp
    166f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1672:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1676:	84 db                	test   %bl,%bl
    1678:	74 7c                	je     16f6 <printf+0xd6>
    if(state == 0){
    167a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    167c:	0f be cb             	movsbl %bl,%ecx
    167f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1682:	74 c4                	je     1648 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1684:	83 fa 25             	cmp    $0x25,%edx
    1687:	75 e6                	jne    166f <printf+0x4f>
      if(c == 'd'){
    1689:	83 f8 64             	cmp    $0x64,%eax
    168c:	0f 84 a6 00 00 00    	je     1738 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1692:	83 f8 6c             	cmp    $0x6c,%eax
    1695:	0f 84 ad 00 00 00    	je     1748 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    169b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    16a1:	83 f9 70             	cmp    $0x70,%ecx
    16a4:	74 5a                	je     1700 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    16a6:	83 f8 73             	cmp    $0x73,%eax
    16a9:	0f 84 e1 00 00 00    	je     1790 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    16af:	83 f8 63             	cmp    $0x63,%eax
    16b2:	0f 84 28 01 00 00    	je     17e0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    16b8:	83 f8 25             	cmp    $0x25,%eax
    16bb:	74 6b                	je     1728 <printf+0x108>
  write(fd, &c, 1);
    16bd:	8d 45 e7             	lea    -0x19(%ebp),%eax
    16c0:	83 ec 04             	sub    $0x4,%esp
    16c3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    16c7:	6a 01                	push   $0x1
    16c9:	50                   	push   %eax
    16ca:	ff 75 08             	pushl  0x8(%ebp)
    16cd:	e8 1c fe ff ff       	call   14ee <write>
    16d2:	83 c4 0c             	add    $0xc,%esp
    16d5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    16d8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    16db:	6a 01                	push   $0x1
    16dd:	50                   	push   %eax
    16de:	ff 75 08             	pushl  0x8(%ebp)
    16e1:	83 c6 01             	add    $0x1,%esi
    16e4:	e8 05 fe ff ff       	call   14ee <write>
  for(i = 0; fmt[i]; i++){
    16e9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    16ed:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    16f0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    16f2:	84 db                	test   %bl,%bl
    16f4:	75 84                	jne    167a <printf+0x5a>
    }
  }
}
    16f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16f9:	5b                   	pop    %ebx
    16fa:	5e                   	pop    %esi
    16fb:	5f                   	pop    %edi
    16fc:	5d                   	pop    %ebp
    16fd:	c3                   	ret    
    16fe:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1700:	83 ec 0c             	sub    $0xc,%esp
    1703:	b9 10 00 00 00       	mov    $0x10,%ecx
    1708:	6a 00                	push   $0x0
    170a:	8b 17                	mov    (%edi),%edx
    170c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    170f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1712:	e8 69 fe ff ff       	call   1580 <printint>
    1717:	83 c4 10             	add    $0x10,%esp
      state = 0;
    171a:	31 d2                	xor    %edx,%edx
    171c:	e9 4e ff ff ff       	jmp    166f <printf+0x4f>
    1721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1728:	83 ec 04             	sub    $0x4,%esp
    172b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    172e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1731:	6a 01                	push   $0x1
    1733:	eb a8                	jmp    16dd <printf+0xbd>
    1735:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1738:	83 ec 0c             	sub    $0xc,%esp
    173b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1740:	6a 01                	push   $0x1
    1742:	eb c6                	jmp    170a <printf+0xea>
    1744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1748:	8b 57 04             	mov    0x4(%edi),%edx
    174b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    174d:	85 d2                	test   %edx,%edx
    174f:	74 15                	je     1766 <printf+0x146>
    1751:	83 ec 0c             	sub    $0xc,%esp
    1754:	8b 45 08             	mov    0x8(%ebp),%eax
    1757:	b9 10 00 00 00       	mov    $0x10,%ecx
    175c:	6a 00                	push   $0x0
    175e:	e8 1d fe ff ff       	call   1580 <printint>
    1763:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1766:	83 ec 0c             	sub    $0xc,%esp
    1769:	8b 45 08             	mov    0x8(%ebp),%eax
    176c:	89 da                	mov    %ebx,%edx
    176e:	6a 00                	push   $0x0
    1770:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1775:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1778:	e8 03 fe ff ff       	call   1580 <printint>
    177d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1780:	31 d2                	xor    %edx,%edx
    1782:	e9 e8 fe ff ff       	jmp    166f <printf+0x4f>
    1787:	89 f6                	mov    %esi,%esi
    1789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1790:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1792:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1795:	85 c9                	test   %ecx,%ecx
    1797:	74 6a                	je     1803 <printf+0x1e3>
        while(*s != 0){
    1799:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    179c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    179e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    17a0:	84 c0                	test   %al,%al
    17a2:	0f 84 c7 fe ff ff    	je     166f <printf+0x4f>
    17a8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    17ab:	89 de                	mov    %ebx,%esi
    17ad:	8b 5d 08             	mov    0x8(%ebp),%ebx
    17b0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    17b3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    17b6:	83 ec 04             	sub    $0x4,%esp
    17b9:	6a 01                	push   $0x1
          s++;
    17bb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    17be:	50                   	push   %eax
    17bf:	53                   	push   %ebx
    17c0:	e8 29 fd ff ff       	call   14ee <write>
        while(*s != 0){
    17c5:	0f b6 06             	movzbl (%esi),%eax
    17c8:	83 c4 10             	add    $0x10,%esp
    17cb:	84 c0                	test   %al,%al
    17cd:	75 e1                	jne    17b0 <printf+0x190>
    17cf:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    17d2:	31 d2                	xor    %edx,%edx
    17d4:	e9 96 fe ff ff       	jmp    166f <printf+0x4f>
    17d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    17e0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    17e2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    17e5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    17e8:	6a 01                	push   $0x1
        putc(fd, *ap);
    17ea:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    17ed:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    17f0:	50                   	push   %eax
    17f1:	ff 75 08             	pushl  0x8(%ebp)
    17f4:	e8 f5 fc ff ff       	call   14ee <write>
    17f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17fc:	31 d2                	xor    %edx,%edx
    17fe:	e9 6c fe ff ff       	jmp    166f <printf+0x4f>
          s = "(null)";
    1803:	bb 60 18 00 00       	mov    $0x1860,%ebx
        while(*s != 0){
    1808:	b8 28 00 00 00       	mov    $0x28,%eax
    180d:	eb 99                	jmp    17a8 <printf+0x188>
