import("..\1983-1984.mov.avs")
v1 = LWLibavVideoSource(source_dir + "v1f.avi", cache=false)#.ConvertToYV24()
v1 = v1.extractY
v1 = v1.autolevels(gamma = 0.7)
#return v1.histogram("levels").prefetch
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
return v1.prefetch
#adjustframerate
