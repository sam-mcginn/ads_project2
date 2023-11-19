library ads;
use ads.ads_fixed.all;
use ads.ads_complex_pkg.all;

package seed_table_pkg is
	-- array type for seed values
	type seed_rom_type is array (natural range<>) of ads_complex;
	constant seed_rom: seed_rom_type := (
		-- SEED VALUES:
		0 => ads_cmplx(to_ads_sfixed(0.0), to_ads_sfixed(0.0)),
		1 => ads_cmplx(to_ads_sfixed(-0.0004934396342684), to_ads_sfixed(0.03141075907812829)),
		2 => ads_cmplx(to_ads_sfixed(-0.001973271571728441), to_ads_sfixed(0.06279051952931337)),
		3 => ads_cmplx(to_ads_sfixed(-0.004438035396920004), to_ads_sfixed(0.09410831331851431)),
		4 => ads_cmplx(to_ads_sfixed(-0.007885298685522124), to_ads_sfixed(0.12533323356430426)),
		5 => ads_cmplx(to_ads_sfixed(-0.01231165940486223), to_ads_sfixed(0.15643446504023087)),
		6 => ads_cmplx(to_ads_sfixed(-0.01771274927131128), to_ads_sfixed(0.1873813145857246)),
		7 => ads_cmplx(to_ads_sfixed(-0.024083238061252565), to_ads_sfixed(0.21814324139654254)),
		8 => ads_cmplx(to_ads_sfixed(-0.031416838871368924), to_ads_sfixed(0.2486898871648548)),
		9 => ads_cmplx(to_ads_sfixed(-0.039706314323056935), to_ads_sfixed(0.2789911060392293)),
		10 => ads_cmplx(to_ads_sfixed(-0.04894348370484647), to_ads_sfixed(0.3090169943749474)),
		11 => ads_cmplx(to_ads_sfixed(-0.059119231045774545), to_ads_sfixed(0.33873792024529137)),
		12 => ads_cmplx(to_ads_sfixed(-0.07022351411174854), to_ads_sfixed(0.3681245526846779)),
		13 => ads_cmplx(to_ads_sfixed(-0.08224537431601886), to_ads_sfixed(0.3971478906347806)),
		14 => ads_cmplx(to_ads_sfixed(-0.09517294753398042), to_ads_sfixed(0.42577929156507266)),
		15 => ads_cmplx(to_ads_sfixed(-0.1089934758116321), to_ads_sfixed(0.45399049973954675)),
		16 => ads_cmplx(to_ads_sfixed(-0.12369331995613642), to_ads_sfixed(0.4817536741017153)),
		17 => ads_cmplx(to_ads_sfixed(-0.13925797299605636), to_ads_sfixed(0.5090414157503713)),
		18 => ads_cmplx(to_ads_sfixed(-0.15567207449798492), to_ads_sfixed(0.5358267949789967)),
		19 => ads_cmplx(to_ads_sfixed(-0.17291942572543817), to_ads_sfixed(0.5620833778521306)),
		20 => ads_cmplx(to_ads_sfixed(-0.19098300562505255), to_ads_sfixed(0.5877852522924731)),
		21 => ads_cmplx(to_ads_sfixed(-0.2098449876243097), to_ads_sfixed(0.6129070536529765)),
		22 => ads_cmplx(to_ads_sfixed(-0.22948675722421075), to_ads_sfixed(0.6374239897486896)),
		23 => ads_cmplx(to_ads_sfixed(-0.2498889303695404), to_ads_sfixed(0.6613118653236518)),
		24 => ads_cmplx(to_ads_sfixed(-0.27103137257858845), to_ads_sfixed(0.6845471059286886)),
		25 => ads_cmplx(to_ads_sfixed(-0.2928932188134524), to_ads_sfixed(0.7071067811865475)),
		26 => ads_cmplx(to_ads_sfixed(-0.3154528940713114), to_ads_sfixed(0.7289686274214116)),
		27 => ads_cmplx(to_ads_sfixed(-0.33868813467634806), to_ads_sfixed(0.7501110696304595)),
		28 => ads_cmplx(to_ads_sfixed(-0.36257601025131025), to_ads_sfixed(0.7705132427757893)),
		29 => ads_cmplx(to_ads_sfixed(-0.3870929463470235), to_ads_sfixed(0.7901550123756904)),
		30 => ads_cmplx(to_ads_sfixed(-0.41221474770752675), to_ads_sfixed(0.8090169943749473)),
		31 => ads_cmplx(to_ads_sfixed(-0.4379166221478693), to_ads_sfixed(0.8270805742745617)),
		32 => ads_cmplx(to_ads_sfixed(-0.46417320502100345), to_ads_sfixed(0.8443279255020151)),
		33 => ads_cmplx(to_ads_sfixed(-0.4909585842496288), to_ads_sfixed(0.8607420270039436)),
		34 => ads_cmplx(to_ads_sfixed(-0.5182463258982848), to_ads_sfixed(0.8763066800438637)),
		35 => ads_cmplx(to_ads_sfixed(-0.5460095002604533), to_ads_sfixed(0.8910065241883678)),
		36 => ads_cmplx(to_ads_sfixed(-0.5742207084349273), to_ads_sfixed(0.9048270524660196)),
		37 => ads_cmplx(to_ads_sfixed(-0.6028521093652195), to_ads_sfixed(0.9177546256839811)),
		38 => ads_cmplx(to_ads_sfixed(-0.6318754473153219), to_ads_sfixed(0.9297764858882513)),
		39 => ads_cmplx(to_ads_sfixed(-0.6612620797547085), to_ads_sfixed(0.9408807689542255)),
		40 => ads_cmplx(to_ads_sfixed(-0.6909830056250525), to_ads_sfixed(0.9510565162951535)),
		41 => ads_cmplx(to_ads_sfixed(-0.7210088939607705), to_ads_sfixed(0.960293685676943)),
		42 => ads_cmplx(to_ads_sfixed(-0.7513101128351453), to_ads_sfixed(0.9685831611286311)),
		43 => ads_cmplx(to_ads_sfixed(-0.7818567586034573), to_ads_sfixed(0.9759167619387473)),
		44 => ads_cmplx(to_ads_sfixed(-0.8126186854142753), to_ads_sfixed(0.9822872507286886)),
		45 => ads_cmplx(to_ads_sfixed(-0.843565534959769), to_ads_sfixed(0.9876883405951378)),
		46 => ads_cmplx(to_ads_sfixed(-0.8746667664356955), to_ads_sfixed(0.9921147013144778)),
		47 => ads_cmplx(to_ads_sfixed(-0.9058916866814857), to_ads_sfixed(0.99556196460308)),
		48 => ads_cmplx(to_ads_sfixed(-0.9372094804706865), to_ads_sfixed(0.9980267284282716)),
		49 => ads_cmplx(to_ads_sfixed(-0.9685892409218716), to_ads_sfixed(0.9995065603657316)),
		50 => ads_cmplx(to_ads_sfixed(-0.9999999999999999), to_ads_sfixed(1.0)),
		51 => ads_cmplx(to_ads_sfixed(-1.0314107590781283), to_ads_sfixed(0.9995065603657316)),
		52 => ads_cmplx(to_ads_sfixed(-1.0627905195293135), to_ads_sfixed(0.9980267284282716)),
		53 => ads_cmplx(to_ads_sfixed(-1.0941083133185143), to_ads_sfixed(0.99556196460308)),
		54 => ads_cmplx(to_ads_sfixed(-1.1253332335643043), to_ads_sfixed(0.9921147013144779)),
		55 => ads_cmplx(to_ads_sfixed(-1.1564344650402307), to_ads_sfixed(0.9876883405951378)),
		56 => ads_cmplx(to_ads_sfixed(-1.1873813145857246), to_ads_sfixed(0.9822872507286887)),
		57 => ads_cmplx(to_ads_sfixed(-1.2181432413965423), to_ads_sfixed(0.9759167619387474)),
		58 => ads_cmplx(to_ads_sfixed(-1.2486898871648549), to_ads_sfixed(0.9685831611286311)),
		59 => ads_cmplx(to_ads_sfixed(-1.2789911060392292), to_ads_sfixed(0.9602936856769431)),
		60 => ads_cmplx(to_ads_sfixed(-1.309016994374947), to_ads_sfixed(0.9510565162951536)),
		61 => ads_cmplx(to_ads_sfixed(-1.3387379202452914), to_ads_sfixed(0.9408807689542255)),
		62 => ads_cmplx(to_ads_sfixed(-1.3681245526846777), to_ads_sfixed(0.9297764858882515)),
		63 => ads_cmplx(to_ads_sfixed(-1.3971478906347807), to_ads_sfixed(0.9177546256839811)),
		64 => ads_cmplx(to_ads_sfixed(-1.4257792915650727), to_ads_sfixed(0.9048270524660195)),
		65 => ads_cmplx(to_ads_sfixed(-1.4539904997395467), to_ads_sfixed(0.8910065241883679)),
		66 => ads_cmplx(to_ads_sfixed(-1.4817536741017154), to_ads_sfixed(0.8763066800438635)),
		67 => ads_cmplx(to_ads_sfixed(-1.5090414157503713), to_ads_sfixed(0.8607420270039436)),
		68 => ads_cmplx(to_ads_sfixed(-1.535826794978997), to_ads_sfixed(0.844327925502015)),
		69 => ads_cmplx(to_ads_sfixed(-1.5620833778521308), to_ads_sfixed(0.8270805742745617)),
		70 => ads_cmplx(to_ads_sfixed(-1.587785252292473), to_ads_sfixed(0.8090169943749475)),
		71 => ads_cmplx(to_ads_sfixed(-1.6129070536529766), to_ads_sfixed(0.7901550123756903)),
		72 => ads_cmplx(to_ads_sfixed(-1.6374239897486897), to_ads_sfixed(0.7705132427757893)),
		73 => ads_cmplx(to_ads_sfixed(-1.6613118653236518), to_ads_sfixed(0.7501110696304597)),
		74 => ads_cmplx(to_ads_sfixed(-1.6845471059286887), to_ads_sfixed(0.7289686274214114)),
		75 => ads_cmplx(to_ads_sfixed(-1.7071067811865475), to_ads_sfixed(0.7071067811865476)),
		76 => ads_cmplx(to_ads_sfixed(-1.7289686274214113), to_ads_sfixed(0.6845471059286888)),
		77 => ads_cmplx(to_ads_sfixed(-1.7501110696304596), to_ads_sfixed(0.6613118653236518)),
		78 => ads_cmplx(to_ads_sfixed(-1.770513242775789), to_ads_sfixed(0.6374239897486899)),
		79 => ads_cmplx(to_ads_sfixed(-1.7901550123756904), to_ads_sfixed(0.6129070536529764)),
		80 => ads_cmplx(to_ads_sfixed(-1.8090169943749475), to_ads_sfixed(0.5877852522924732)),
		81 => ads_cmplx(to_ads_sfixed(-1.8270805742745617), to_ads_sfixed(0.5620833778521308)),
		82 => ads_cmplx(to_ads_sfixed(-1.8443279255020149), to_ads_sfixed(0.535826794978997)),
		83 => ads_cmplx(to_ads_sfixed(-1.8607420270039436), to_ads_sfixed(0.5090414157503711)),
		84 => ads_cmplx(to_ads_sfixed(-1.8763066800438635), to_ads_sfixed(0.4817536741017152)),
		85 => ads_cmplx(to_ads_sfixed(-1.8910065241883678), to_ads_sfixed(0.45399049973954686)),
		86 => ads_cmplx(to_ads_sfixed(-1.9048270524660194), to_ads_sfixed(0.4257792915650729)),
		87 => ads_cmplx(to_ads_sfixed(-1.917754625683981), to_ads_sfixed(0.39714789063478106)),
		88 => ads_cmplx(to_ads_sfixed(-1.9297764858882513), to_ads_sfixed(0.36812455268467814)),
		89 => ads_cmplx(to_ads_sfixed(-1.9408807689542256), to_ads_sfixed(0.3387379202452913)),
		90 => ads_cmplx(to_ads_sfixed(-1.9510565162951536), to_ads_sfixed(0.3090169943749475)),
		91 => ads_cmplx(to_ads_sfixed(-1.9602936856769428), to_ads_sfixed(0.27899110603922955)),
		92 => ads_cmplx(to_ads_sfixed(-1.968583161128631), to_ads_sfixed(0.24868988716485524)),
		93 => ads_cmplx(to_ads_sfixed(-1.9759167619387474), to_ads_sfixed(0.21814324139654276)),
		94 => ads_cmplx(to_ads_sfixed(-1.9822872507286888), to_ads_sfixed(0.18738131458572457)),
		95 => ads_cmplx(to_ads_sfixed(-1.9876883405951378), to_ads_sfixed(0.15643446504023098)),
		96 => ads_cmplx(to_ads_sfixed(-1.9921147013144778), to_ads_sfixed(0.12533323356430454)),
		97 => ads_cmplx(to_ads_sfixed(-1.99556196460308), to_ads_sfixed(0.09410831331851435)),
		98 => ads_cmplx(to_ads_sfixed(-1.9980267284282716), to_ads_sfixed(0.06279051952931358)),
		99 => ads_cmplx(to_ads_sfixed(-1.9995065603657316), to_ads_sfixed(0.031410759078128236)),
		100 => ads_cmplx(to_ads_sfixed(-2.0), to_ads_sfixed(0.0)),
		101 => ads_cmplx(to_ads_sfixed(-1.9995065603657316), to_ads_sfixed(-0.031410759078127994)),
		102 => ads_cmplx(to_ads_sfixed(-1.9980267284282716), to_ads_sfixed(-0.06279051952931335)),
		103 => ads_cmplx(to_ads_sfixed(-1.99556196460308), to_ads_sfixed(-0.0941083133185141)),
		104 => ads_cmplx(to_ads_sfixed(-1.992114701314478), to_ads_sfixed(-0.12533323356430429)),
		105 => ads_cmplx(to_ads_sfixed(-1.9876883405951378), to_ads_sfixed(-0.15643446504023073)),
		106 => ads_cmplx(to_ads_sfixed(-1.9822872507286886), to_ads_sfixed(-0.18738131458572477)),
		107 => ads_cmplx(to_ads_sfixed(-1.9759167619387474), to_ads_sfixed(-0.2181432413965425)),
		108 => ads_cmplx(to_ads_sfixed(-1.968583161128631), to_ads_sfixed(-0.24868988716485457)),
		109 => ads_cmplx(to_ads_sfixed(-1.9602936856769433), to_ads_sfixed(-0.2789911060392289)),
		110 => ads_cmplx(to_ads_sfixed(-1.9510565162951536), to_ads_sfixed(-0.3090169943749473)),
		111 => ads_cmplx(to_ads_sfixed(-1.9408807689542256), to_ads_sfixed(-0.3387379202452915)),
		112 => ads_cmplx(to_ads_sfixed(-1.9297764858882513), to_ads_sfixed(-0.3681245526846779)),
		113 => ads_cmplx(to_ads_sfixed(-1.9177546256839813), to_ads_sfixed(-0.3971478906347804)),
		114 => ads_cmplx(to_ads_sfixed(-1.9048270524660196), to_ads_sfixed(-0.42577929156507227)),
		115 => ads_cmplx(to_ads_sfixed(-1.8910065241883678), to_ads_sfixed(-0.4539904997395471)),
		116 => ads_cmplx(to_ads_sfixed(-1.8763066800438635), to_ads_sfixed(-0.4817536741017154)),
		117 => ads_cmplx(to_ads_sfixed(-1.8607420270039436), to_ads_sfixed(-0.5090414157503712)),
		118 => ads_cmplx(to_ads_sfixed(-1.8443279255020153), to_ads_sfixed(-0.5358267949789964)),
		119 => ads_cmplx(to_ads_sfixed(-1.8270805742745622), to_ads_sfixed(-0.5620833778521303)),
		120 => ads_cmplx(to_ads_sfixed(-1.809016994374948), to_ads_sfixed(-0.5877852522924727)),
		121 => ads_cmplx(to_ads_sfixed(-1.7901550123756902), to_ads_sfixed(-0.6129070536529766)),
		122 => ads_cmplx(to_ads_sfixed(-1.7705132427757893), to_ads_sfixed(-0.6374239897486896)),
		123 => ads_cmplx(to_ads_sfixed(-1.7501110696304596), to_ads_sfixed(-0.6613118653236517)),
		124 => ads_cmplx(to_ads_sfixed(-1.7289686274214118), to_ads_sfixed(-0.6845471059286884)),
		125 => ads_cmplx(to_ads_sfixed(-1.707106781186548), to_ads_sfixed(-0.7071067811865471)),
		126 => ads_cmplx(to_ads_sfixed(-1.6845471059286887), to_ads_sfixed(-0.7289686274214116)),
		127 => ads_cmplx(to_ads_sfixed(-1.6613118653236518), to_ads_sfixed(-0.7501110696304595)),
		128 => ads_cmplx(to_ads_sfixed(-1.6374239897486895), to_ads_sfixed(-0.7705132427757894)),
		129 => ads_cmplx(to_ads_sfixed(-1.6129070536529766), to_ads_sfixed(-0.7901550123756904)),
		130 => ads_cmplx(to_ads_sfixed(-1.5877852522924734), to_ads_sfixed(-0.8090169943749473)),
		131 => ads_cmplx(to_ads_sfixed(-1.5620833778521308), to_ads_sfixed(-0.8270805742745616)),
		132 => ads_cmplx(to_ads_sfixed(-1.5358267949789963), to_ads_sfixed(-0.8443279255020153)),
		133 => ads_cmplx(to_ads_sfixed(-1.509041415750371), to_ads_sfixed(-0.8607420270039438)),
		134 => ads_cmplx(to_ads_sfixed(-1.4817536741017152), to_ads_sfixed(-0.8763066800438636)),
		135 => ads_cmplx(to_ads_sfixed(-1.453990499739547), to_ads_sfixed(-0.8910065241883678)),
		136 => ads_cmplx(to_ads_sfixed(-1.4257792915650722), to_ads_sfixed(-0.9048270524660198)),
		137 => ads_cmplx(to_ads_sfixed(-1.3971478906347803), to_ads_sfixed(-0.9177546256839813)),
		138 => ads_cmplx(to_ads_sfixed(-1.368124552684678), to_ads_sfixed(-0.9297764858882515)),
		139 => ads_cmplx(to_ads_sfixed(-1.3387379202452914), to_ads_sfixed(-0.9408807689542255)),
		140 => ads_cmplx(to_ads_sfixed(-1.3090169943749475), to_ads_sfixed(-0.9510565162951535)),
		141 => ads_cmplx(to_ads_sfixed(-1.2789911060392296), to_ads_sfixed(-0.960293685676943)),
		142 => ads_cmplx(to_ads_sfixed(-1.2486898871648544), to_ads_sfixed(-0.9685831611286312)),
		143 => ads_cmplx(to_ads_sfixed(-1.2181432413965423), to_ads_sfixed(-0.9759167619387474)),
		144 => ads_cmplx(to_ads_sfixed(-1.1873813145857246), to_ads_sfixed(-0.9822872507286887)),
		145 => ads_cmplx(to_ads_sfixed(-1.156434465040231), to_ads_sfixed(-0.9876883405951377)),
		146 => ads_cmplx(to_ads_sfixed(-1.1253332335643047), to_ads_sfixed(-0.9921147013144778)),
		147 => ads_cmplx(to_ads_sfixed(-1.0941083133185139), to_ads_sfixed(-0.99556196460308)),
		148 => ads_cmplx(to_ads_sfixed(-1.0627905195293132), to_ads_sfixed(-0.9980267284282716)),
		149 => ads_cmplx(to_ads_sfixed(-1.0314107590781283), to_ads_sfixed(-0.9995065603657316)),
		150 => ads_cmplx(to_ads_sfixed(-1.0000000000000002), to_ads_sfixed(-1.0)),
		151 => ads_cmplx(to_ads_sfixed(-0.968589240921872), to_ads_sfixed(-0.9995065603657316)),
		152 => ads_cmplx(to_ads_sfixed(-0.9372094804706872), to_ads_sfixed(-0.9980267284282716)),
		153 => ads_cmplx(to_ads_sfixed(-0.9058916866814855), to_ads_sfixed(-0.99556196460308)),
		154 => ads_cmplx(to_ads_sfixed(-0.8746667664356957), to_ads_sfixed(-0.9921147013144779)),
		155 => ads_cmplx(to_ads_sfixed(-0.8435655349597693), to_ads_sfixed(-0.9876883405951378)),
		156 => ads_cmplx(to_ads_sfixed(-0.8126186854142757), to_ads_sfixed(-0.9822872507286887)),
		157 => ads_cmplx(to_ads_sfixed(-0.7818567586034579), to_ads_sfixed(-0.9759167619387475)),
		158 => ads_cmplx(to_ads_sfixed(-0.751310112835145), to_ads_sfixed(-0.9685831611286311)),
		159 => ads_cmplx(to_ads_sfixed(-0.7210088939607708), to_ads_sfixed(-0.9602936856769431)),
		160 => ads_cmplx(to_ads_sfixed(-0.6909830056250528), to_ads_sfixed(-0.9510565162951536)),
		161 => ads_cmplx(to_ads_sfixed(-0.661262079754709), to_ads_sfixed(-0.9408807689542256)),
		162 => ads_cmplx(to_ads_sfixed(-0.6318754473153225), to_ads_sfixed(-0.9297764858882516)),
		163 => ads_cmplx(to_ads_sfixed(-0.60285210936522), to_ads_sfixed(-0.9177546256839815)),
		164 => ads_cmplx(to_ads_sfixed(-0.5742207084349282), to_ads_sfixed(-0.9048270524660199)),
		165 => ads_cmplx(to_ads_sfixed(-0.5460095002604541), to_ads_sfixed(-0.8910065241883683)),
		166 => ads_cmplx(to_ads_sfixed(-0.5182463258982843), to_ads_sfixed(-0.8763066800438634)),
		167 => ads_cmplx(to_ads_sfixed(-0.49095858424962846), to_ads_sfixed(-0.8607420270039434)),
		168 => ads_cmplx(to_ads_sfixed(-0.46417320502100323), to_ads_sfixed(-0.844327925502015)),
		169 => ads_cmplx(to_ads_sfixed(-0.4379166221478694), to_ads_sfixed(-0.8270805742745618)),
		170 => ads_cmplx(to_ads_sfixed(-0.4122147477075271), to_ads_sfixed(-0.8090169943749476)),
		171 => ads_cmplx(to_ads_sfixed(-0.38709294634702385), to_ads_sfixed(-0.7901550123756906)),
		172 => ads_cmplx(to_ads_sfixed(-0.3625760102513107), to_ads_sfixed(-0.7705132427757896)),
		173 => ads_cmplx(to_ads_sfixed(-0.33868813467634873), to_ads_sfixed(-0.75011106963046)),
		174 => ads_cmplx(to_ads_sfixed(-0.31545289407131205), to_ads_sfixed(-0.7289686274214121)),
		175 => ads_cmplx(to_ads_sfixed(-0.2928932188134532), to_ads_sfixed(-0.7071067811865483)),
		176 => ads_cmplx(to_ads_sfixed(-0.2710313725785888), to_ads_sfixed(-0.684547105928689)),
		177 => ads_cmplx(to_ads_sfixed(-0.2498889303695403), to_ads_sfixed(-0.6613118653236516)),
		178 => ads_cmplx(to_ads_sfixed(-0.22948675722421064), to_ads_sfixed(-0.6374239897486896)),
		179 => ads_cmplx(to_ads_sfixed(-0.2098449876243097), to_ads_sfixed(-0.6129070536529765)),
		180 => ads_cmplx(to_ads_sfixed(-0.19098300562505266), to_ads_sfixed(-0.5877852522924734)),
		181 => ads_cmplx(to_ads_sfixed(-0.1729194257254384), to_ads_sfixed(-0.5620833778521309)),
		182 => ads_cmplx(to_ads_sfixed(-0.15567207449798526), to_ads_sfixed(-0.5358267949789971)),
		183 => ads_cmplx(to_ads_sfixed(-0.1392579729960568), to_ads_sfixed(-0.509041415750372)),
		184 => ads_cmplx(to_ads_sfixed(-0.12369331995613686), to_ads_sfixed(-0.4817536741017161)),
		185 => ads_cmplx(to_ads_sfixed(-0.10899347581163221), to_ads_sfixed(-0.45399049973954697)),
		186 => ads_cmplx(to_ads_sfixed(-0.09517294753398065), to_ads_sfixed(-0.425779291565073)),
		187 => ads_cmplx(to_ads_sfixed(-0.08224537431601875), to_ads_sfixed(-0.39714789063478034)),
		188 => ads_cmplx(to_ads_sfixed(-0.07022351411174854), to_ads_sfixed(-0.36812455268467786)),
		189 => ads_cmplx(to_ads_sfixed(-0.059119231045774545), to_ads_sfixed(-0.3387379202452914)),
		190 => ads_cmplx(to_ads_sfixed(-0.04894348370484647), to_ads_sfixed(-0.3090169943749477)),
		191 => ads_cmplx(to_ads_sfixed(-0.039706314323057046), to_ads_sfixed(-0.27899110603922966)),
		192 => ads_cmplx(to_ads_sfixed(-0.031416838871369035), to_ads_sfixed(-0.24868988716485535)),
		193 => ads_cmplx(to_ads_sfixed(-0.024083238061252787), to_ads_sfixed(-0.2181432413965433)),
		194 => ads_cmplx(to_ads_sfixed(-0.01771274927131128), to_ads_sfixed(-0.18738131458572468)),
		195 => ads_cmplx(to_ads_sfixed(-0.01231165940486234), to_ads_sfixed(-0.15643446504023112)),
		196 => ads_cmplx(to_ads_sfixed(-0.007885298685522235), to_ads_sfixed(-0.12533323356430465)),
		197 => ads_cmplx(to_ads_sfixed(-0.004438035396920004), to_ads_sfixed(-0.09410831331851491)),
		198 => ads_cmplx(to_ads_sfixed(-0.001973271571728441), to_ads_sfixed(-0.06279051952931326)),
		199 => ads_cmplx(to_ads_sfixed(-0.0004934396342684), to_ads_sfixed(-0.03141075907812836))
	);
	
	-- number of seed values
	constant seed_rom_total: natural := seed_rom'length;
	
	-- range of indices in seed_rom table
	subtype seed_index_type is natural range 0 to seed_rom_total-1;
	
	function get_next_seed_index (index: in seed_index_type) 
		return seed_index_type;
end package seed_table_pkg;

package body seed_table_pkg is 
	-- Get next seed index (changed from template to increment index inside fn.
	function get_next_seed_index (index: in seed_index_type)
		return seed_index_type
	is
		--variable curr_index: seed_index_type := 0;
	begin
		if index = index'high then
			return 0;
		end if;
		return index+1;
	end function get_next_seed_index;
end package body seed_table_pkg;