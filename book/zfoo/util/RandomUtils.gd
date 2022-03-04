extends Object

const NumberUtils = preload("res://zfoo/util/NumberUtils.gd")
const StringUtils = preload("res://zfoo/util/StringUtils.gd")

const random = [false, null]

# 单例模式
static func getRandom() -> RandomNumberGenerator:
	if random[0]:
		return random[1]
	var randomGenerator = RandomNumberGenerator.new()
	randomGenerator.randomize()
	random[1] = randomGenerator
	return randomGenerator


static func randomBoolean() -> bool:
	return 1 == getRandom().randi_range(0, 2)


# 获得随机数[-2^32, 2^32)
static func randomInt() -> int:
	return randomIntRange(NumberUtils.MIN_INT, NumberUtils.MAX_INT)

# 获得指定范围内的随机数 [0,limit)
static func randomIntLimit(limit: int) -> int:
	return randomIntRange(0, limit)

# 获得随机数[-2^32, 2^32)
static func randomIntRange(from: int, to: int) -> int:
	if from < NumberUtils.MIN_INT:
		push_error(StringUtils.format("from [{}] shoud be >= [{}]", [from, NumberUtils.MIN_INT]))
		return 0
	
	if to > NumberUtils.MAX_INT:
		push_error(StringUtils.format("to [{}] should be <= [{}]", [from, NumberUtils.MAX_INT]))
		return 0
	
	return getRandom().randi_range(from, to - 1)

static func randomEle(array: Array):
	return array[randomIntLimit(array.size())]
