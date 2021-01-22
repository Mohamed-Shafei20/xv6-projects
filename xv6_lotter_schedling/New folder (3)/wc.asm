
_wc:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

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
    1011:	be 01 00 00 00       	mov    $0x1,%esi
    1016:	83 ec 18             	sub    $0x18,%esp
    1019:	8b 01                	mov    (%ecx),%eax
    101b:	8b 59 04             	mov    0x4(%ecx),%ebx
    101e:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
    1021:	83 f8 01             	cmp    $0x1,%eax
{
    1024:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(argc <= 1){
    1027:	7e 56                	jle    107f <main+0x7f>
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	6a 00                	push   $0x0
    1035:	ff 33                	pushl  (%ebx)
    1037:	e8 62 05 00 00       	call   159e <open>
    103c:	83 c4 10             	add    $0x10,%esp
    103f:	85 c0                	test   %eax,%eax
    1041:	89 c7                	mov    %eax,%edi
    1043:	78 26                	js     106b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
    1045:	83 ec 08             	sub    $0x8,%esp
    1048:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
    104a:	83 c6 01             	add    $0x1,%esi
    wc(fd, argv[i]);
    104d:	50                   	push   %eax
    104e:	83 c3 04             	add    $0x4,%ebx
    1051:	e8 4a 00 00 00       	call   10a0 <wc>
    close(fd);
    1056:	89 3c 24             	mov    %edi,(%esp)
    1059:	e8 28 05 00 00       	call   1586 <close>
  for(i = 1; i < argc; i++){
    105e:	83 c4 10             	add    $0x10,%esp
    1061:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1064:	75 ca                	jne    1030 <main+0x30>
  }
  exit();
    1066:	e8 f3 04 00 00       	call   155e <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
    106b:	50                   	push   %eax
    106c:	ff 33                	pushl  (%ebx)
    106e:	68 c3 18 00 00       	push   $0x18c3
    1073:	6a 01                	push   $0x1
    1075:	e8 36 06 00 00       	call   16b0 <printf>
      exit();
    107a:	e8 df 04 00 00       	call   155e <exit>
    wc(0, "");
    107f:	52                   	push   %edx
    1080:	52                   	push   %edx
    1081:	68 b5 18 00 00       	push   $0x18b5
    1086:	6a 00                	push   $0x0
    1088:	e8 13 00 00 00       	call   10a0 <wc>
    exit();
    108d:	e8 cc 04 00 00       	call   155e <exit>
    1092:	66 90                	xchg   %ax,%ax
    1094:	66 90                	xchg   %ax,%ax
    1096:	66 90                	xchg   %ax,%ax
    1098:	66 90                	xchg   %ax,%ax
    109a:	66 90                	xchg   %ax,%ax
    109c:	66 90                	xchg   %ax,%ax
    109e:	66 90                	xchg   %ax,%ax

000010a0 <wc>:
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	57                   	push   %edi
    10a4:	56                   	push   %esi
    10a5:	53                   	push   %ebx
  l = w = c = 0;
    10a6:	31 db                	xor    %ebx,%ebx
{
    10a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
    10ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
    10b2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    10b9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
    10c0:	83 ec 04             	sub    $0x4,%esp
    10c3:	68 00 02 00 00       	push   $0x200
    10c8:	68 e0 1b 00 00       	push   $0x1be0
    10cd:	ff 75 08             	pushl  0x8(%ebp)
    10d0:	e8 a1 04 00 00       	call   1576 <read>
    10d5:	83 c4 10             	add    $0x10,%esp
    10d8:	83 f8 00             	cmp    $0x0,%eax
    10db:	89 c6                	mov    %eax,%esi
    10dd:	7e 61                	jle    1140 <wc+0xa0>
    for(i=0; i<n; i++){
    10df:	31 ff                	xor    %edi,%edi
    10e1:	eb 13                	jmp    10f6 <wc+0x56>
    10e3:	90                   	nop
    10e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        inword = 0;
    10e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
    10ef:	83 c7 01             	add    $0x1,%edi
    10f2:	39 fe                	cmp    %edi,%esi
    10f4:	74 42                	je     1138 <wc+0x98>
      if(buf[i] == '\n')
    10f6:	0f be 87 e0 1b 00 00 	movsbl 0x1be0(%edi),%eax
        l++;
    10fd:	31 c9                	xor    %ecx,%ecx
    10ff:	3c 0a                	cmp    $0xa,%al
    1101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
    1104:	83 ec 08             	sub    $0x8,%esp
    1107:	50                   	push   %eax
    1108:	68 a0 18 00 00       	push   $0x18a0
        l++;
    110d:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
    110f:	e8 3c 01 00 00       	call   1250 <strchr>
    1114:	83 c4 10             	add    $0x10,%esp
    1117:	85 c0                	test   %eax,%eax
    1119:	75 cd                	jne    10e8 <wc+0x48>
      else if(!inword){
    111b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    111e:	85 d2                	test   %edx,%edx
    1120:	75 cd                	jne    10ef <wc+0x4f>
    for(i=0; i<n; i++){
    1122:	83 c7 01             	add    $0x1,%edi
        w++;
    1125:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        inword = 1;
    1129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
    1130:	39 fe                	cmp    %edi,%esi
    1132:	75 c2                	jne    10f6 <wc+0x56>
    1134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1138:	01 75 e0             	add    %esi,-0x20(%ebp)
    113b:	eb 83                	jmp    10c0 <wc+0x20>
    113d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
    1140:	75 24                	jne    1166 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
    1142:	83 ec 08             	sub    $0x8,%esp
    1145:	ff 75 0c             	pushl  0xc(%ebp)
    1148:	ff 75 e0             	pushl  -0x20(%ebp)
    114b:	ff 75 dc             	pushl  -0x24(%ebp)
    114e:	53                   	push   %ebx
    114f:	68 b6 18 00 00       	push   $0x18b6
    1154:	6a 01                	push   $0x1
    1156:	e8 55 05 00 00       	call   16b0 <printf>
}
    115b:	83 c4 20             	add    $0x20,%esp
    115e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1161:	5b                   	pop    %ebx
    1162:	5e                   	pop    %esi
    1163:	5f                   	pop    %edi
    1164:	5d                   	pop    %ebp
    1165:	c3                   	ret    
    printf(1, "wc: read error\n");
    1166:	50                   	push   %eax
    1167:	50                   	push   %eax
    1168:	68 a6 18 00 00       	push   $0x18a6
    116d:	6a 01                	push   $0x1
    116f:	e8 3c 05 00 00       	call   16b0 <printf>
    exit();
    1174:	e8 e5 03 00 00       	call   155e <exit>
    1179:	66 90                	xchg   %ax,%ax
    117b:	66 90                	xchg   %ax,%ax
    117d:	66 90                	xchg   %ax,%ax
    117f:	90                   	nop

00001180 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	53                   	push   %ebx
    1184:	8b 45 08             	mov    0x8(%ebp),%eax
    1187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    118a:	89 c2                	mov    %eax,%edx
    118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1190:	83 c1 01             	add    $0x1,%ecx
    1193:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1197:	83 c2 01             	add    $0x1,%edx
    119a:	84 db                	test   %bl,%bl
    119c:	88 5a ff             	mov    %bl,-0x1(%edx)
    119f:	75 ef                	jne    1190 <strcpy+0x10>
    ;
  return os;
}
    11a1:	5b                   	pop    %ebx
    11a2:	5d                   	pop    %ebp
    11a3:	c3                   	ret    
    11a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000011b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	53                   	push   %ebx
    11b4:	8b 55 08             	mov    0x8(%ebp),%edx
    11b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    11ba:	0f b6 02             	movzbl (%edx),%eax
    11bd:	0f b6 19             	movzbl (%ecx),%ebx
    11c0:	84 c0                	test   %al,%al
    11c2:	75 1c                	jne    11e0 <strcmp+0x30>
    11c4:	eb 2a                	jmp    11f0 <strcmp+0x40>
    11c6:	8d 76 00             	lea    0x0(%esi),%esi
    11c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    11d0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    11d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    11d6:	83 c1 01             	add    $0x1,%ecx
    11d9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    11dc:	84 c0                	test   %al,%al
    11de:	74 10                	je     11f0 <strcmp+0x40>
    11e0:	38 d8                	cmp    %bl,%al
    11e2:	74 ec                	je     11d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    11e4:	29 d8                	sub    %ebx,%eax
}
    11e6:	5b                   	pop    %ebx
    11e7:	5d                   	pop    %ebp
    11e8:	c3                   	ret    
    11e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    11f2:	29 d8                	sub    %ebx,%eax
}
    11f4:	5b                   	pop    %ebx
    11f5:	5d                   	pop    %ebp
    11f6:	c3                   	ret    
    11f7:	89 f6                	mov    %esi,%esi
    11f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001200 <strlen>:

uint
strlen(const char *s)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1206:	80 39 00             	cmpb   $0x0,(%ecx)
    1209:	74 15                	je     1220 <strlen+0x20>
    120b:	31 d2                	xor    %edx,%edx
    120d:	8d 76 00             	lea    0x0(%esi),%esi
    1210:	83 c2 01             	add    $0x1,%edx
    1213:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1217:	89 d0                	mov    %edx,%eax
    1219:	75 f5                	jne    1210 <strlen+0x10>
    ;
  return n;
}
    121b:	5d                   	pop    %ebp
    121c:	c3                   	ret    
    121d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1220:	31 c0                	xor    %eax,%eax
}
    1222:	5d                   	pop    %ebp
    1223:	c3                   	ret    
    1224:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    122a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001230 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	57                   	push   %edi
    1234:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1237:	8b 4d 10             	mov    0x10(%ebp),%ecx
    123a:	8b 45 0c             	mov    0xc(%ebp),%eax
    123d:	89 d7                	mov    %edx,%edi
    123f:	fc                   	cld    
    1240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1242:	89 d0                	mov    %edx,%eax
    1244:	5f                   	pop    %edi
    1245:	5d                   	pop    %ebp
    1246:	c3                   	ret    
    1247:	89 f6                	mov    %esi,%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001250 <strchr>:

