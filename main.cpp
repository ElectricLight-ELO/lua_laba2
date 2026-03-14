#include <iostream>
#include <unordered_map>
#include <cmath>
#include <chrono>

/* сложные функции для задания */
template <typename T>
T factorial(T digit) {
	T result = 1.0f;
	for (T i = 1; i <= digit; i++) {
		result *= i;
	}
	return result;
}
uint32_t find_num_hash(int num) {
	uint32_t hash = 0x010101;
	for (int i = 1; i <= 7; i++) {
		uint8_t byte = (num >> (i * 8)) & 0xFF;
		hash ^= byte;
	}

	return hash;
}
/* функция для кеширования данных через таблицу */
template<typename T>
std::unordered_map<int, T> cache_table;
template<typename T> 
T call_w_caching(int i) {
	if (cache_table<T>.find(i) != cache_table<T>.end()) {
		return cache_table<T>[i];
	}

	T obj = factorial(i);
	cache_table<T>[i] = obj;
	return obj;
}
int main()
{
	// первый запуск без кеширования
	auto start_time = std::chrono::high_resolution_clock::now();
	for (int i = 0; i < 430; i++) {
		int data = call_w_caching<int>(i);

	}
	auto end_time = std::chrono::high_resolution_clock::now();

	auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end_time - start_time);
	std::cout << duration << std::endl;
	// запуск с кешированием
	auto start_time1 = std::chrono::high_resolution_clock::now();
	for (int i = 0; i < 430; i++) {
		int data = call_w_caching<int>(i);
	}
	auto end_time1 = std::chrono::high_resolution_clock::now();

	auto duration1 = std::chrono::duration_cast<std::chrono::microseconds>(end_time1 - start_time1);
	std::cout << duration1 << std::endl;
	return 0;
}