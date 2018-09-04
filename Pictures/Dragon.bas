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
8000 DATA "55635D156A65157169157F6E157970157470156D6C1569681569655D006E"
8001 DATA "1D0E6E1D286A1D3B661D406B1D46701D4A711D516F1D4D6C1D48681D4366"
8002 DATA "1D3B675D526E1D56711D5C701D636C1D6A681D72601D735C1D795625024A"
8003 DATA "25093A250D29250F17250F07240A742405601C7F501C7B411C7A351C7A29"
8004 DATA "240121240C1424130A241700231B7123216523265B23264C232739232829"
8005 DATA "23271B23230B231F0222177A22117922087B22027F1B77071B6E0F1B6815"
8006 DATA "1B5D1D1B55251B492E1B452E1B3E2B1B3A261B37211B301A1B2F191B2C1B"
8007 DATA "1B2B1C1B2B201B2E271B332B1B3B311B3F351B33341B2C311B252C1B1D27"
8008 DATA "1B1A241B19251B16261B16291B192E1B21361B283A1B323E1B2A411B2442"
8009 DATA "1B29411B23411B1C3E1B173B1B0F3B1B0D3B1B0C3E1B0E411B16461B204B"
8010 DATA "1B2A491B30471B37451B3A491B39521B355A1B2E5E1B265F1B25621B2765"
8011 DATA "1B31651B39631B3E5E1B42591B45521B47471B4C431B60381B6F2F1B7E29"
8012 DATA "23022723082A230B2D6301281B7F301B7E351B7D3C1B7D4A621C7E221970"
8013 DATA "221762221A54221F4422243522262922231222220721207A212077212470"
8014 DATA "212965212D5C212E54212F4C212F41212D34212D27212D1B212F12213508"
8015 DATA "213E01204C78205871205F72206571206A69206964206B5C206B5220684A"
8016 DATA "20654220654920655020635520615C205961205966205C6A20616A206468"
8017 DATA "20686520696360615C205D5B20565C20525F204E6220456520426620406D"
8018 DATA "203D73203B78604364204762204B5E204B5820485420475820435C203E5C"
8019 DATA "203B5C203A58203B54203B4F203E4820423D204733204A3F204949204754"
8020 DATA "603B5020335220315820325C20345F60315B20296520266D201E6520175F"
8021 DATA "201357200C54200556200A5D200A62200565200065187B61187859187653"
8022 DATA "187849187C40187D48200150200558587A5F187966187D6B20056F200A6F"
8023 DATA "201777201E7C211B0421170D210F19210423197E2A197A3419773E19754B"
8024 DATA "19755519765F1970661967741A61031A5E141A5E221A602B1A633C1A674A"
8025 DATA "1A6A5B1A6A661A6A771B6A031B6B135B6F301B723B1B754C1B72611B6E73"
8026 DATA "1C670C1C631E1C64331C68411C70531C76651C7D7825010625010F250016"
8027 DATA "1D7D1E1D7A251D762E1D6F311D672E1D5E2C1D55261D49201D3E1A1D3115"
8028 DATA "1D21101D110F1D020F157C15157D13157C17157B1E157F181D03151D0614"
8029 DATA "1D09151D07181D031B1D0B1A1D10171D12181D0F1B1D0E211D131E1D191C"
8030 DATA "1D1B1C1D161F1D16261D1B211D211D1D241F1D20241D1F291D25251D2B22"
8031 DATA "1D2C231D29281D282C1D2C291D33281D37281D312C1D2F301D352F1D3D2D"
8032 DATA "1D40351D413B1D40421D3B481D354C1D314A1D30461D2D4A1D2D4F1D2A4F"
8033 DATA "1D274A1D28471D224D1D22531D20531D1D4E1D1D4A1D1D471D194D1D1853"
8034 DATA "1D154E1D15471D124A1D124F1D12531D0D4F1D0C4C1D0B481D0A4C1D0852"
8035 DATA "1D05521D034F1D034D1D034A1D004C1D004F1D0053157C5315794D157844"
8036 DATA "15793E157C3A15773D15734115724515724F157354157156156E4F156D4C"
8037 DATA "156D4815694715684C15685115695715605C5D40411D36401D273E1D1F3C"
8038 DATA "1D0E411D0145157848557148156946156345155C4115543E15453A15393C"
8039 DATA "152C3F152344151B4915154E151F41152C3C153A36154336153930152E2F"
8040 DATA "15252F15153215262C15352C15422D154C32155E3A15693E15744155793F"
8041 DATA "1D033E1D0F391D1D361D2C351D34361D3B361D403555735F157566157968"
8042 DATA "1D006C1D0A691D126155795E157E611D01641D06631D0A5D1D045B1D005C"
8043 DATA "157C5F5D4D621D53661D58681D5D681D61611D655C1D5A581D55591D515C"
8044 DATA "1D4D625D51611D52661D58671D5D641D5D5F1D5A5C1D575A1D555C1D515F"
8045 DATA "5D6B481D6E4B1D714D1D72531D76511D7B4D1D7D4525013E25053E25003D"
8046 DATA "1D79401D76471D72481D6A485D5C2A1D5F231D611E1D63101D62041C5F7E"
8047 DATA "1C57701C4A611C42571C36491C25331C1B1D1C16171C0E15146B15146516"
8048 DATA "14641A146821147F431C08571C085E1C05671C0070147F711C017F157E08"
8049 DATA "15760F156D17156817156814156710156D0C15760614777E14757A156C01"
8050 DATA "15600C155712154C1415431315410F15410C154A0C155509155D0414647B"
8051 DATA "146879145B7B154F01154503153C0214337E14347A143678143F7B144C7A"
8052 DATA "145B7314646C145E6714516514486814426C144069144165144861144F5E"
8053 DATA "145A5E146A60146D6214715D147255146B4A146240145B3614522C144C25"
8054 DATA "14451A14410F144004134577134D731376671B06621B0B5E1B094F1B0846"
8055 DATA "1B093B5B08341B07211B050D1A0277127A65127453126643125B37125229"
8056 DATA "124C2312351212260A121900110E74110562110257097E4609773809712A"
8057 DATA "096C1D09670D08637E095303094303093803093102092C0409260308217F"
8058 DATA "08217A08297C082E79082E76082D7108297108227108176D080F66080858"
8059 DATA "080864080D7108177808227B482971082C6E08276808266108225D081A56"
8060 DATA "08174E081746081B3E081D4508224E082D5708315908355F083564083166"
8061 DATA "082E67082862482D6D08346F083C6E483770084073084B77085778482E58"
8062 DATA "083455083C5708405B084D61085D66086466086B5F08705708735308744A"
8063 DATA "08794610034410084610024B087E50100255100957100F51101549101842"
8064 DATA "101639101535101331100C28100E35100B3F10074650134E10135410105B"
8065 DATA "10065F087E69087E71100279110A01111306111E0F11291A113326113D37"
8066 DATA "11434311534D116656117A5F19096219065B190155117751116A53116354"
8067 DATA "512B1C11371811490E11620B190011190C18191B29192546192A56192569"
8068 DATA "191F791A19091A131D1A12311A10451A0B611A096D1B0B0C1B0C1D1B1139"
8069 DATA "5B10451B15561B165C5B18631B1D731B237E1C2C181C33291C3D3A1C474C"
8070 DATA "1C525D1C5F701D67011D680C1D66171D61261D5F2C5D69691D726C1D7A6D"
8071 DATA "250B6C25116825086A1D7F671D79611D7C5F25065F25195E252555251A55"
8072 DATA "250F51250D4F251548251D46252B3E253333253529252D2F252030251A2F"
8073 DATA "25212825291F252D11252F03252608252109251B08251704241B7C241F73"
8074 DATA "24216B241F5E241B5324185C241265240A6524115824144C24133D240F47"
8075 DATA "24074C240150240745240A3C240A3524063D2401401C7D4124023C240737"
8076 DATA "24092E240A2C2405301C7E3224022C240922240D1A24051B640B1624181B"
8077 DATA "24252524313E243857243E6E243F7C24496424514624562C235E7E23624F"
8078 DATA "236507226257226137226122216478216857216E39217323216738215759"
8079 DATA "214E79224A0D214A7B214B6A214D54214E4421455C213D6F223902223322"
8080 DATA "223137223123223116223106213273222A0F2226225C28371C254A1C2767"
8081 DATA "1C29771D330C1D34101D28031C196C1C0A55147C3B146F1E146D1553616C"
8082 DATA "135850135034134414123774122850121A33120815120D1112110D121E14"
8083 DATA "123229123C3812444712484B124437123D2512381A12341252441B124B25"
8084 DATA "125330125E4112664F126E5F126C55126846597A77197D7F220504221206"
8085 DATA "221C0021217759620A196A22196E3C197255197265597837197227196711"
8086 DATA "18587E184A77183370181C72180078106C7E115307113D12112B1B497735"
8087 DATA "096A3A09593F09413E09313909213309102C017B23016116014C1101370E"
8088 DATA "012811011D1D01142E01103A01124A011257011567011A7A022309022711"
8089 DATA "022718022A1402301802322202382802381C023F2B02463602462A024B30"
8090 DATA "02513A02543E025438025736026043026348026542026942026D4D027058"
8091 DATA "02725B02725102744D027650027662027668027D61027F52027F46027D3B"
8092 DATA "026E2902601E024F12023E02013371013061013054012E3B01303A01333E"
8093 DATA "01304D013053013748013E3F01423001463401464001424E014F4C015C45"
8094 DATA "015F42015C4D015B5301545B016258016E5201724F017059016663015E6A"
8095 DATA "016E6A017F66090D5F090C6B090577017E7D09107F091E7B092C74092F70"
8096 DATA "0931790A2D060A29100A380D0A470609567A0A55030A530C0A4E190A5618"
8097 DATA "0A63140A6C0F0A7309097B7D0A7D060A7D130A7B1C120317120D1212150C"
8098 DATA "121B02121E0D121E14122711122B0D49733109663109593009432D092F25"
8099 DATA "09171B017C1201650C01480801360A01271142674602674C02665302575A"
8100 DATA "024958023E5002364602323A02322D023627422E1902292102242E02263E"
8101 DATA "022D5402376202456D024F70026374026E6F027669027B63027C6D02787B"
8102 DATA "02767002726D027077026A7E026A77026674025D7902557C025777025674"
8103 DATA "024D7402427102466E023B68023B65424A0D02530D0266100276160A0421"
8104 DATA "0A13340A1B420A092B027C2102721C026217025817422710022C0F022C06"
8105 DATA "02301402301842280B02260201236E012879012C7F012870012662012651"
8106 DATA "012961012C6A012F54012E3F01303801324301315351096D09706F09526D"
8107 DATA "09446B09316509256009175B090451016E4601603C015135013D30013034"
8108 DATA "01284601225E012270412B7F02320D023E1B024B2A025833026C4102754D"
8109 DATA "027A5B027B6341450D01540A415411015E0D416014017210416C1B090415"
8110 DATA "417C2309141D49042609252349162D09342749233309412E493839095532"
8111 DATA "494E3D096635592011193810195B11590E06193800195401517605117605"
8112 DATA "18157D18357C184978592B25194E2119641F59363C195936593357196251"
8113 DATA "592A78194573195C6D5A19131A300F5A430B1A5C075A162C1A37265A5122"
8114 DATA "1A5C1F5A16425A16421A353E1A57371A5F375A12521A31501A514D1A634A"
8115 DATA "5A6A5C1A48601A29661A10665A0C7A1A287A1A39791A58761A66725B6605"
8116 DATA "1B51091B340D5B250D1B0F0D5B64141B4E171B37195B6D441B5D461B5048"
8117 DATA "5B71531B60591B49585B2B561B18565B69631B5B691B426C1B286A5B287B"
8118 DATA "1B3B7B1B507D1B64771B69775C66041C5A061C49091C2D055C30131C4117"
8119 DATA "1C54151C63135C5F221C54231C44221C36215C3D311C4D331C60335C6339"
8120 DATA "1C5C3B1C4D3A1C42395C49481C544B1C5F4C1C67485C6B531C66561C5B56"
8121 DATA "1C51545C5B601C64611C6D601C6F5E5C776D1C74701C6A6F1C626C5C6777"
8122 DATA "1C6F771C77771C7A765C7D7D1D78001D71001C6A7E5D6B081D73091D7908"
8123 DATA "1D7D065D7E0F1D79111D6F111D6B105D67171D6E1A1D76191D7C175D7C1C"
8124 DATA "1D6D1E1D671E5D66211D6F211D76211D79225D76251D6D251D61275D6128"
8125 DATA "1D67281D6E281D742A5D702E1D662C1D602C5568561570551578551D0453"
8126 DATA "1D10531D20531D2D4F1D3B4A1D40421D40351D392A1D31251D211E1D0F16"
8127 DATA "1D0113157C135D49411D4A3C1D4B371D49311D452C55681715611A15571B"
8128 DATA "15601715661055421315381115350E153208153D0D15410D54327E142D7A"
8129 DATA "142A7314296F142E7314337754416D143E6F143975143B6D143E685B2766"
8130 DATA "1B1C641B125B1B1C5E1B25605B0B3E1B05391B032E1B09341B0F385B1628"
8131 DATA "1B13201B16171B161F1B19235B2A1D1B28171B2A101B2E0A1B2D121B2F18"
8132 DATA "z"