char*
strchr(const char *s, char c)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	53                   	push   %ebx
    1254:	8b 45 08             	mov    0x8(%ebp),%eax
    1257:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    125a:	0f b6 10             	movzbl (%eax),%edx
    125d:	84 d2                	test   %dl,%dl
    125f:	74 1d                	je     127e <strchr+0x2e>
    if(*s == c)
    1261:	38 d3                	cmp    %dl,%bl
    1263:	89 d9                	mov    %ebx,%ecx
    1265:	75 0d                	jne    1274 <strchr+0x24>
    1267:	eb 17                	jmp    1280 <strchr+0x30>
    1269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1270:	38 ca                	cmp    %cl,%dl
    1272:	74 0c                	je     1280 <strchr+0x30>
  for(; *s; s++)
    1274:	83 c0 01             	add    $0x1,%eax
    1277:	0f b6 10             	movzbl (%eax),%edx
    127a:	84 d2                	test   %dl,%dl
    127c:	75 f2                	jne    1270 <strchr+0x20>
      return (char*)s;
  return 0;
    127e:	31 c0                	xor    %eax,%eax
}
    1280:	5b                   	pop    %ebx
    1281:	5d                   	pop    %ebp
    1282:	c3                   	ret    
    1283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001290 <gets>:

char*
gets(char *buf, int max)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	57                   	push   %edi
    1294:	56                   	push   %esi
    1295:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1296:	31 f6                	xor    %esi,%esi
    1298:	89 f3                	mov    %esi,%ebx
{
    129a:	83 ec 1c             	sub    $0x1c,%esp
    129d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    12a0:	eb 2f                	jmp    12d1 <gets+0x41>
    12a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    12a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    12ab:	83 ec 04             	sub    $0x4,%esp
    12ae:	6a 01                	push   $0x1
    12b0:	50                   	push   %eax
    12b1:	6a 00                	push   $0x0
    12b3:	e8 be 02 00 00       	call   1576 <read>
    if(cc < 1)
    12b8:	83 c4 10             	add    $0x10,%esp
    12bb:	85 c0                	test   %eax,%eax
    12bd:	7e 1c                	jle    12db <gets+0x4b>
      break;
    buf[i++] = c;
    12bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    12c3:	83 c7 01             	add    $0x1,%edi
    12c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    12c9:	3c 0a                	cmp    $0xa,%al
    12cb:	74 23                	je     12f0 <gets+0x60>
    12cd:	3c 0d                	cmp    $0xd,%al
    12cf:	74 1f                	je     12f0 <gets+0x60>
  for(i=0; i+1 < max; ){
    12d1:	83 c3 01             	add    $0x1,%ebx
    12d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    12d7:	89 fe                	mov    %edi,%esi
    12d9:	7c cd                	jl     12a8 <gets+0x18>
    12db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    12dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    12e0:	c6 03 00             	movb   $0x0,(%ebx)
}
    12e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12e6:	5b                   	pop    %ebx
    12e7:	5e                   	pop    %esi
    12e8:	5f                   	pop    %edi
    12e9:	5d                   	pop    %ebp
    12ea:	c3                   	ret    
    12eb:	90                   	nop
    12ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12f0:	8b 75 08             	mov    0x8(%ebp),%esi
    12f3:	8b 45 08             	mov    0x8(%ebp),%eax
    12f6:	01 de                	add    %ebx,%esi
    12f8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    12fa:	c6 03 00             	movb   $0x0,(%ebx)
}
    12fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1300:	5b                   	pop    %ebx
    1301:	5e                   	pop    %esi
    1302:	5f                   	pop    %edi
    1303:	5d                   	pop    %ebp
    1304:	c3                   	ret    
    1305:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001310 <stat>:

