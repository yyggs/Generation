#include "Debug.h"
#include <boost/asio.hpp>
#include <iostream>

void task1() {
    Log() << "Task 1 is running\n";
}

void task2() {
    Log() << "Task 2 is running\n";
}

void TestPool() {
    // Create a thread pool with 4 threads
    boost::asio::thread_pool pool(4);

    // Submit a function to the pool
    boost::asio::post(pool, task1);

    // Submit a lambda to the pool
    boost::asio::post(pool, []() {
        Log() << "Lambda task is running\n";
    });

    // Submit another function to the pool
    boost::asio::post(pool, task2);

    // Wait for all tasks in the pool to complete
    pool.join();
}
