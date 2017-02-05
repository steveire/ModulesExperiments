
#ifndef FRUITSALAD_EXPORT_H
#define FRUITSALAD_EXPORT_H

#ifndef FRUITSALAD_EXPORT
#ifdef fruitsalad_EXPORTS
/* We are building this library */
#if __GNUC__
#define FRUITSALAD_EXPORT __attribute__((visibility("default")))
#else
#define FRUITSALAD_EXPORT __declspec(dllexport)
#endif
#else
/* We are using this library */
#if __GNUC__
#define FRUITSALAD_EXPORT __attribute__((visibility("default")))
#else
#define FRUITSALAD_EXPORT __declspec(dllimport)
#endif
#endif
#endif

#endif