int
stat(const char *n, struct stat *st)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	56                   	push   %esi
    1314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1315:	83 ec 08             	sub    $0x8,%esp
    1318:	6a 00                	push   $0x0
    131a:	ff 75 08             	pushl  0x8(%ebp)
    131d:	e8 7c 02 00 00       	call   159e <open>
  if(fd < 0)
    1322:	83 c4 10             	add    $0x10,%esp
    1325:	85 c0                	test   %eax,%eax
    1327:	78 27                	js     1350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1329:	83 ec 08             	sub    $0x8,%esp
    132c:	ff 75 0c             	pushl  0xc(%ebp)
    132f:	89 c3                	mov    %eax,%ebx
    1331:	50                   	push   %eax
    1332:	e8 7f 02 00 00       	call   15b6 <fstat>
  close(fd);
    1337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    133a:	89 c6                	mov    %eax,%esi
  close(fd);
    133c:	e8 45 02 00 00       	call   1586 <close>
  return r;
    1341:	83 c4 10             	add    $0x10,%esp
}
    1344:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1347:	89 f0                	mov    %esi,%eax
    1349:	5b                   	pop    %ebx
    134a:	5e                   	pop    %esi
    134b:	5d                   	pop    %ebp
    134c:	c3                   	ret    
    134d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1350:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1355:	eb ed                	jmp    1344 <stat+0x34>
    1357:	89 f6                	mov    %esi,%esi
    1359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001360 <atoi>:

