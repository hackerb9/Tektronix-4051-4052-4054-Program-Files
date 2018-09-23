100 REM DRAW PROGRAM from fast graphics HEX data
110 REM "z" WILL BE THE END OF FILE MARKER
111 REM
113 REM FIRST CHAR. HAS MOVE FLAG, 3 BIT HI X, 3 BIT HI Y
114 REM SECOND CHAR. HAS 7 BIT LO X, THIRD HAS 7 BIT LO Y
115 PAGE
116 V=1
120 READ G$
130 C$=SEG(G$,1,1)
140 IF C$<>"z" THEN 170
150 HOME
160 END
170 F1=LEN(G$)/6
180 FOR I=0 TO F1-1
190 H$=SEG(G$,I*6+1,6)
3210 P=1
3220 X$=SEG(H$,P,2)
3225 GOSUB 3390
3226 A$=Y$
3230 X$=SEG(H$,P+2,2)
3233 GOSUB 3390
3235 B$=Y$
3240 X$=SEG(H$,P+4,2)
3242 GOSUB 3390
3243 C$=Y$
3250 A=ASC(A$)
3260 IF A=>64 THEN 3290
3270 M=20
3280 GO TO 3310
3290 M=21
3295 V=V+1
3300 A=A-64
3310 X=INT(A/8)*128
3320 Y=INT(A-X/16)*128+ASC(C$)
3330 X=X+ASC(B$)
3331 IF M<>21 THEN 3340
3340 PRINT @32,M:X*130/1023,Y*100/800
3350 P=P+6
3360 IF P<=LEN(X$)-2 THEN 3220
3350 NEXT I
3360 GOTO 120
3390 REM SUBROUTINE TO CONVERT X1$ TWO CHARACTER HEX TO ONE CHAR X2$
3400 Q$=SEG(X$,1,1)
3410 Q1=ASC(Q$)-48
3412 IF Q1<10 THEN 3420
3414 Q1=Q1-7
3420 Q$=SEG(X$,2,1)
3422 Q2=ASC(Q$)-48
3424 IF Q2<10 THEN 3430
3426 Q2=Q2-7
3430 Q1=Q1*16+Q2
3440 Y$=CHR(Q1)
3450 RETURN
8000 DATA "41006F01006F01001541006F01056F01051541056F010B6E010B14410B6E"
8001 DATA "01116D01111341116D01176C01171241176C011D6C011D12411D6C01236B"
8002 DATA "01231141236B01296A01291041296A012F6A012F0F412F6A01356901350F"
8003 DATA "413569013B68013B0E413B6801406701400D41406701466601460D414666"
8004 DATA "014C66014C0C414C6601526501520B41526501586401580A415864015E64"
8005 DATA "015E09415E64016463016409416463016A62016A08416A62017061017007"
8006 DATA "417061017660017606417660017B60017B06417B6009015F09010549015F"
8007 DATA "09075E09070449075E090D5D090D03490D5D09135D09130349135D09195C"
8008 DATA "09190249195C091F5B091F01491F5B09255B09250149255B092B5A092B00"
8009 DATA "492B5A09315908317F49315909365808367E493658093C57083C7E493C57"
8010 DATA "09425708427D49425709485608487C494856094E55084E7B494E55095454"
8011 DATA "08547A495454095A54085A7A495A54096053086079496053096652086678"
8012 DATA "496652096C51086C77496C51097151087177497151097750087776497750"
8013 DATA "097D4F087D75497D4F11034E10037551034E11094E10097451094E110F4D"
8014 DATA "100F73510F4D11154C10157251154C111B4C101B72511B4C11214B102171"
8015 DATA "51214B11274A10277051274A112C49102C6F512C4911324810326E513248"
8016 DATA "11384810386E513848113E47103E6D513E4711444610446C514446114A45"
8017 DATA "104A6B514A4511504510506B51504511564410566A515644115C43105C69"
8018 DATA "515C43116243106268516243116842106868516842116D41106D67516D41"
8019 DATA "11734010736651734011793F10796651793F117F3F107F65517F3F19053E"
8020 DATA "18056459053E190B3D180B63590B3D19113D18116259113D19173C181762"
8021 DATA "59173C191D3B181D61591D3B19233A18236059233A19283918285F592839"
8022 DATA "192E39182E5F592E3919343818345E593438193A37183A5D593A37194036"
8023 DATA "18405C59403619463618465C594636194C35184C5B594C35410574010574"
8024 DATA "19513918515D410B78010B7819573D18566141107C01107C195C42185C66"
8025 DATA "42160002160019624618616A421B04021B0419674A18676E422109022109"
8026 DATA "196D4E186D7242260D02260D197252187276422C11022C1119785718787B"
8027 DATA "423115023115197D5B187D7F42371902371921035F210303423C1E023C1E"
8028 DATA "210863210807424222024222210E67210E0B42472602472621136C211310"
8029 DATA "424D2A024D2A21197021191442522E02522E211E74211E18425833025833"
8030 DATA "21247821241C425D37025D3721297C21292042633B02633B222F01212F25"
8031 DATA "42683F02683F223505213429426E43026E43223A09213A2D427348027348"
8032 DATA "22400D213F3142794C02794C224511214535427E50027E500A0E4E0A1D4C"
8033 DATA "0A2C4A0A3C480A4B460A5A440A6A420A794112083F12183D12273B123639"
8034 DATA "1246371255361264341274311A032F1A122D1A222C1A31291A40271A5025"
8035 DATA "1A5F231A6E211A7E1F220D1D221D1B222C1A223B18224B16214A3A4A0454"
8036 DATA "0A04540A13520A22500A324E0A414D0A504B0A60490A6F470A7E45120E43"
8037 DATA "121D41122C40123C3E124B3B125B3A126A371279371A09351A18331A2730"
8038 DATA "1A372E1A462C1A55291A65271A742622032422132222222022311E22411C"
8039 DATA "22501A21503E4A09580A09580A19570A28550A37530A47510A564F0A654D"
8040 DATA "0A754B120449121347122345123244124143125140126040126F3B127F3D"
8041 DATA "1A0E371A1D381A2D341A3C321A4B301A5B2E1A6A2C1A792A220928221826"
8042 DATA "22282422372222462022561E2155424A0F5D0A0F5D0A1E5B0A2D590A3D57"
8043 DATA "0A4C550A5B530A6B510A7A4F12094D12194C12284B123849124746125646"
8044 DATA "1266451275421A04421A143E1A233C1A323A1A42381A51341A60331A7030"
8045 DATA "1A7F2E220E2C221E2A222D28223C26224C24225B22215B464A14610A1461"
8046 DATA "0A245F0A335D0A425B0A52590A61570A7055120053120F52121E51122E4E"
8047 DATA "123D4D124C4C125C4C126B46127A441A0A451A19431A28411A383E1A473B"
8048 DATA "1A56391A66371A753522053222143022232E22332C22422A225128226126"
8049 DATA "21604A4A1A650A1A650A29630A38610A485F0A575D0A665B0A765A120558"
8050 DATA "12145612245412335412435312525112614F12714B1A004A1A0F4A1A1F4A"
8051 DATA "1A2E441A3D401A4D3F1A5C3E1A6B3C1A7B38220A37221934222932223830"
8052 DATA "22472F22572D22662B21664F4A1F690A1F690A2F670A3E650A4D630A5D62"
8053 DATA "0A6C600A7B5E120B5C121A5A12295A123958124856125757126752127652"
8054 DATA "1A054F1A154A1A24501A334E1A434B1A52441A61431A713F22003D22103B"
8055 DATA "221F39222E37223E35224D33225C31226C2F216B534A256D0A256D0A346C"
8056 DATA "0A436A0A53680A62660A716412016212106012205E122F5E123E5D124E5D"
8057 DATA "125D5C126C57127C561A0B511A1A571A2A501A39551A484A1A58491A6746"
8058 DATA "1A764622064222153F22243D22343B224339225237226235227133217157"
8059 DATA "4A2A720A2A720A3A700A496E0A586C0A686A0A7768120667121664122564"
8060 DATA "12346012446112536212626112725F1A01591A10621A205A1A2F571A3E58"
8061 DATA "1A4E541A5D4E1A6D4D1A7C48220B45221B44222A4122393F22493D22583B"
8062 DATA "22673922773721765B4A30760A30760A3F740A4E720A5E700A6D6E0A7C6C"
8063 DATA "120C6B121B69122B69123A6912496A1259691268681277681A07621A165E"
8064 DATA "1A255C1A35591A44621A53551A63571A725222014B22114C222047222F46"
8065 DATA "223F43224E41225D3F226D3D227C3B217C5F4A357A0A357A0A45780A5476"
8066 DATA "0A63740A737212027012116F12216E12306B123F6A124F6D125E72126D70"
8067 DATA "127D701A0C681A1B661A2B631A3A5D1A495F1A595D1A685A1A7852220752"
8068 DATA "22164E22264C22354A2244482254452263442272422A02402901644A3B7E"
8069 DATA "0A3B7E0A4A7C0A597A0A69780A7877120875121773122672123671124573"
8070 DATA "1254701264771273771A02671A127C1A21661A30751A40711A4F5E1A5E62"
8071 DATA "1A6E631A7D5B220C58221C55222B50223A4E224A4C22594A226848227846"
8072 DATA "2A07442907684B40020B40020B50010A5F7F0A6E7D0A7E7B120D79121C78"
8073 DATA "122C76123B77124A76125A7512697D1378001A08781A176B1A267D1A3669"
8074 DATA "1A45701A55661A64611A7362220362221259222157223155224052224F50"
8075 DATA "225F4E226E4C227D4A2A0D48290C6C4B46070B46070B55050B64030B7401"
8076 DATA "12037F12137D12227B12317B124178125079125F76126F78127E7F1B0D04"
8077 DATA "1A1D781B2C001B3B071A4B671A5A7F1A69741A796A22086722176322275B"
8078 DATA "22365A2245562255542264522273502A034E2A124C2912704B4B0B0B4B0B"
8079 DATA "0B5B090B6A070B790513090313180212277F12377F13460112557B12657E"
8080 DATA "12747B1B030A1B130D1B22061B31101B41131A50731B60071A6F691A7E6A"
8081 DATA "220E67221D60222C60223C5E224B5B225A58226A562279542A08522A1850"
8082 DATA "2917744B510F0B510F0B600D0B700B0B7F09130E07131E06132D03133C04"
8083 DATA "134C03135B04136A09137A071B09131B18181A287D1B37041A46731A5673"
8084 DATA "1B65021A747522047D22136A22226B22326522416222505F22605D226F5A"
8085 DATA "227E592A0E572A1D55291D794B56130B56130B66110B750F13040D13140C"
8086 DATA "13230A13320913420613510913600813700A137F021A0E7F1B1E011B2D18"
8087 DATA "1B3D161B4C0E1B5B101A6B761A7A7F22097922197922287222376A224765"
8088 DATA "22566322656122755F2A045D2A135B2A235929227D4B5C170B5C170B6B16"
8089 DATA "0B7B14130A1213191013290E13380D13470D1357081366061375051B051C"
8090 DATA "1B141B1B23031B33271B422A1B51211B61091B70191B7F0A230F04221E7A"
8091 DATA "222D74223D6F224C6B225B67226B65227A632A09612A195F2A285D2A2801"
8092 DATA "4B611C0B611C0B711A130018130F16131F14132E12133D11134D11135C11"
8093 DATA "136B0E137B161B0A091B190B1B29211B382B1B48321B57031B662A1B760D"
8094 DATA "22057E23140122247E22337B22426F22527022616C2270692A00672A0F65"
8095 DATA "2A1E632A2E612A2D054B67200B67200B761E13061C13151A132418133417"
8096 DATA "1343161352121362111371121B00111B10101B1F1A1B2E301B3E2B1B4D33"
8097 DATA "1B5C101B6C121B7B19230A10221A7D22297C22387D22487722577422666F"
8098 DATA "22766E2A056B2A15692A24672A33652A33094B6C240B6C240B7C22130B20"
8099 DATA "131A1E132A1C13391B13481A13581B13671813761F1B06201B15111B2515"
8100 DATA "1B34111B43261B533C1B62191B7124230102231002231F0E232F0A223E7D"
8101 DATA "224D7C225D77226C75227B722A0B702A1A6E2A296C2A396A2A380E4B7228"
8102 DATA "0B7228130126131124132022132F21133F1F134E1D135D1B136D1C137C17"
8103 DATA "1B0B251B1B1E1B2A1D1B39321B491A1B58191B67131B771C23061C231512"
8104 DATA "23250723340623430822537D22627A2271792A01762A10742A20722A2F70"
8105 DATA "2A3E6E2A3E124B772C0B772C13072B131629132527133525134423135322"
8106 DATA "13631F1372241B01261B11241B201E1B301A1B3F2D1B4E261B5E191B6D3A"
8107 DATA "1B7C0F230C2E231B1D232A18233A0823490A23580623680122777D2A067A"
8108 DATA "2A16782A25762A34742A44722A43164B7D310B7D31130C2F131C2D132B2B"
8109 DATA "133A29134A271359261368251378221B072A1B16301B26231B35321B4425"
8110 DATA "1B54411B633A1B721523022A23112023201623300B233F0F234E08235E0A"
8111 DATA "236D05237D012A0C7E2A1B7C2A2B7A2A3A782A49762A491A530235130235"
8112 DATA "13123313213113302F13402D134F2B135E2A136E29137D2A1B0D251B1C29"
8113 DATA "1B2B2F1B3B3C1B4A2A1B59241B693A1B782623072823173123261B23351F"
8114 DATA "23451A23540C23630A2373062B02042B11032B21002A307E2A3F7C2A4F7A"
8115 DATA "2A4E1E53083913083913173713273513363313453113553013642E13732D"
8116 DATA "1B032C1B12301B21271B312A1B40301B4F421B5F391B6E2F1B7D36230D32"
8117 DATA "231C1A232B19233B27234A1223591223690E23780B2B08092B17062B2605"
8118 DATA "2B36032B45012A547F2A5423530D3D130D3D131D3B132C39133B37134B36"
8119 DATA "135A341369321379331B082E1B18331B27351B36321B462E1B55321B6434"
8120 DATA "1B742C230334231233232222233124234027235020235F13236E12237E11"
8121 DATA "2B0D0D2B1C0B2B2C092B3B072B4A052B5A032A5927531341131341132240"
8122 DATA "13323E13413C13503A136038136F37137E341B0E331B1D391B2C391B3C30"
8123 DATA "1B4B431B5A2E1B6A391B793423083D23182A232734233630234628235524"
8124 DATA "2365182374162B03142B13112B220F2B310D2B410B2B50092B5F072A5F2B"
8125 DATA "53184613184613284413374213464013563E13653C13753B1B043A1B1337"
8126 DATA "1B233A1B32381B413B1B51381B603B1B6F301B7F36230E3D231D35232D38"
8127 DATA "233C25234B2D235B1E236A1D23791B2B09182B18152B27132B37112B460F"
8128 DATA "2B550D2B650B2A642F531E4A131E4A132D48133D46134C44135B42136B40"
8129 DATA "137A3E1B093D1B193E1B283D1B373D1B473E1B56381B65471B753623042E"
8130 DATA "23133823233923323A23413023512A236021237023237F212B0E1D2B1E19"
8131 DATA "2B2D172B3C152B4C132B5B112B6A0F2A6A3353234E13234E13334C13424A"
8132 DATA "1351481361461370451B00431B0F421B1E3F1B2E3D1B3D3F1B4C391B5C40"
8133 DATA "1B6B3D1B7A35230A3423194023283D23383623472F23562823662A237527"
8134 DATA "2B04242B14202B231E2B321C2B42192B51182B60162B70142A6F38532952"
8135 DATA "13295213385013484E13574C13664B1376491B05471B14461B24441B3342"
8136 DATA "1B42411B52441B61421B704823003A230F3E231E3A232E3E233D33234D3A"
8137 DATA "235C35236B2D237B282B0A262B19242B29222B38202B471E2B571C2B661A"
8138 DATA "2B75182A753C532E56132E56133E55134D53135D51136C4F137B4D1B0B4B"
8139 DATA "1B1A4A1B29491B39461B48481B57441B67491B764123054723153C23243C"
8140 DATA "2333412343382352332361372371332B002D2B0F2B2B1F282B2E262B3D24"
8141 DATA "2B4D222B5C202B6B1E2B7B1C2A7A4053345B13345B134359135357136255"
8142 DATA "1371531B01511B104F1B1F4D1B2F4C1B3E4B1B4D4B1B5D481B6C481B7B49"
8143 DATA "230B43231A4823293C23394123483E23583D2367382376362B06302B152F"
8144 DATA "2B242D2B342A2B43282B52262B62242B712233002032004453395F13395F"
8145 DATA "13495D13585B1368591377571B06551B16531B25511B34501B444E1B534B"
8146 DATA "1B624B1B724B23014D23104623204B232F48233E3F234E42235D3C236C3A"
8147 DATA "237C362B0B352B1A332B2A312B392E2B482C2B582A2B67282B7626330624"
8148 DATA "320548533F63133F63134E61135E5F136D5D137C5B1B0C591B1B581B2A56"
8149 DATA "1B3A541B49531B58501B684E1B774E23064C23164C23254C233544234444"
8150 DATA "2353412363422372402B013C2B11392B20372B2F342B3F332B4E302B5D2E"
8151 DATA "2B6D2D2B7C2B330B29320B4D5344671344671354651363631373611B0260"
8152 DATA "1B115E1B215C1B305A1B3F581B4F571B5E541B6D551B7D50230C51231B4C"
8153 DATA "232B4B233A4B2349482359472368452377412B07402B163D2B253B2B3539"
8154 DATA "2B44372B53352B63332B723133022F33112D321051534A6B134A6B13596A"
8155 DATA "1369681378661B07641B17621B26601B355E1B455C1B545A1B63591B7357"
8156 DATA "230257231155232151233052234050234F4B235E4B236E49237D452B0C44"
8157 DATA "2B1C412B2B3F2B3A3D2B4A3B2B59392B68372B7835330733331631321655"
8158 DATA "535070135070135F6E136E6C137E6A1B0D681B1C661B2C641B3B621B4A60"
8159 DATA "1B5A5E1B695C1B785B23085923175723265723365423455223545023644F"
8160 DATA "23734B2B02492B12482B21452B30432B40412B4F3F2B5E3D2B6E3B2B7D39"
8161 DATA "330D37331C35321B595355741355741364721374701B036E1B126C1B226A"
8162 DATA "1B31681B40661B50641B5F631B6E601B7E5F230D5D231D5C232C59233B57"
8163 DATA "234B56235A532369512379502B084E2B174B2B27492B36472B45452B5543"
8164 DATA "2B64412B733F33033D33123B33213932215D535B78135B78136A76137974"
8165 DATA "1B09721B18701B276E1B376C1B466A1B55691B65671B7465230363231361"
8166 DATA "23225F23315D23415C23505A235F58236F55237E532B0D512B1D4F2B2C4D"
8167 DATA "2B3B4B2B4B492B5A472B6A452B794333084233184033273E32266253607C"
8168 DATA "13607C136F7A137F781B0E761B1D751B2D731B3C711B4B6F1B5B6D1B6A6B"
8169 DATA "1B796923096723186523286323376123465F23565E23655B23745A2B0458"
8170 DATA "2B13552B22542B32512B414F2B504E2B604C2B6F4A2B7E48330E46331D44"
8171 DATA "332C42322C6654660014660013757F1B047D1B147B1B23791B32771B4275"
8172 DATA "1B51731B60711B706F1B7F6D230E6B231E6A232D67233C65234C64235B62"
8173 DATA "236A60237A5E2B095C2B185A2B28582B37562B46542B56522B65502B754E"
8174 DATA "33044C33134A33234833324632326A546B05146B05147A031C0A011B197F"
8175 DATA "1B287D1B387B1B47791B56771B66751B757323057123146F23236D23336C"
8176 DATA "23426A235168236166237064237F622B0F602B1E5E2B2D5C2B3D5A2B4C58"
8177 DATA "2B5B562B6B542B7A5233095033194E33284C33374A32376E547109147109"
8178 DATA "1C00071C0F051C1F031C2E011B3D7F1B4D7D1B5C7B1B6B791B7B77230A75"
8179 DATA "23197423297223387023476E23576C23666A2375682B05662B14642B2362"
8180 DATA "2B33602B425E2B525C2B615A2B7058330056330F54331E52332E50333D4E"
8181 DATA "323D7254760D14760D1C050B1C15091C24071C33051C43031C52011B617F"
8182 DATA "1B717E23007C23107A231F78232E76233E74234D72235C70236C6E237B6C"
8183 DATA "2B0A6A2B1A682B29662B38642B48622B57602B665E2B765C33055A331458"
8184 DATA "332457333355334253324277547C11147C111C0B0F1C1A0D1C2A0B1C390A"
8185 DATA "1C48081C58061C67041C760224060023157E23247C23347A234378235276"
8186 DATA "2362742371722B00702B106E2B1F6C2B2E6A2B3E682B4D662B5D642B6C63"
8187 DATA "2B7B61330B5F331A5D33295B33395933485732487B5C01151C01151C1014"
8188 DATA "1C20121C2F101C3E0E1C4E0C1C5D0A1C6D081C7C06240B04241B02242A00"
8189 DATA "23397E23497C23587A2367782377762B06742B15722B25702B346F2B436D"
8190 DATA "2B536B2B62692B7167330165331063331F61332F5F333E5D334D5B324D7F"
8191 DATA "5C071A1C071A1C16181C25161C35141C44121C53101C630E1C720C24010A"
8192 DATA "241108242006242F04243F02244E00235D7E236D7C237C7B2B0B792B1B77"
8193 DATA "2B2A752B3A732B49712B586F2B686D2B776B330669331667332565333463"
8194 DATA "33446133535F3353035C0C1E1C0C1E1C1B1C1C2B1A1C3A181C49161C5914"
8195 DATA "1C68121C781024070E24160C24260A243508244406245405246303247201"
8196 DATA "2B027F2B117D2B207B2B30792B3F772B4E752B5E732B6D712B7C6F330C6D"
8197 DATA "331B6B332A69333A673349653358633358075C12221C12221C21201C301E"
8198 DATA "1C401C1C4F1A1C5E181C6E161C7D14240C12241C11242B0F243A0D244A0B"
8199 DATA "2459092468072478052C07032C16012B267F2B357D2B457B2B54792B6377"
8200 DATA "2B737533027333117133216F33306D333F6B334F6A335E68335E0C5C1726"
8201 DATA "1C17261C26241C36221C45201C551E1C641D1C731B240319241217242115"
8202 DATA "243113244011244F0F245F0D246E0B247D0F2C0D072C1C052C2B032C3B01"
8203 DATA "2B4A7F2B597D2B697B2B787933077733177633267433357233457033546E"
8204 DATA "33636C3363105C1D2A1C1D2A1C2C291C3B271C4B251C5A231C69211C791F"
8205 DATA "24081D24171B2427192436172445152455132464112473152C03132C1211"
8206 DATA "2C21092C31072C40052C50032C5F022C6E002B7E7E330D7C331C7A332C78"
8207 DATA "333B76334A74335A723369703369145C222F1C222F1C312D1C412B1C5029"
8208 DATA "1C60271C6F251C7E23240E21241D1F242C1D243C1B244B19245A17246A1B"
8209 DATA "2479192C08172C18152C27142C360C2C460A2C55082C64062C7404340302"
8210 DATA "34120033227E33317C33407A335078335F76336E74336E185C28331C2833"
8211 DATA "1C37311C462F1C562D1C652B1C742924042724132524222324322124411F"
8212 DATA "24501D246021246F20247E1E2C0E1C2C1D1A2C2D182C3C162C4B0E2C5B0C"
8213 DATA "2C6A0A2C790834090634180434270234370033467E33557C33657A337478"
8214 DATA "33741C5C2D371C2D371C3D351C4C331C5B311C6B2F1C7A2D24092B241929"
8215 DATA "2428272437262447242456282465262475242C04222C13202C231E2C321C"
8216 DATA "2C411A2C51182C60102C6F0E2C7F0C340E0A341D08342D06343C04344B02"
8217 DATA "345B00336A7F337A7D3379215C333B1C333B1C42391C51371C61351C7033"
8218 DATA "1C7F32240F30241E2E242D2C243D2A244C2E245B2C246B2A247A282C0926"
8219 DATA "2C191E2C28222C38202C471E2C561C2C661A2C751234041034140E34230C"
8220 DATA "34320B344209345107346005347003347F01337F255C383F1C383F1C483E"
8221 DATA "1C573C1C663A1C7638240536241434242432243330244234245232246130"
8222 DATA "24702E2C002C2C0F242C1E222C2E202C3D242C4C222C5C202C6B1E2C7A1D"
8223 DATA "340A1534191334281134380F34470D34560B3466093475073C05053B0429"
8224 DATA "5C3E441C3E441C4D421C5C401C6C3E1C7B3C240A3A241A3824293624383A"
8225 DATA "2448382457362466342476322C052A2C15282C24262C33242C43232C5227"
8226 DATA "2C61252C7123340021340F1F341F17342E15343D13344D11345C0F346B0D"
8227 DATA "347B0B3C0A093B0A2D5C43481C43481C53461C62441C714224014024103E"
8228 DATA "241F3C242F40243E3E244D3C245D3A246C38247B302C0B2F2C1A2D2C292B"
8229 DATA "2C39292C48272C57252C67292C7627340525341523342421343319344317"
8230 DATA "3452153462133471113C000F3C100D3B0F315C494C1C494C1C584A1C6748"
8231 DATA "1C774624064424154224254624344424434224534124623F2471372C0135"
8232 DATA "2C10332C20312C2F2F2C3E2D2C4E2B2C5D292C6C272C7C2B340B29341A27"
8233 DATA "342A2534392334481B3458193467173476153C06143C15123B15365C4E50"
8234 DATA "1C4E501C5E4E1C6D4C1C7C4A240C48241B4D242A4B243A49244947245845"
8235 DATA "24683D24773B2C06392C16372C25352C34392C44312C532F2C622D2C722B"
8236 DATA "34012934102D34202B342F29343E27344E26345D1E346D1C347C1A3C0B18"
8237 DATA "3C1B163B1A3A5C54541C54541C63531C725124024F24115324205124304F"
8238 DATA "243F4D244E4B245E43246D41247D3F2C0C3D2C1B3B2C2B3F2C3A3D2C493B"
8239 DATA "2C59332C68312C772F34072D34162C34253034352E34442C34532A346328"
8240 DATA "3472203C011E3C111C3C201A3B203E5C59591C59591C69571C7855240759"
8241 DATA "2417572426552435532445512454492463472473452C02432C11412C2145"
8242 DATA "2C30432C3F412C4F3F2C5E3E2C6D362C7D34340C32341B30342B2E343A32"
8243 DATA "344A3034592E34682C34782A3C07223C16203C261E3B25425C5F5D1C5F5D"
8244 DATA "1C6E5B1C7D5F240D5D241C5B242B59243B57244A4F24594D24694B247849"
8245 DATA "2C08472C174B2C264A2C36482C45462C54442C64422C7340340238341236"
8246 DATA "342134343032344030344F34345E32346E30347D2E3C0C2C3C1C243C2B22"
8247 DATA "3B2B465C64611C64611C746524036324126124225F24315D244055245053"
8248 DATA "245F51246E50247E4E2C0D522C1C502C2C4E2C3B4C2C4A442C5A482C6946"
8249 DATA "2C784434084234173A3426383436363445343455323464363473343C0332"
8250 DATA "3C12303C212F3C31273B304B5C6A651C6A651C796324086124185F24275D"
8251 DATA "24365C24465A2455582465562474542C03522C13502C224E2C314C2C414A"
8252 DATA "2C50482C5F462C6F442C7E42340D40341D3E342C3C343B3A344B38345A36"
8253 DATA "3469353479333C08313C172F3C272D3C362B3B364F5C6F691C6F691C7F68"
8254 DATA "240E66241D64242D62243C60244B5E245B5C246A5A2479582C09562C1854"
8255 DATA "2C27522C37502C464E2C554C2C654A2C7448340346341344342242343241"
8256 DATA "34413F34503D34603B346F39347E373C0E353C1D333C2C313C3C2F3B3B53"
8257 DATA "5C756E1C756E24046C24136A24236824326C24416A24516824606024705E"
8258 DATA "247F5C2C0E5A2C1E5E2C2D5C2C3C542C4C522C5B502C6A542C7A4D340951"
8259 DATA "34184934284D34374534464334564734653F34743D3C043B3C13393C2237"
8260 DATA "3C32353C41333B41575C7A721C7A72240A7024196E24286C243870244768"
8261 DATA "24566624666A2475622C04602C14642C235C2C325A2C425F2C51572C6055"
8262 DATA "2C70592C7F51340E55341E4D342D51343D49344C47345B4B346B43347A41"
8263 DATA "3C093F3C193D3C283B3C37393C47373B465B640076240076240F74241E72"
8264 DATA "242E70243D74244D6C245C6A246B6E247B662C0A652C19692C29612C385F"
8265 DATA "2C47632C575B2C66592C755D34055534145934235134335534424D34514B"
8266 DATA "34614F347047347F453C0F433C1E413C2D3F3C3D3E3C4C3C3B4C6064057A"
8267 DATA "24057A24157824247624337424437824527124616F2471732C006B2C0F69"
8268 DATA "2C1F6D2C2E652C3D632C4D672C5C5F2C6B5D2C7B61340A59341A5D342955"
8269 DATA "34385934485134574F34665334764B3C054A3C14483C24463C33443C4242"
8270 DATA "3C52403B5164640B7E240B7E241A7D24297B24397924487D24587B246779"
8271 DATA "2476712C066F2C156D2C24712C34692C43672C526B2C62632C7161340065"
8272 DATA "34105D341F61342E59343E5D344D56345C54346C58347B563C0A543C1A4C"
8273 DATA "3C294A3C38483C48463C57443B5768651003251003252001242F7F243E7D"
8274 DATA "254E01245D79246C77247C7B2C0B732C1A712C2A752C396D2C486B2C586F"
8275 DATA "2C67672C766534066934156234256634345E34436234535A34625834715C"
8276 DATA "3C01543C10523C1F563C2F4E3C3E4C3C4D4A3C5D483B5C6C651607251607"
8277 DATA "25250525350325440125530524637D24727B2C017F2C11772C20752C2F79"
8278 DATA "2C3F712C4E6F2C5D742C6D6C2C7C6A340B6E341B6C342A6A343968344966"
8279 DATA "34585E34675C3477603C06583C15563C255A3C34523C43503C534E3C624C"
8280 DATA "3B6270651B0B251B0B252B09253A0725490525590925680124777F2D0703"
8281 DATA "2C167B2C257A2C357E2C44762C53742C63782C727034026E341172342070"
8282 DATA "343068343F6C344E6A345E62346D60347C643C0C5C3C1B5A3C2A5E3C3A56"
8283 DATA "3C49543C58533C68513B677565210F25210F25300D25400B254F09255E0D"
8284 DATA "256E0C257D0A2D0C022D1C002C2B7E2D3A022C4A7A2C59782C687C2C7874"
8285 DATA "34077234167034267434356C3444703454683463663472643C02683C1166"
8286 DATA "3C20653C305D3C3F5B3C4E593C5E573C6D553B6D79652613252613253612"
8287 DATA "25451025540E25640C25730A2D02082D12062D21042D30022D40002C4F7E"
8288 DATA "2C5E7C2C6E7A2C7D78340D76341C74342B72343B70344A6E34596C34696B"
8289 DATA "3478693C07673C17653C26633C35613C455F3C545D3C635B3C73593B727D"
8290 DATA "652C18252C18253B16254B14255A1225691025790E2D080C2D170A2D2708"
8291 DATA "2D36062D45042D55022D64002C737E34037C34127A342178343177344075"
8292 DATA "344F73345F71346E6F347D6D3C0D6B3C1C693C2B673C3B653C4A633C5A61"
8293 DATA "3C695F3C785D3C780165311C25311C25411A255018255F16256F14257E12"
8294 DATA "2D0D102D1D0E2D2C0C2D3B0A2D4B082D5A062D6A042D790335080134187F"
8295 DATA "34277D34367B3446793455773464753474733C03713C126F3C226D3C316B"
8296 DATA "3C40693C50673C5F653C6E633C7E613C7D05"
8297 DATA "z"
