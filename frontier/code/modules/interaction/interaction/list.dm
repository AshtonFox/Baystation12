// ***************    ������ ��� ���, ������� ���������� �� ���������� (�����, ������ � ��.)    *************

//���� ��������� species
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


// ***************    ������ ��� ���, ������� ���������� �� ������ ���  *************
//����������������(�������, ������ � ��.)
var/list/mouth_humanabe = list(
	SPECIES_HUMAN,
//	SPECIES_HUMAN_VATBORN,
//	SPECIES_RAPALA,
//	SPECIES_VASILISSAN,
//	SPECIES_PROTEAN,
	SPECIES_SKRELL
	)

//�����(����� � ��.)
var/list/mouth_fall = list(
	SPECIES_UNATHI,
	SPECIES_AKULA,
	SPECIES_SERGAL,
	SPECIES_RESOMI,
//	SPECIES_XENOHYBRID
)

//����� (�������, ������� � ��.)
var/list/mouth_muzzle = list(
	SPECIES_TAJ,
	SPECIES_VULP,
//	SPECIES_ZORREN_HIGH,
//	SPECIES_ZORREN_FLAT,
//	SPECIES_XENOCHIMERA
)

//����(�����, ������, ���� � ��.)
var/list/mouth_beak = list(
	SPECIES_VOX,
//	SPECIES_NEVREAN
)

// ***************    ������ ��� ���, ������� ����������... ������  *************
//����������������(�������, ������ � ��.)
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

//��������
var/list/anal_f = list(
	SPECIES_TAJ,
//	SPECIES_XENOCHIMERA,
	SPECIES_VULP,
//	SPECIES_ZORREN_HIGH,
//	SPECIES_ZORREN_FLAT
)

//����������
var/list/anal_t = list(
	SPECIES_UNATHI,
//	SPECIES_XENOHYBRID
)
//������
var/list/anal_c = list(
	SPECIES_RESOMI,
	SPECIES_VOX
)
// ***************    ������ ��� ���, ������� ����������... �������  *************

//�������
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

//�������� ������
var/list/penis_spike = list(
	SPECIES_TAJ,
//	SPECIES_SPECIES_XENOCHIMERA
)

//���������
var/list/penis_knot = list(
	SPECIES_VULP,
//	SPECIES_ZORREN_HIGH,
//	SPECIES_ZORREN_FLAT
)

//�������
var/list/penis_double = list(
	SPECIES_UNATHI
)

// ***************    ������ ��� ���, �������� ������ ��������� ����� ������������    *************

// �������� species
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

// ����������� species
var/list/purr = list(SPECIES_TAJ)

// �������� species
var/list/whine = list(SPECIES_VULP,
	SPECIES_SERGAL,
//	SPECIES_ZORREN_HIGH,
//	SPECIES_ZORREN_FLAT
)


// ������� species
var/list/hiss = (SPECIES_UNATHI)

// ������� species
var/list/squeak = list(
SPECIES_RESOMI,
	SPECIES_VOX,
//	SPECIES_RAPALA
	)