int
atoi(const char *s)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	53                   	push   %ebx
    1364:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1367:	0f be 11             	movsbl (%ecx),%edx
    136a:	8d 42 d0             	lea    -0x30(%edx),%eax
    136d:	3c 09                	cmp    $0x9,%al
  n = 0;
    136f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1374:	77 1f                	ja     1395 <atoi+0x35>
    1376:	8d 76 00             	lea    0x0(%esi),%esi
    1379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1380:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1383:	83 c1 01             	add    $0x1,%ecx
    1386:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    138a:	0f be 11             	movsbl (%ecx),%edx
    138d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1390:	80 fb 09             	cmp    $0x9,%bl
    1393:	76 eb                	jbe    1380 <atoi+0x20>
  return n;
}
    1395:	5b                   	pop    %ebx
    1396:	5d                   	pop    %ebp
    1397:	c3                   	ret    
    1398:	90                   	nop
    1399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000013a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	56                   	push   %esi
    13a4:	53                   	push   %ebx
    13a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    13a8:	8b 45 08             	mov    0x8(%ebp),%eax
    13ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    13ae:	85 db                	test   %ebx,%ebx
    13b0:	7e 14                	jle    13c6 <memmove+0x26>
    13b2:	31 d2                	xor    %edx,%edx
    13b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    13b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    13bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    13bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    13c2:	39 d3                	cmp    %edx,%ebx
    13c4:	75 f2                	jne    13b8 <memmove+0x18>
  return vdst;
}
    13c6:	5b                   	pop    %ebx
    13c7:	5e                   	pop    %esi
    13c8:	5d                   	pop    %ebp
    13c9:	c3                   	ret    
    13ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000013d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    13d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    13d1:	a1 c0 1b 00 00       	mov    0x1bc0,%eax
{
    13d6:	89 e5                	mov    %esp,%ebp
    13d8:	57                   	push   %edi
    13d9:	56                   	push   %esi
    13da:	53                   	push   %ebx
    13db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    13de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    13e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    13e8:	39 c8                	cmp    %ecx,%eax
    13ea:	8b 10                	mov    (%eax),%edx
    13ec:	73 32                	jae    1420 <free+0x50>
    13ee:	39 d1                	cmp    %edx,%ecx
    13f0:	72 04                	jb     13f6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13f2:	39 d0                	cmp    %edx,%eax
    13f4:	72 32                	jb     1428 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    13f6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    13f9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    13fc:	39 fa                	cmp    %edi,%edx
    13fe:	74 30                	je     1430 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1400:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1403:	8b 50 04             	mov    0x4(%eax),%edx
    1406:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1409:	39 f1                	cmp    %esi,%ecx
    140b:	74 3a                	je     1447 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    140d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    140f:	a3 c0 1b 00 00       	mov    %eax,0x1bc0
}
    1414:	5b                   	pop    %ebx
    1415:	5e                   	pop    %esi
    1416:	5f                   	pop    %edi
    1417:	5d                   	pop    %ebp
    1418:	c3                   	ret    
    1419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1420:	39 d0                	cmp    %edx,%eax
    1422:	72 04                	jb     1428 <free+0x58>
    1424:	39 d1                	cmp    %edx,%ecx
    1426:	72 ce                	jb     13f6 <free+0x26>
{
    1428:	89 d0                	mov    %edx,%eax
    142a:	eb bc                	jmp    13e8 <free+0x18>
    142c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1430:	03 72 04             	add    0x4(%edx),%esi
    1433:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1436:	8b 10                	mov    (%eax),%edx
    1438:	8b 12                	mov    (%edx),%edx
    143a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    143d:	8b 50 04             	mov    0x4(%eax),%edx
    1440:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1443:	39 f1                	cmp    %esi,%ecx
    1445:	75 c6                	jne    140d <free+0x3d>
    p->s.size += bp->s.size;
    1447:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    144a:	a3 c0 1b 00 00       	mov    %eax,0x1bc0
    p->s.size += bp->s.size;
    144f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1452:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1455:	89 10                	mov    %edx,(%eax)
}
    1457:	5b                   	pop    %ebx
    1458:	5e                   	pop    %esi
    1459:	5f                   	pop    %edi
    145a:	5d                   	pop    %ebp
    145b:	c3                   	ret    
    145c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001460 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	57                   	push   %edi
    1464:	56                   	push   %esi
    1465:	53                   	push   %ebx
    1466:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1469:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    146c:	8b 15 c0 1b 00 00    	mov    0x1bc0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1472:	8d 78 07             	lea    0x7(%eax),%edi
    1475:	c1 ef 03             	shr    $0x3,%edi
    1478:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    147b:	85 d2                	test   %edx,%edx
    147d:	0f 84 9d 00 00 00    	je     1520 <malloc+0xc0>
    1483:	8b 02                	mov    (%edx),%eax
    1485:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1488:	39 cf                	cmp    %ecx,%edi
    148a:	76 6c                	jbe    14f8 <malloc+0x98>
    148c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1492:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1497:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    149a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    14a1:	eb 0e                	jmp    14b1 <malloc+0x51>
    14a3:	90                   	nop
    14a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    14a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    14aa:	8b 48 04             	mov    0x4(%eax),%ecx
    14ad:	39 f9                	cmp    %edi,%ecx
    14af:	73 47                	jae    14f8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    14b1:	39 05 c0 1b 00 00    	cmp    %eax,0x1bc0
    14b7:	89 c2                	mov    %eax,%edx
    14b9:	75 ed                	jne    14a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    14bb:	83 ec 0c             	sub    $0xc,%esp
    14be:	56                   	push   %esi
    14bf:	e8 22 01 00 00       	call   15e6 <sbrk>
  if(p == (char*)-1)
    14c4:	83 c4 10             	add    $0x10,%esp
    14c7:	83 f8 ff             	cmp    $0xffffffff,%eax
    14ca:	74 1c                	je     14e8 <malloc+0x88>
  hp->s.size = nu;
    14cc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    14cf:	83 ec 0c             	sub    $0xc,%esp
    14d2:	83 c0 08             	add    $0x8,%eax
    14d5:	50                   	push   %eax
    14d6:	e8 f5 fe ff ff       	call   13d0 <free>
  return freep;
    14db:	8b 15 c0 1b 00 00    	mov    0x1bc0,%edx
      if((p = morecore(nunits)) == 0)
    14e1:	83 c4 10             	add    $0x10,%esp
    14e4:	85 d2                	test   %edx,%edx
    14e6:	75 c0                	jne    14a8 <malloc+0x48>
        return 0;
  }
}
    14e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    14eb:	31 c0                	xor    %eax,%eax
}
    14ed:	5b                   	pop    %ebx
    14ee:	5e                   	pop    %esi
    14ef:	5f                   	pop    %edi
    14f0:	5d                   	pop    %ebp
    14f1:	c3                   	ret    
    14f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    14f8:	39 cf                	cmp    %ecx,%edi
    14fa:	74 54                	je     1550 <malloc+0xf0>
        p->s.size -= nunits;
    14fc:	29 f9                	sub    %edi,%ecx
    14fe:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1501:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1504:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1507:	89 15 c0 1b 00 00    	mov    %edx,0x1bc0
}
    150d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1510:	83 c0 08             	add    $0x8,%eax
}
    1513:	5b                   	pop    %ebx
    1514:	5e                   	pop    %esi
    1515:	5f                   	pop    %edi
    1516:	5d                   	pop    %ebp
    1517:	c3                   	ret    
    1518:	90                   	nop
    1519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1520:	c7 05 c0 1b 00 00 c4 	movl   $0x1bc4,0x1bc0
    1527:	1b 00 00 
    152a:	c7 05 c4 1b 00 00 c4 	movl   $0x1bc4,0x1bc4
    1531:	1b 00 00 
    base.s.size = 0;
    1534:	b8 c4 1b 00 00       	mov    $0x1bc4,%eax
    1539:	c7 05 c8 1b 00 00 00 	movl   $0x0,0x1bc8
    1540:	00 00 00 
    1543:	e9 44 ff ff ff       	jmp    148c <malloc+0x2c>
    1548:	90                   	nop
    1549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1550:	8b 08                	mov    (%eax),%ecx
    1552:	89 0a                	mov    %ecx,(%edx)
    1554:	eb b1                	jmp    1507 <malloc+0xa7>

