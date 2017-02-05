
#ifndef NOTFRUITSALAD_EXPORT_H
#define NOTFRUITSALAD_EXPORT_H

#ifndef NOTFRUITSALAD_EXPORT
#ifdef notfruitsalad_EXPORTS
/* We are building this library */
#if __GNUC__
#define NOTFRUITSALAD_EXPORT __attribute__((visibility("default")))
#else
#define NOTFRUITSALAD_EXPORT __declspec(dllexport)
#endif
#else
/* We are using this library */
#if __GNUC__
#define NOTFRUITSALAD_EXPORT __attribute__((visibility("default")))
#else
#define NOTFRUITSALAD_EXPORT __declspec(dllimport)
#endif
#endif
#endif

#endif
