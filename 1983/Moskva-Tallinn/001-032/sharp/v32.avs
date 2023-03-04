import("..\1983-Moskva-Tallinn.avs")
v32 = LSMASHVideoSource(dst_dir + "v32rc.mp4")

v32 = v32.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v32 = v32.convertToYV12(interlaced=false)

v32 = v32.deScratch
v32 = v32.removeDirt

v32 = v32.UnsharpMask(strength=400, radius=5, threshold=1)
v32 = v32.adjustBorders

va = BlankClip(v32, audio_rate = 48000, channels = 2).killVideo
v32 = v32.audioDub(va)

return v32.Prefetch