00001556 <fork>:
    1556:	b8 01 00 00 00       	mov    $0x1,%eax
    155b:	cd 40                	int    $0x40
    155d:	c3                   	ret    

0000155e <exit>:
    155e:	b8 02 00 00 00       	mov    $0x2,%eax
    1563:	cd 40                	int    $0x40
    1565:	c3                   	ret    

00001566 <wait>:
    1566:	b8 03 00 00 00       	mov    $0x3,%eax
    156b:	cd 40                	int    $0x40
    156d:	c3                   	ret    

0000156e <pipe>:
    156e:	b8 04 00 00 00       	mov    $0x4,%eax
    1573:	cd 40                	int    $0x40
    1575:	c3                   	ret    

00001576 <read>:
    1576:	b8 05 00 00 00       	mov    $0x5,%eax
    157b:	cd 40                	int    $0x40
    157d:	c3                   	ret    

0000157e <write>:
    157e:	b8 10 00 00 00       	mov    $0x10,%eax
    1583:	cd 40                	int    $0x40
    1585:	c3                   	ret    

00001586 <close>:
    1586:	b8 15 00 00 00       	mov    $0x15,%eax
    158b:	cd 40                	int    $0x40
    158d:	c3                   	ret    

0000158e <kill>:
    158e:	b8 06 00 00 00       	mov    $0x6,%eax
    1593:	cd 40                	int    $0x40
    1595:	c3                   	ret    

