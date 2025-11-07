import 'dart:math';
import '../models/exercise.dart';

final List<Exercise> seedExercises = [
  Exercise(
    id: 'ex_${1001}',
    title: 'Отжимания',
    muscle: MuscleGroup.chest,
    equipment: Equipment.bodyweight,
    difficulty: Difficulty.beginner,
    description:
    'Ладони под плечами, корпус — прямая линия. Опускание до угла ~90° в локтях, локти под 30–45° к корпусу. Пресс/ягодицы в тонусе. Выдох на подъёме.',
    createdAt: DateTime.now().subtract(const Duration(days: 8)),
  ),
  Exercise(
    id: 'ex_${1002}',
    title: 'Жим штанги лёжа',
    muscle: MuscleGroup.chest,
    equipment: Equipment.barbell,
    difficulty: Difficulty.intermediate,
    description:
    'Лопатки сведены, стопы в пол. Опускайте штангу к нижней части груди, предплечья вертикальны. Касание без отскока, выжимайте по той же траектории.',
    createdAt: DateTime.now().subtract(const Duration(days: 6)),
  ),
  Exercise(
    id: 'ex_${1003}',
    title: 'Жим гантелей лёжа',
    muscle: MuscleGroup.chest,
    equipment: Equipment.dumbbell,
    difficulty: Difficulty.intermediate,
    description:
    'Нейтральная спина, лёгкий прогиб. Движение по дуге, локти слегка ниже уровня плеч. Контроль амплитуды, без соприкосновения гантелей вверху.',
    createdAt: DateTime.now().subtract(const Duration(days: 10)),
  ),
  Exercise(
    id: 'ex_${1004}',
    title: 'Сведение гантелей лёжа',
    muscle: MuscleGroup.chest,
    equipment: Equipment.dumbbell,
    difficulty: Difficulty.beginner,
    description:
    'Мягкие локти, движение из плечевого сустава. Чувствуйте растяжение в нижней точке, не опускайте локти слишком низко. Подъём — сведение по дуге.',
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
  ),

  // Спина
  Exercise(
    id: 'ex_${1005}',
    title: 'Становая тяга',
    muscle: MuscleGroup.back,
    equipment: Equipment.barbell,
    difficulty: Difficulty.advanced,
    description:
    'Штанга над серединой стопы, спина нейтральна. Старт ногами, штанга скользит вдоль бёдер. Таз и плечи поднимаются синхронно. Опускайте контролируемо.',
    createdAt: DateTime.now().subtract(const Duration(days: 11)),
  ),
  Exercise(
    id: 'ex_${1006}',
    title: 'Тяга верхнего блока',
    muscle: MuscleGroup.back,
    equipment: Equipment.machine,
    difficulty: Difficulty.beginner,
    description:
    'Грудь вперёд, лопатки опущены. Тяните гриф к верхней части груди, локти вниз-назад. Пауза внизу со сведением лопаток, возврат плавно.',
    createdAt: DateTime.now().subtract(const Duration(days: 4)),
  ),
  Exercise(
    id: 'ex_${1007}',
    title: 'Тяга гантели в наклоне',
    muscle: MuscleGroup.back,
    equipment: Equipment.dumbbell,
    difficulty: Difficulty.intermediate,
    description:
    'Корпус наклонён 30–45°, спина нейтральна. Тяните локтём к тазу без разворота корпуса. Пауза вверху, медленное опускание.',
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
  ),
  Exercise(
    id: 'ex_${1008}',
    title: 'Тяга штанги в наклоне',
    muscle: MuscleGroup.back,
    equipment: Equipment.barbell,
    difficulty: Difficulty.intermediate,
    description:
    'Стабильная поясница, угол наклона туловища устойчивый. Тяните штангу к нижней части живота, локти вдоль корпуса. Без рывков.',
    createdAt: DateTime.now().subtract(const Duration(days: 7)),
  ),
  Exercise(
    id: 'ex_${1009}',
    title: 'Гиперэкстензия',
    muscle: MuscleGroup.back,
    equipment: Equipment.machine,
    difficulty: Difficulty.beginner,
    description:
    'Линия корпуса — от головы до таза. Подъём за счёт разгибателей спины и ягодиц. Не переразгибайте вверху, контролируйте вниз.',
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  ),

  // Ноги
  Exercise(
    id: 'ex_${1010}',
    title: 'Приседания со штангой',
    muscle: MuscleGroup.legs,
    equipment: Equipment.barbell,
    difficulty: Difficulty.advanced,
    description:
    'Стойка на ширине плеч, носки слегка наружу. Колени следуют за носками, спина нейтральна. Вставание — толчком от пяток.',
    createdAt: DateTime.now().subtract(const Duration(days: 12)),
  ),
  Exercise(
    id: 'ex_${1011}',
    title: 'Фронтальные приседания',
    muscle: MuscleGroup.legs,
    equipment: Equipment.barbell,
    difficulty: Difficulty.advanced,
    description:
    'Штанга на дельтах, локти высоко. Держите корпус вертикальнее, колени раскрывайте по линии носков. Амплитуда — комфортная.',
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Exercise(
    id: 'ex_${1012}',
    title: 'Выпады вперёд',
    muscle: MuscleGroup.legs,
    equipment: Equipment.bodyweight,
    difficulty: Difficulty.beginner,
    description:
    'Широкий шаг, колено передней ноги над пяткой. Спина ровная, толчок пяткой вверх. Не заваливайте колено внутрь.',
    createdAt: DateTime.now().subtract(const Duration(days: 9)),
  ),
  Exercise(
    id: 'ex_${1013}',
    title: 'Жим ногами в тренажёре',
    muscle: MuscleGroup.legs,
    equipment: Equipment.machine,
    difficulty: Difficulty.beginner,
    description:
    'Ступни на платформе на ширине плеч. Колени по линии носков, не выпрямляйте их «в замок». Толкайте платформу пятками.',
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
  ),
  Exercise(
    id: 'ex_${1014}',
    title: 'Румынская тяга',
    muscle: MuscleGroup.legs,
    equipment: Equipment.barbell,
    difficulty: Difficulty.intermediate,
    description:
    'Штанга скользит вдоль бёдер, колени слегка согнуты. Уводите таз назад, чувствуй растяжение задней поверхности бедра. Спина нейтральна.',
    createdAt: DateTime.now().subtract(const Duration(days: 4)),
  ),

  // Плечи
  Exercise(
    id: 'ex_${1015}',
    title: 'Жим гантелей сидя',
    muscle: MuscleGroup.shoulders,
    equipment: Equipment.dumbbell,
    difficulty: Difficulty.intermediate,
    description:
    'Спина к спинке, стопы в пол. Локти под гантелями, запястья ровные. Жмите по дуге вверх, без прогиба поясницы.',
    createdAt: DateTime.now().subtract(const Duration(days: 6)),
  ),
  Exercise(
    id: 'ex_${1016}',
    title: 'Махи гантелями в стороны',
    muscle: MuscleGroup.shoulders,
    equipment: Equipment.dumbbell,
    difficulty: Difficulty.beginner,
    description:
    'Лёгкий наклон корпуса. Поднимайте до уровня плеч «локтями в стороны», без рывков, медленное опускание.',
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
  Exercise(
    id: 'ex_${1017}',
    title: 'Тяга к подбородку',
    muscle: MuscleGroup.shoulders,
    equipment: Equipment.barbell,
    difficulty: Difficulty.intermediate,
    description:
    'Хват чуть уже плеч. Тяните с ведущими локтями вверх до уровня груди/подбородка. Держите запястья ровными.',
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
  ),

  // Руки
  Exercise(
    id: 'ex_${1018}',
    title: 'Сгибания рук со штангой',
    muscle: MuscleGroup.arms,
    equipment: Equipment.barbell,
    difficulty: Difficulty.beginner,
    description:
    'Локти прижаты к корпусу. Поднимайте без раскачки, опускайте медленно до полного разгибания без перенапряжения.',
    createdAt: DateTime.now().subtract(const Duration(days: 7)),
  ),
  Exercise(
    id: 'ex_${1019}',
    title: 'Французский жим лёжа',
    muscle: MuscleGroup.arms,
    equipment: Equipment.barbell,
    difficulty: Difficulty.intermediate,
    description:
    'Локти смотрят вверх, не разводите их в стороны. Опускайте штангу к верхней части головы/лбу, выжимайте трицепсом.',
    createdAt: DateTime.now().subtract(const Duration(days: 10)),
  ),
  Exercise(
    id: 'ex_${1020}',
    title: 'Разгибания на блоке',
    muscle: MuscleGroup.arms,
    equipment: Equipment.machine,
    difficulty: Difficulty.beginner,
    description:
    'Локти фиксированы у корпуса. Тяните рукоять вниз до полного разгибания, вверху сохраняйте напряжение, не «кидайте» вес.',
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
  ),

  // Кор
  Exercise(
    id: 'ex_${1021}',
    title: 'Планка',
    muscle: MuscleGroup.core,
    equipment: Equipment.bodyweight,
    difficulty: Difficulty.beginner,
    description:
    'Локти под плечами, корпус — прямая линия. Не поднимайте таз и не прогибайте поясницу. Дышите спокойно, взгляд в пол.',
    createdAt: DateTime.now().subtract(const Duration(days: 6)),
  ),
  Exercise(
    id: 'ex_${1022}',
    title: 'Скручивания на полу',
    muscle: MuscleGroup.core,
    equipment: Equipment.bodyweight,
    difficulty: Difficulty.beginner,
    description:
    'Поясница прижата к полу. Скручивание грудной клетки к тазу, подбородок не прижимать. Небольшая амплитуда, контроль.',
    createdAt: DateTime.now().subtract(const Duration(days: 9)),
  ),
  Exercise(
    id: 'ex_${1023}',
    title: 'Велосипед',
    muscle: MuscleGroup.core,
    equipment: Equipment.bodyweight,
    difficulty: Difficulty.intermediate,
    description:
    'Попеременное касание локтем противоположного колена. Поясница в контакте с полом, движение без рывков.',
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
  ),

  // Все тело / доп. оборудование
  Exercise(
    id: 'ex_${1024}',
    title: 'Бёрпи',
    muscle: MuscleGroup.fullBody,
    equipment: Equipment.bodyweight,
    difficulty: Difficulty.intermediate,
    description:
    'Присед — планка — отжимание — прыжок. Держите корпус собранным, приземление мягкое. Темп — контролируемый.',
    createdAt: DateTime.now().subtract(const Duration(days: 8)),
  ),
  Exercise(
    id: 'ex_${1025}',
    title: 'Тяга гири к подбородку',
    muscle: MuscleGroup.shoulders,
    equipment: Equipment.kettlebell,
    difficulty: Difficulty.intermediate,
    description:
    'Гиря у бедер, тяните локтями вверх до ключицы. Корпус стабильный, движение плавное.',
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
  Exercise(
    id: 'ex_${1026}',
    title: 'Рывок гири одной рукой',
    muscle: MuscleGroup.fullBody,
    equipment: Equipment.kettlebell,
    difficulty: Difficulty.advanced,
    description:
    'Замах из бёдер, мощный толчок тазом. Проведите гирю по дуге и «поймайте» над головой, не бейте по предплечью. Контроль корпуса.',
    createdAt: DateTime.now().subtract(const Duration(days: 11)),
  ),
  Exercise(
    id: 'ex_${1027}',
    title: 'Тяга резинки к поясу',
    muscle: MuscleGroup.back,
    equipment: Equipment.band,
    difficulty: Difficulty.beginner,
    description:
    'Фиксируйте лопатки, тяните локтями назад, корпус неподвижен. Плавное возвращение с контролем.',
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
  ),
  Exercise(
    id: 'ex_${1028}',
    title: 'Жим резинки от груди',
    muscle: MuscleGroup.chest,
    equipment: Equipment.band,
    difficulty: Difficulty.beginner,
    description:
    'Резинка за спиной на уровне груди. Выжимайте вперёд, лопатки стабильны, локти под контролем.',
    createdAt: DateTime.now().subtract(const Duration(days: 7)),
  ),
  Exercise(
    id: 'ex_${1029}',
    title: 'Подтягивания',
    muscle: MuscleGroup.back,
    equipment: Equipment.bodyweight,
    difficulty: Difficulty.advanced,
    description:
    'Хват шире плеч. Плечи опущены, тяните грудью к перекладине, локти вниз-назад. Без рывков, контролируемое опускание.',
    createdAt: DateTime.now().subtract(const Duration(days: 10)),
  ),
  Exercise(
    id: 'ex_${1030}',
    title: 'Армейский жим стоя',
    muscle: MuscleGroup.shoulders,
    equipment: Equipment.barbell,
    difficulty: Difficulty.advanced,
    description:
    'Стопы на ширине таза, корпус собран. Жмите штангу вверх по прямой, избегая прогиба в пояснице; рёбра «внутрь».',
    createdAt: DateTime.now().subtract(const Duration(days: 4)),
  ),
];

String nextId() =>
    'ex_${DateTime.now().microsecondsSinceEpoch}${Random().nextInt(999)}';
