#pragma once

#ifdef _WIN32
    #define DLLIMPORT __declspec(dllimport)
#else
    #define DLLIMPORT
#endif

extern "C" {

    typedef struct {
        double x;
        double y;
    } AzSvgVector;

    // Returns the normalized vector
    extern DLLIMPORT AzSvgVector AzSvgVector_normalize(const AzSvgVector* svgvector);
}