00001596 <exec>:
    1596:	b8 07 00 00 00       	mov    $0x7,%eax
    159b:	cd 40                	int    $0x40
    159d:	c3                   	ret    

0000159e <open>:
    159e:	b8 0f 00 00 00       	mov    $0xf,%eax
    15a3:	cd 40                	int    $0x40
    15a5:	c3                   	ret    

000015a6 <mknod>:
    15a6:	b8 11 00 00 00       	mov    $0x11,%eax
    15ab:	cd 40                	int    $0x40
    15ad:	c3                   	ret    

000015ae <unlink>:
    15ae:	b8 12 00 00 00       	mov    $0x12,%eax
    15b3:	cd 40                	int    $0x40
    15b5:	c3                   	ret    

000015b6 <fstat>:
    15b6:	b8 08 00 00 00       	mov    $0x8,%eax
    15bb:	cd 40                	int    $0x40
    15bd:	c3                   	ret    

000015be <link>:
    15be:	b8 13 00 00 00       	mov    $0x13,%eax
    15c3:	cd 40                	int    $0x40
    15c5:	c3                   	ret    

000015c6 <mkdir>:
    15c6:	b8 14 00 00 00       	mov    $0x14,%eax
    15cb:	cd 40                	int    $0x40
    15cd:	c3                   	ret    

000015ce <chdir>:
    15ce:	b8 09 00 00 00       	mov    $0x9,%eax
    15d3:	cd 40                	int    $0x40
    15d5:	c3                   	ret    

000015d6 <dup>:
    15d6:	b8 0a 00 00 00       	mov    $0xa,%eax
    15db:	cd 40                	int    $0x40
    15dd:	c3                   	ret    

000015de <getpid>:
    15de:	b8 0b 00 00 00       	mov    $0xb,%eax
    15e3:	cd 40                	int    $0x40
    15e5:	c3                   	ret    

000015e6 <sbrk>:
    15e6:	b8 0c 00 00 00       	mov    $0xc,%eax
    15eb:	cd 40                	int    $0x40
    15ed:	c3                   	ret    

000015ee <sleep>:
    15ee:	b8 0d 00 00 00       	mov    $0xd,%eax
    15f3:	cd 40                	int    $0x40
    15f5:	c3                   	ret    

000015f6 <uptime>:
    15f6:	b8 0e 00 00 00       	mov    $0xe,%eax
    15fb:	cd 40                	int    $0x40
    15fd:	c3                   	ret    

000015fe <settickets>:
    15fe:	b8 16 00 00 00       	mov    $0x16,%eax
    1603:	cd 40                	int    $0x40
    1605:	c3                   	ret    

00001606 <getpinfo>:
    1606:	b8 17 00 00 00       	mov    $0x17,%eax
    160b:	cd 40                	int    $0x40
    160d:	c3                   	ret    
    160e:	66 90                	xchg   %ax,%ax

