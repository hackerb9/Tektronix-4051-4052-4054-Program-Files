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
8000 DATA "61221E21222121242121241E21231E211C1D211C1C21161C210F1D21061F"
8001 DATA "197E21197525196D2819662D195D3419553A194B4219424C193A5619335F"
8002 DATA "192C6A1924761A1F001A190A1A13191A0F241A0A331A06401A024D127E5B"
8003 DATA "127C6912787C13761213752713743713754913765C13755D137560137761"
8004 DATA "137971147C011C01131C07231C0E351C0D381C0E3A1C113C1C16461C1C4F"
8005 DATA "1C255C1C2F671C376E1C3A711C3E711C49741C49751C7E7E24007D240B7F"
8006 DATA "250C0125120225150725150A25150B25130B25150C251310251211251013"
8007 DATA "250E14250B14250B152508152508132500122500131D7E131D7D141D7413"
8008 DATA "1D72131D71131D71111D640F1D63101D5A0F1D5A0E1D4C0C1D4B0D1D490D"
8009 DATA "1D490C1D400B1D3F051D3B051D3A061D35061D35071D31071D31061D2C06"
8010 DATA "1C2E7C1C317D1C31791C2F781C2F701C3A715C3E731C3E771C3B771C3B7A"
8011 DATA "1C30785C317C1C497E1D49061D41065D3B051C3B7E5C3E781C4B7A1C4A74"
8012 DATA "5C4A781C4F791C517D1C537B1C52791C50771C4B755C517E1D6B011D6C03"
8013 DATA "1D77051D7902251507651311251C12251D0B25190B251907251C07241E7F"
8014 DATA "24137D25110265190B25160B651608251908651812251814251314251311"
8015 DATA "65041125051125070E1D760C1D760E1D670D1D67091D60081D600A1D5C0D"
8016 DATA "1D580C1D560D5D760C1D680A5D480A1D4D0A1D50081D52051D53031C537F"
8017 DATA "1C4F7E1D4F021D4D051D4B071D4105650C0024127F64187D24197B242078"
8018 DATA "242A7124326C243A6524415E244B5524524C245843245A43245C3F245C3D"
8019 DATA "24613624662E246C2324721724770A247B00237F742B02742B03702B026D"
8020 DATA "2B05652B09562B0B4A2B0D406B0F372B112B2B12216B13162B15052A1577"
8021 DATA "2A15672A14512A12432A11332A0E28616343215D3B612221211B21211B24"
8022 DATA "211624210826197B2A196E30196139195841194F48194850194258193C5F"
8023 DATA "193469192A791A24061A1C141A17211A122D1A0E3B1A0A481A07521A0267"
8024 DATA "1A0075137D08137C1E137C35137D51137F641B02761C080F1C0D201C1531"
8025 DATA "1C1A3C1C1F461C27521C2F5B1C38641C416C1C4B721C59771C677B1C767C"
8026 DATA "24037B240E78241B7224276C243264243E5824474F24543F245E2F246622"
8027 DATA "24700D23757F237A712B005E2B054D2B07436B0F102B0F012A0F712A0F65"
8028 DATA "2A0E522A0D442A0B3B6A0A482A0C592A0E632A046A627F722A01762A0E6E"
8029 DATA "2A0D7A2B0D092B0D0F6B0C252B0C2B6B092B2B09256B03442B0053237B68"
8030 DATA "237263237260235547634845236860236863236E69236F6823796F247300"
8031 DATA "246A16245F2924583624502E1B7E555B7D5F244B33244E3124553A244E44"
8032 DATA "24454F243C57242F6224236C241971241074240D691B7D5D5B775C24066A"
8033 DATA "24086A240A752401771C70791C64781C59751C50721C52641C56641B4D5B"
8034 DATA "5B455B1C4F631C4A6F1C41691C39611C31591C29501C23461C1C3B1C1731"
8035 DATA "1B455D5B41541C13271C0F201C090F1B057D1B026F1B005E1B2F1A5B2D10"
8036 DATA "137E52137E47137E37137E27137F111B00001A03711A06601A0A4F1A0D46"
8037 DATA "1A14501B2D0E5B31001A11381A16271A1E141A280119346E1A4E405A533F"
8038 DATA "19396819405D194654194F4B19603C196C34197A2D2105291A533A5A5B3D"
8039 DATA "211026211626612B69220C44612C7B22144122303462303C22104B231B15"
8040 DATA "23191B1B785C1B45571B2E0B1A513F1A573E220E4622104C62303D22134B"
8041 DATA "231C191B7F565B775F1B685D1B68601B595E1B585B1B4C5B5B585B1B5C59"
8042 DATA "1B5E5C1B625C1B655A1B695C5B655E1B5D5D5B41541B2F195A317E1A4D40"
8043 DATA "5A5B3D1A6C3F1A6D415A6B3F1A6B3D1A7D3F1A7E421A7B421A7A445A6F3F"
8044 DATA "1A78405A7E42220C4459794F19794A197A4561084121054B197F54610C42"
8045 DATA "21013F193B71193B73197A4559675019634F19565A19565F195A62196857"
8046 DATA "196950593E7219427E1A42045A3C091A3A0619367D593A741A17421A1944"
8047 DATA "19377F5A2C111A28111A22201A23271A27261A2E151A2D1159794E197550"
8048 DATA "19724D19695559586219496E19497219417B5A3A071A350C1A300D1A1F36"
8049 DATA "1A203C1A1B475A1E541A1E4C1A17415A195A1A14555A16441B094E5B0B3C"
8050 DATA "1A16561A17591A16681A126B1A0F7E1B13031B13191B0D1D1B081A1A0A7F"
8051 DATA "1A107C1B0D2E1B0F311B0F3A5B094C1C1D205C191B1B07531B0D4B1B0F55"
8052 DATA "1B0D591B136E1B156E1B197C1C16021C12021B0D711B116D5C17001C1A0C"
8053 DATA "1C1E0D1C1F125C1D201C51641C4F551C48511C46511C282D1C27261C2120"
8054 DATA "5C313E1C30431C3B4F1C3F4D1C3E461C353C1C313D5B0E3A1B093D5B0E49"
8055 DATA "1B0A525C20101C1A165C231C1C1F285C4F551C4E571C4E5E5C56561C585A"
8056 DATA "1C59645C5263240A6A5C585E1C5D5E1C60611C67635C676B1C65651C6863"
8057 DATA "1C6A611C76631C78661C7A681C796A1C796D1C676B5C78651C7C651C7D63"
8058 DATA "24036364045C24025D240369640E67240C5E240A5C640B5F24135A24185B"
8059 DATA "24245124254E243142243442243D3A243E3524432F64503024096A642555"
8060 DATA "24245164245524285724384924384424344364412924432F244835644722"
8061 DATA "244B2424522A644F30237264237547644D2524501C24561C245B12245B0D"
8062 DATA "23637B23667B23697323676D236A66645D13246116236B7E23687923657B"
8063 DATA "645C14245C0E636A61237066636A58236D5823735D636E5A236F5123714F"
8064 DATA "2373475A70731A5A45220C4C2211781A70735A6A461A6C491A7B4B1A7E49"
8065 DATA "6202431A7D3D1A783A1A70381A67391A603D5A6B751A534A1B36091B500B"
8066 DATA "1B610E1A6B755B5F141B34101B484D1B652C1B60145B68321B4D521B7456"
8067 DATA "2303351B68325B6B2C1B65131A6F7922107E2315182307301B6B2C630526"
8068 DATA "230A1A230D162308081B74041B6D121B71232304252301271B76281B6A27"
8069 DATA "5B63271B53241B4F135B500C1B56011A5A7D1A677E5B6D001B7506630808"
8070 DATA "1B7E041B73011A6C7F5B75051B6D121B70231B69245B6F161B78181B7814"
8071 DATA "1B6E121B760823060B230A14230619230119230315230A156303161B7715"
8072 DATA "612A4E21364A214747215D43216C42217643217848290948290742291848"
8073 DATA "291A522A0270227E72227873227675226C75226C73226572225C7122546D"
8074 DATA "224B6A22416522386022325C212A4E61334E216E4521734521764B217D4B"
8075 DATA "217D4E29024E29044B290B4B290B4629184C69185B29125B2A0504226B03"
8076 DATA "21615D215F5B215B5B21345C21334E613560223513223D13223D1D22371D"
8077 DATA "22375022594D225F4922672A226319226804215F5F215C5E21355F623513"
8078 DATA "223616223D1822371922371D62375322375B22406122496622536B225D6E"
8079 DATA "226870226C70226B6A22756A22776E22796E227C6F2A026E626B63227166"
8080 DATA "227764227162226C646A074F2A034F227F2D22692D22614B225C4D22564F"
8081 DATA "2237536A084B2A064B2A022C2A08142A060729155E29185E626B0722661B"
8082 DATA "22692A2A002B2A04152A0108226B0640000061094F21084F210651210553"
8083 DATA "21025321025521065521065921065A21095B610659197D59610151210651"
8084 DATA "61094521096D210E6E210E70211970211A6E21206E21285D612C4C212C4A"
8085 DATA "212749212647211744211545210B45210945610B45210B6C21206D611C45"
8086 DATA "211C48211E48212046212049212249212347611E48211C4D21114D211164"
8087 DATA "21216421245D21225F21206121136021134F211D5061204921204D212551"
8088 DATA "610B3F210C37212336212C3621393A21443D214047210B3F61233621263B"
8089 DATA "21303D21333861283621283A212F3A212F39612852212452212354212359"
8090 DATA "21245C21225D211F5F211D5D211C5B211C55211D52211E51212251611E51"
8091 DATA "211B5121185221175621185B211B5E211E5F612134212534212833212A33"
8092 DATA "212B35214B3A214D34212F2F212F3121353121352F613E32213C36214337"
8093 DATA "214533612E2E212C29212728212724213B26213C2121271C21241D212419"
8094 DATA "21271921271C61271921311C21401F214029212728612B19212D18212E11"
8095 DATA "213C1221401621591B215919215F1921621E216520217124217926290327"
8096 DATA "290325290123217321217124613A17216D23613830217D31290433290434"
8097 DATA "29083429093229092D29092729032729032429072429072761592D216A2D"
8098 DATA "216A2821592321642821642C21592D61382F214E34215336215338215938"
8099 DATA "215B3621613621653329033369083429083A29013B216C3B216738216533"
8100 DATA "61623621623C21573C215738616B3A21683B21683F216B3F216B3B616B3F"
8101 DATA "217D40217D3B29023D290240217D41216C41216B3F617D3F217D49617D43"
8102 DATA "217943217946217D46616B3F216B43624368224370224870224972225272"
8103 DATA "22546E627674224A72224A76227676227675624A78224A75624A72223E77"
8104 DATA "624378233E21233D24233B25233827233326232F24222E77224277623C77"
8105 DATA "223C7F223F7F22407763301A23321B233221233021632F2423332823362A"
8106 DATA "233B2A233E2723402423411D234600236502237E08237E0D634603235D05"
8107 DATA "236C09236C096B020D2B0204237E0122747E226C7A226B78226877226277"
8108 DATA "226077225D7822567822437862627F236800632E0023270022217E231A0E"
8109 DATA "231F10231D1623221723221B231C1B231C22231622231B3723213723233A"
8110 DATA "235030235D2E23622D236227234724234722234322234227233D2C23372D"
8111 DATA "23312B232E2423262223261E23291E232917232717232914232D13632F04"
8112 DATA "232904232014232414232810232E1063221723291723291B23211B631E20"
8113 DATA "232434233034232D28232425232220231E2063452723442C23412E233D30"
8114 DATA "233E32235D2B235D2923462863481B23481723471523451223431163430D"
8115 DATA "235F1A235F1D23481A63631B2B0F232B0F2623622023621C234508634316"
8116 DATA "23441923441E23632063622D2B0A322B0D2D236327635F27235F20236221"
8117 DATA "2362262366262368226B0025237F2A2B022B2B03262B08272B082B6B712D"
8118 DATA "2B702A2B72282B732B2B712D2B6A2E2B682B2B68272B6B252B72286B5D25"
8119 DATA "2B5D272B5D2A2B4D282B4E262B4E232B5D256B5A252B59272B59296B5529"
8120 DATA "2B54262B55256B6A2F2B5C296B5D252B6B246B4C292B4B262B4C232B451F"
8121 DATA "2B41222B41262B442B2B4C296B37212B36232B3625237B1D23791A237717"
8122 DATA "237A15237D152B36206B2E242B2D222B2E1F6B33202B32222B33256B3625"
8123 DATA "6B452B2B36256B36212B451F63791E23701E236D1B236B17236B14236D10"
8124 DATA "237110237310237B13237E1563791223760E23740C23700C236C0E236A0F"
8125 DATA "23681423681823691B236C1E23701F23731E63730C23640723590A23580D"
8126 DATA "23581223581463541123570963550923520F634F0D235308634F08234C0C"
8127 DATA "63490B234D07634A07234809636F092B090F2B0E122B12182B1C1B6B1017"
8128 DATA "2B0D186B0D132B09132B07142B04166B00162B02142B04112B08106B6E49"
8129 DATA "2B6D472B6F442B71462B6F492B664B2B63472B63442B66412B6E446B654B"
8130 DATA "2B57452B57422B67416B57462B4D452B4D432B4D412B57426B53422B5345"
8131 DATA "6B51452B51436B4C452B4B462B49432B4C3F2B4E416B4C452B43482B4045"
8132 DATA "2B40402B433D2B4C406B43482B35422B353E2B433C2B443D6B354223773D"
8133 DATA "23753A2375352379342B363E6B333D2B32416B30402B303D6B37432B0542"
8134 DATA "2B03402B033E6B0B412B0B3F2B0A3E63773E236C3E23673B236636236831"
8135 DATA "236D30237734636D3F236C4123673F23653B23633723643223662F23692D"
8136 DATA "23612D636B4123584323544023513C2351362351306B0C372B09342B0633"
8137 DATA "2B02332B0034237F35637E3D237E402B00422B02452B06452B08426B0D42"
8138 DATA "2B0E432B0F426B0244237248236A46236842636946236349235F47235F43"
8139 DATA "635F49235347235146235044235040235340634E40234D42234B43234745"
8140 DATA "23454623354523334323343F632F3C23233B632F38232F3B23313E233740"
8141 DATA "23394023373C233639233636633935233938233A3B233C3D233F3F633C3F"
8142 DATA "23533F63303F233A3F233E3E63423E23413B234136234234634534234537"
8143 DATA "23453A23473E634C3E234A3B234937234A32634C32234C35234D3923503E"
8144 DATA "63523E234E3A234E36234F31633E35233D39233E3C23413E632032231C27"
8145 DATA "63000D5B4F5B1B53601B56621B5C641B61651B68641B6C631B6E611B705F"
8146 DATA "5B765F1B685E1B67601B595F1B585C1B5B5A1B5E5B1B5E5C1B615C1B615B"
8147 DATA "1B675B1B695D5B64601B645F1B5C5E1B5C5F5B585C1B4C5C61161D21161B"
8148 DATA "21111B21111A21091A21081721071419791419711D19761B19771A197B15"
8149 DATA "61031521031921051D210A1E59711D196D1F196320195322193E23192923"
8150 DATA "19262519262819282819272919262919262B19262D19282F19642F59272F"
8151 DATA "19263019252E19242B192426192524192723192923592722191F22191D24"
8152 DATA "191D26191D28191D2B191D2D191F30192930591D2E190E2E190B2C19092A"
8153 DATA "190927190925190C23191D24590C23190B2219092319072519072819082B"
8154 DATA "19092D190C2F19102E590D2F19052F190521190F21190F2359112319101D"
8155 DATA "117F1D117C2119002319002A19022A19022919002919002D117E30117C30"
8156 DATA "19003219022F19032B19032619012019001D59021D19021B19041B19041D"
8157 DATA "59091D19091B190C1B190C1D517D2111782111752511722511722C11772C"
8158 DATA "117730117E30517830117A2D117A2A117B25117B22117921517725117826"
8159 DATA "11772A11762D590E32190E35117C35117D31517C34117134117136116C36"
8160 DATA "116B38115E37115C7011577411557711547E115F7F126001126003125D03"
8161 DATA "125E0812620912620C12720D127309126108526003127706515F7F126001"
8162 DATA "126A01116A7F127C01527901117B7D117A7711787111756C11746F117876"
8163 DATA "11787B127801127C01117B7B527C01117D7E190078117F74117C6F11796A"
8164 DATA "117668117276116F78115E77115D75115D6F115E66117067116F72116D74"
8165 DATA "116B74115F74115D6D516574116772116971116A6C116968116666116368"
8166 DATA "11656A11666C11666F11647211637311617111606F11606D11606B116268"
8167 DATA "116468516062116062516764116764517064117064515D75115B77115A7A"
8168 DATA "11627B11647A11667A11687C11757D11757911747711737451637D11687E"
8169 DATA "516D36191A3A191A38190E35591B3A191B3B19113C19113A19123A19133C"
8170 DATA "191F41192046191A44191943191241190F4119033B190339117D39117E3A"
8171 DATA "190F43190C4E190A4F190751117B5411795511775711755C117365117076"
8172 DATA "116E7851766811785F190B5F190D5B117B5B11795C11795F517A5C19095D"
8173 DATA "190B5F190873190975190B7419115A192156192253192753192852192751"
8174 DATA "19274F19274B19284A192A49192B4A19424B593B5419285359274D192A4D"
8175 DATA "592948192146191D4A191D4D191E50191F52192754591F46191944191644"
8176 DATA "19144719134A19134D191451191B52191E52591943191942191241590953"
8177 DATA "191654191854191A52591F53191E54190E58117E57190B52190F5119104F"
8178 DATA "19124819124319124159034319024419014719014C19034F19054F19064C"
8179 DATA "19074819074619044351613A11613A517B6B19006B19036C190770190974"
8180 DATA "19067619047219016D117E6B517E6F1900711901741903781A190A592179"
8181 DATA "191978191A7B19147B191075191270191970191B74191474191270591674"
8182 DATA "19147B591A7319247459207D191B79591075190C75190678190079127C02"
8183 DATA "127B04127C091A000A1A030A1A05081A16125A100E1A08111A04111A010F"
8184 DATA "127D0B127A08127806527C02127706126F11126A21126437126737127310"
8185 DATA "127906527F06127F065A100F1A08111A07181A052B127F3C127654127457"
8186 DATA "126F5A12645C12605D5A0C2B1A052B5A0540127E4012774012713D126839"
8187 DATA "126436527D461A044559417B19527E19547C1A56081A5A0819577E19547E"
8188 DATA "59527F1A53011A52021A4F021A4F021A56075A500219407E5A4F021A4601"
8189 DATA "1A60175A60191A45031A46025A59051A5C051A650C5A6B111A751D1A671E"
8190 DATA "5A5E1A1A56171A4F191A491C5A4E191A47185A45031A42055A3D0B1A3B0F"
8191 DATA "1A40135A3C101A39181A2E261A292C1A22401A1D455A21411A24441A2B48"
8192 DATA "1A344D1A394D1A42341A46295A310E1A33131A2E131A37151A38185A4136"
8193 DATA "1A464D5A3E651A38651A3A6B5A26641A35641A35705A436C1A44701A4674"
8194 DATA "1A44791A407D1A3F7F1B3C031B38035A37701A35711A31731A30741A2C74"
8195 DATA "5A394D1A345A1A335E1A2C601A23625A216D1A16691A16661A1D661A1C63"
8196 DATA "1A16635B2A041B1E041B1B051B16051B13025B15031A147F527B66126D66"
8197 DATA "126E69127369127566526F69127173137001136D0E136A1813672153742A"
8198 DATA "13712C136D2C136A26136820135420134C2813452A13412C13492313501C"
8199 DATA "13591C135C1E135E1D13681F136A1F136D2C136A2D136829136325135525"
8200 DATA "134F2C13412D536023136023535F1C135F1613691613691213641013640A"
8201 DATA "136B09136B0413660212667A126F7A126F7612697412696A126B6A126C63"
8202 DATA "125D60125D67126669126A69525B67125266124D6412476012486112485E"
8203 DATA "12465C124858124C5B12505D12575F125C61125E61536C2E13682E13662B"
8204 DATA "13602B135C2D13412D133E31133D36133F38133F3D133F42133E4813394A"
8205 DATA "133B5213405913465C13485F13506113575F135F5D13635A136556136850"
8206 DATA "136E4E137039136F37136C2D536D35136835136538135E38135C37135C35"
8207 DATA "134C35134C2D53642D13642D536436136436536B38136B4413694B13604C"
8208 DATA "13574C13434A134539135A3753585F135B5B135E56136051135551135257"
8209 DATA "134E5B13475E53465C134C5A134F57135154135150135550535A53135A53"
8210 DATA "53441513440F13470E134A0F134915134315533D56133656133352133243"
8211 DATA "133232133530133E2F133E3113383313363513363E13344B133451133753"
8212 DATA "133B53533B4913374713384313393E13393B13383A13363E133642133544"
8213 DATA "133647533D3513383A53375613255213254F132537132533132E2E132E2B"
8214 DATA "133625133D27133C2813372D132F2E132F2B132427132023131F1913251F"
8215 DATA "13252653252013292013301B13321012347F12327412327212357212387D"
8216 DATA "13380C13361B13341F133023132B25132527131A2513140E120E71120B5B"
8217 DATA "120C4F120D4612123B12192F12232312271D126A20522A1E122A1B12311B"
8218 DATA "12311F523B1F123E1A12401412410C12450C12450A12480A12480C12560D"
8219 DATA "12560B125B0B125B0D12710E526338125D4B12554912593F125D2B125F22"
8220 DATA "126922526225126225525D47125D47525D4B124E4B52444B12324B122C4C"
8221 DATA "122954122859521A5C121C53121E4E12224912274712554853201A131D15"
8222 DATA "13231613281613240B13200B131B0B131808131F0A13240B531B1413190F"
8223 DATA "131809531A0712177D12147112146A12176512185E121D5A12275912325C"
8224 DATA "12385F122D5F122E5D12325C522D5B122A5C122761122A62522762122766"
8225 DATA "12296A122B6F123171122C6D122B69122B63122D5F522B64123267123666"
8226 DATA "123B60123B6512406312416B12436412476A124865124A6A124A73124476"
8227 DATA "124174123F75123C72123872123670524872124F70124A6F524F7012506E"
8228 DATA "124A6712485D12415A12385F52425B124748124D4812465C52414912514B"
8229 DATA "524E4D12434B52444E124C4F53394C13344C133449133949533637133A37"
8230 DATA "532F54132D51132C4B132C34132E32133432532952132740132D40532640"
8231 DATA "132635132C34536D4E136850135C50134D4E13424C525243125927123E2C"
8232 DATA "123C3C12203C12212C123726125928523D2C12222C522730122B30522B37"
8233 DATA "122637522639122B3952413A12473C525344122E4312203B52283D122E40"
8234 DATA "52334012303D52353D123B40124140123A3D524642124642525444123C3C"
8235 DATA "523171122B7012246E400000"
8236 DATA "z"
