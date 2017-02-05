
#ifndef BOWLS_EXPORT_H
#define BOWLS_EXPORT_H

#ifndef BOWLS_EXPORT
#ifdef bowls_EXPORTS
/* We are building this library */
#if __GNUC__
#define BOWLS_EXPORT  __attribute__((visibility("default")))
#else
#define BOWLS_EXPORT __declspec(dllexport)
#endif
#else
/* We are using this library */
#if __GNUC__
#define BOWLS_EXPORT  __attribute__((visibility("default")))
#else
#define BOWLS_EXPORT __declspec(dllimport)
#endif
#endif
#endif

#endif
