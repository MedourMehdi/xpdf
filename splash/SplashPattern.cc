//========================================================================
//
// SplashPattern.cc
//
// Copyright 2003-2013 Glyph & Cog, LLC
//
//========================================================================

#include "../aconf.h"

#ifdef USE_GCC_PRAGMAS
#pragma implementation
#endif

#include "../goo/gmempp.h"
#include "../splash/SplashMath.h"
#include "../splash/SplashScreen.h"
#include "../splash/SplashPattern.h"

//------------------------------------------------------------------------
// SplashPattern
//------------------------------------------------------------------------

SplashPattern::SplashPattern() {
}

SplashPattern::~SplashPattern() {
}

//------------------------------------------------------------------------
// SplashSolidColor
//------------------------------------------------------------------------

SplashSolidColor::SplashSolidColor(SplashColorPtr colorA) {
  splashColorCopy(color, colorA);
}

SplashSolidColor::~SplashSolidColor() {
}

void SplashSolidColor::getColor(int x, int y, SplashColorPtr c) {
  splashColorCopy(c, color);
}

