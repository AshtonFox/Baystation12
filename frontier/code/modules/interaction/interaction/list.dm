// ***************    СПИСКИ ДЛЯ РАС, КОТОРЫЕ ОТЛИЧАЮТСЯ ЗА ПРИЗНАКАМИ (Хвост, шерсть и тд.)    *************

//Лист хвостатых species
var/list/tail = list(SPECIES_TAJ,
	SPECIES_RESOMI,
	SPECIES_VULP,
//	SPECIES_ZORREN_HIGH,
//	SPECIES_ZORREN_FLAT,
	SPECIES_SERGAL
	)

//List of fingering for humanable races
var/list/fing = list(SPECIES_UNATHI,
//	SPECIES_XENOHYBRID,
	SPECIES_HUMAN,
//	SPECIES_HUMAN_VATBORN,
//	SPECIES_RAPALA,
//	SPECIES_VASILISSAN,
	SPECIES_AKULA,
//	SPECIES_PROTEAN,
//	SPECIES_ALRAUNE
)

// List of fingering for fluffy races
var/list/fing_f = list(SPECIES_TAJ,
//	SPECIES_XENOCHIMERA,
	SPECIES_VULP,
	SPECIES_SERGAL,
//	SPECIES_ZORREN_HIGH,
//	SPECIES_ZORREN_FLAT
)


// ***************    СПИСКИ ДЛЯ РАС, КОТОРЫЕ ОТЛИЧАЮТСЯ ЗА ФОРМОЙ РТА  *************
//Человекоподобный(Человек, скрелл и тд.)
var/list/mouth_humanabe = list(
	SPECIES_HUMAN,
//	SPECIES_HUMAN_VATBORN,
//	SPECIES_RAPALA,
//	SPECIES_VASILISSAN,
//	SPECIES_PROTEAN,
	SPECIES_SKRELL
	)

//Пасть(Акула и тд.)
var/list/mouth_fall = list(
	SPECIES_UNATHI,
	SPECIES_AKULA,
	SPECIES_SERGAL,
	SPECIES_RESOMI,
//	SPECIES_XENOHYBRID
)

//Морда (Кошечки, собачки и тд.)
var/list/mouth_muzzle = list(
	SPECIES_TAJ,
	SPECIES_VULP,
//	SPECIES_ZORREN_HIGH,
//	SPECIES_ZORREN_FLAT,
//	SPECIES_XENOCHIMERA
)

//Клюв(Воксы, вороны, совы и тд.)
var/list/mouth_beak = list(
	SPECIES_VOX,
//	SPECIES_NEVREAN
)

// ***************    СПИСКИ ДЛЯ РАС, КОТОРЫЕ ОТЛИЧАЮТСЯ... попкой  *************
//Человекоподобный(Человек, скрелл и тд.)
var/list/anal_h = list(
	SPECIES_HUMAN,
	SPECIES_SKRELL,
//	SPECIES_HUMAN_VATBORN,
//	SPECIES_RAPALA,
//	SPECIES_VASILISSAN,
	SPECIES_AKULA,
	SPECIES_SERGAL,
//	SPECIES_NEVREAN,
//	SPECIES_PROTEAN,
//	SPECIES_ALRAUNE
)

//Пушистая
var/list/anal_f = list(
	SPECIES_TAJ,
//	SPECIES_XENOCHIMERA,
	SPECIES_VULP,
//	SPECIES_ZORREN_HIGH,
//	SPECIES_ZORREN_FLAT
)

//Чешуйчатая
var/list/anal_t = list(
	SPECIES_UNATHI,
//	SPECIES_XENOHYBRID
)
//Клоака
var/list/anal_c = list(
	SPECIES_RESOMI,
	SPECIES_VOX
)
// ***************    СПИСКИ ДЛЯ РАС, КОТОРЫЕ ОТЛИЧАЮТСЯ... пенисом  *************

//Обычный
var/list/penis_humanable = list(
	SPECIES_HUMAN,
	SPECIES_SKRELL,
//	SPECIES_HUMAN_VATBORN,
//	SPECIES_RAPALA,
//	SPECIES_VASILISSAN,
	SPECIES_AKULA,
	SPECIES_SERGAL,
	SPECIES_VOX,
//	SPECIES_NEVREAN,
//	SPECIES_XENOHYBRID,
//	SPECIES_ALRAUNE,
	SPECIES_RESOMI
)

//Покрытый шипами
var/list/penis_spike = list(
	SPECIES_TAJ,
//	SPECIES_SPECIES_XENOCHIMERA
)

//Узловатый
var/list/penis_knot = list(
	SPECIES_VULP,
//	SPECIES_ZORREN_HIGH,
//	SPECIES_ZORREN_FLAT
)

//Двойной
var/list/penis_double = list(
	SPECIES_UNATHI
)

// ***************    СПИСКИ ДЛЯ РАС, ИЗДАЮЩИХ РАЗНЫЕ ГОРТАННЫЕ ЗВУКИ УДОВОЛЬСТВИЯ    *************

// Стонущие species
var/list/moan = list(
	SPECIES_HUMAN,
	SPECIES_SKRELL,
//	SPECIES_HUMAN_VATBORN,
//	SPECIES_RAPALA,
//	SPECIES_VASILISSAN,
	SPECIES_AKULA,
	SPECIES_PROMETHEAN,
	SPECIES_TAJ,
	SPECIES_VULP,
	SPECIES_SERGAL,
//	SPECIES_ZORREN_HIGH,
//	SPECIES_ZORREN_FLAT,
//	SPECIES_ALRAUNE
)

// Мурлыкающие species
var/list/purr = list(SPECIES_TAJ)

// Скулящие species
var/list/whine = list(SPECIES_VULP,
	SPECIES_SERGAL,
//	SPECIES_ZORREN_HIGH,
//	SPECIES_ZORREN_FLAT
)


// Шипящие species
var/list/hiss = (SPECIES_UNATHI)

// Пищящие species
var/list/squeak = list(
SPECIES_RESOMI,
	SPECIES_VOX,
//	SPECIES_RAPALA
	)