00001610 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1610:	55                   	push   %ebp
    1611:	89 e5                	mov    %esp,%ebp
    1613:	57                   	push   %edi
    1614:	56                   	push   %esi
    1615:	53                   	push   %ebx
    1616:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1619:	85 d2                	test   %edx,%edx
{
    161b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    161e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1620:	79 76                	jns    1698 <printint+0x88>
    1622:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1626:	74 70                	je     1698 <printint+0x88>
    x = -xx;
    1628:	f7 d8                	neg    %eax
    neg = 1;
    162a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1631:	31 f6                	xor    %esi,%esi
    1633:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1636:	eb 0a                	jmp    1642 <printint+0x32>
    1638:	90                   	nop
    1639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1640:	89 fe                	mov    %edi,%esi
    1642:	31 d2                	xor    %edx,%edx
    1644:	8d 7e 01             	lea    0x1(%esi),%edi
    1647:	f7 f1                	div    %ecx
    1649:	0f b6 92 e0 18 00 00 	movzbl 0x18e0(%edx),%edx
  }while((x /= base) != 0);
    1650:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1652:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1655:	75 e9                	jne    1640 <printint+0x30>
  if(neg)
    1657:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    165a:	85 c0                	test   %eax,%eax
    165c:	74 08                	je     1666 <printint+0x56>
    buf[i++] = '-';
    165e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1663:	8d 7e 02             	lea    0x2(%esi),%edi
    1666:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    166a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    166d:	8d 76 00             	lea    0x0(%esi),%esi
    1670:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1673:	83 ec 04             	sub    $0x4,%esp
    1676:	83 ee 01             	sub    $0x1,%esi
    1679:	6a 01                	push   $0x1
    167b:	53                   	push   %ebx
    167c:	57                   	push   %edi
    167d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1680:	e8 f9 fe ff ff       	call   157e <write>

  while(--i >= 0)
    1685:	83 c4 10             	add    $0x10,%esp
    1688:	39 de                	cmp    %ebx,%esi
    168a:	75 e4                	jne    1670 <printint+0x60>
    putc(fd, buf[i]);
}
    168c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    168f:	5b                   	pop    %ebx
    1690:	5e                   	pop    %esi
    1691:	5f                   	pop    %edi
    1692:	5d                   	pop    %ebp
    1693:	c3                   	ret    
    1694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1698:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    169f:	eb 90                	jmp    1631 <printint+0x21>
    16a1:	eb 0d                	jmp    16b0 <printf>
    16a3:	90                   	nop
    16a4:	90                   	nop
    16a5:	90                   	nop
    16a6:	90                   	nop
    16a7:	90                   	nop
    16a8:	90                   	nop
    16a9:	90                   	nop
    16aa:	90                   	nop
    16ab:	90                   	nop
    16ac:	90                   	nop
    16ad:	90                   	nop
    16ae:	90                   	nop
    16af:	90                   	nop

