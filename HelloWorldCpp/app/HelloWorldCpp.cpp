// HelloWorldCpp.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "version_number.h"

#include <stdio.h>
#include <iostream>


int _tmain(int argc, _TCHAR* argv[])
{
	std::cout << "Hello World version " << VERSION_STRING << std::endl;

	return 0;
}

