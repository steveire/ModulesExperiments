
#ifndef ABSTRACTFRUIT_EXPORT_H
#define ABSTRACTFRUIT_EXPORT_H

#ifndef ABSTRACTFRUIT_EXPORT
#ifdef abstractfruit_EXPORTS
/* We are building this library */
#if __GNUC__
#define ABSTRACTFRUIT_EXPORT __attribute__((visibility("default")))
#else
#define ABSTRACTFRUIT_EXPORT __declspec(dllexport)
#endif
#else
/* We are using this library */
#if __GNUC__
#define ABSTRACTFRUIT_EXPORT __attribute__((visibility("default")))
#else
#define ABSTRACTFRUIT_EXPORT __declspec(dllimport)
#endif
#endif
#endif

#endif