000016b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    16b0:	55                   	push   %ebp
    16b1:	89 e5                	mov    %esp,%ebp
    16b3:	57                   	push   %edi
    16b4:	56                   	push   %esi
    16b5:	53                   	push   %ebx
    16b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    16b9:	8b 75 0c             	mov    0xc(%ebp),%esi
    16bc:	0f b6 1e             	movzbl (%esi),%ebx
    16bf:	84 db                	test   %bl,%bl
    16c1:	0f 84 bf 00 00 00    	je     1786 <printf+0xd6>
    16c7:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    16ca:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    16cd:	31 d2                	xor    %edx,%edx
    16cf:	eb 39                	jmp    170a <printf+0x5a>
    16d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    16d8:	83 f8 25             	cmp    $0x25,%eax
    16db:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    16de:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    16e3:	74 1a                	je     16ff <printf+0x4f>
  write(fd, &c, 1);
    16e5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    16e8:	83 ec 04             	sub    $0x4,%esp
    16eb:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    16ee:	6a 01                	push   $0x1
    16f0:	50                   	push   %eax
    16f1:	ff 75 08             	pushl  0x8(%ebp)
    16f4:	e8 85 fe ff ff       	call   157e <write>
    16f9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    16fc:	83 c4 10             	add    $0x10,%esp
    16ff:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1702:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1706:	84 db                	test   %bl,%bl
    1708:	74 7c                	je     1786 <printf+0xd6>
    if(state == 0){
    170a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    170c:	0f be cb             	movsbl %bl,%ecx
    170f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1712:	74 c4                	je     16d8 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1714:	83 fa 25             	cmp    $0x25,%edx
    1717:	75 e6                	jne    16ff <printf+0x4f>
      if(c == 'd'){
    1719:	83 f8 64             	cmp    $0x64,%eax
    171c:	0f 84 a6 00 00 00    	je     17c8 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1722:	83 f8 6c             	cmp    $0x6c,%eax
    1725:	0f 84 ad 00 00 00    	je     17d8 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    172b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1731:	83 f9 70             	cmp    $0x70,%ecx
    1734:	74 5a                	je     1790 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1736:	83 f8 73             	cmp    $0x73,%eax
    1739:	0f 84 e1 00 00 00    	je     1820 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    173f:	83 f8 63             	cmp    $0x63,%eax
    1742:	0f 84 28 01 00 00    	je     1870 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1748:	83 f8 25             	cmp    $0x25,%eax
    174b:	74 6b                	je     17b8 <printf+0x108>
  write(fd, &c, 1);
    174d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1750:	83 ec 04             	sub    $0x4,%esp
    1753:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1757:	6a 01                	push   $0x1
    1759:	50                   	push   %eax
    175a:	ff 75 08             	pushl  0x8(%ebp)
    175d:	e8 1c fe ff ff       	call   157e <write>
    1762:	83 c4 0c             	add    $0xc,%esp
    1765:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1768:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    176b:	6a 01                	push   $0x1
    176d:	50                   	push   %eax
    176e:	ff 75 08             	pushl  0x8(%ebp)
    1771:	83 c6 01             	add    $0x1,%esi
    1774:	e8 05 fe ff ff       	call   157e <write>
  for(i = 0; fmt[i]; i++){
    1779:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    177d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1780:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1782:	84 db                	test   %bl,%bl
    1784:	75 84                	jne    170a <printf+0x5a>
    }
  }
}
    1786:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1789:	5b                   	pop    %ebx
    178a:	5e                   	pop    %esi
    178b:	5f                   	pop    %edi
    178c:	5d                   	pop    %ebp
    178d:	c3                   	ret    
    178e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1790:	83 ec 0c             	sub    $0xc,%esp
    1793:	b9 10 00 00 00       	mov    $0x10,%ecx
    1798:	6a 00                	push   $0x0
    179a:	8b 17                	mov    (%edi),%edx
    179c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    179f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    17a2:	e8 69 fe ff ff       	call   1610 <printint>
    17a7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17aa:	31 d2                	xor    %edx,%edx
    17ac:	e9 4e ff ff ff       	jmp    16ff <printf+0x4f>
    17b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    17b8:	83 ec 04             	sub    $0x4,%esp
    17bb:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    17be:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    17c1:	6a 01                	push   $0x1
    17c3:	eb a8                	jmp    176d <printf+0xbd>
    17c5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    17c8:	83 ec 0c             	sub    $0xc,%esp
    17cb:	b9 0a 00 00 00       	mov    $0xa,%ecx
    17d0:	6a 01                	push   $0x1
    17d2:	eb c6                	jmp    179a <printf+0xea>
    17d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    17d8:	8b 57 04             	mov    0x4(%edi),%edx
    17db:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    17dd:	85 d2                	test   %edx,%edx
    17df:	74 15                	je     17f6 <printf+0x146>
    17e1:	83 ec 0c             	sub    $0xc,%esp
    17e4:	8b 45 08             	mov    0x8(%ebp),%eax
    17e7:	b9 10 00 00 00       	mov    $0x10,%ecx
    17ec:	6a 00                	push   $0x0
    17ee:	e8 1d fe ff ff       	call   1610 <printint>
    17f3:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    17f6:	83 ec 0c             	sub    $0xc,%esp
    17f9:	8b 45 08             	mov    0x8(%ebp),%eax
    17fc:	89 da                	mov    %ebx,%edx
    17fe:	6a 00                	push   $0x0
    1800:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1805:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1808:	e8 03 fe ff ff       	call   1610 <printint>
    180d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1810:	31 d2                	xor    %edx,%edx
    1812:	e9 e8 fe ff ff       	jmp    16ff <printf+0x4f>
    1817:	89 f6                	mov    %esi,%esi
    1819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1820:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1822:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1825:	85 c9                	test   %ecx,%ecx
    1827:	74 6a                	je     1893 <printf+0x1e3>
        while(*s != 0){
    1829:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    182c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    182e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1830:	84 c0                	test   %al,%al
    1832:	0f 84 c7 fe ff ff    	je     16ff <printf+0x4f>
    1838:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    183b:	89 de                	mov    %ebx,%esi
    183d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1840:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1843:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1846:	83 ec 04             	sub    $0x4,%esp
    1849:	6a 01                	push   $0x1
          s++;
    184b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    184e:	50                   	push   %eax
    184f:	53                   	push   %ebx
    1850:	e8 29 fd ff ff       	call   157e <write>
        while(*s != 0){
    1855:	0f b6 06             	movzbl (%esi),%eax
    1858:	83 c4 10             	add    $0x10,%esp
    185b:	84 c0                	test   %al,%al
    185d:	75 e1                	jne    1840 <printf+0x190>
    185f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1862:	31 d2                	xor    %edx,%edx
    1864:	e9 96 fe ff ff       	jmp    16ff <printf+0x4f>
    1869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1870:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1872:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1875:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1878:	6a 01                	push   $0x1
        putc(fd, *ap);
    187a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    187d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1880:	50                   	push   %eax
    1881:	ff 75 08             	pushl  0x8(%ebp)
    1884:	e8 f5 fc ff ff       	call   157e <write>
    1889:	83 c4 10             	add    $0x10,%esp
      state = 0;
    188c:	31 d2                	xor    %edx,%edx
    188e:	e9 6c fe ff ff       	jmp    16ff <printf+0x4f>
          s = "(null)";
    1893:	bb d7 18 00 00       	mov    $0x18d7,%ebx
        while(*s != 0){
    1898:	b8 28 00 00 00       	mov    $0x28,%eax
    189d:	eb 99                	jmp    1838 <printf+0x188>
