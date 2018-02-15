#!/usr/bin/env python3
# coding=utf-8
# hola

""" This module contains an unoptimized example of the solution of calculating
the loose change of a given amount, this file has a racket file companion """

coins = [100, 50, 20, 10, 5, 2, 1, 0.5]

def calculate_change(n):
    change = list()
    for i in coins:
        while (n - i) >= 0:
            n -= i
            change.append(i)
        if n == 0:
            break
    if n > 0:
        raise Exception("failed")
    return change

def main():
    n = float(input())
    print(calculate_change(n))

if __name__ == '__main__':
    main()




    
