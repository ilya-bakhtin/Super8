import("..\1983-Moskva-Tallinn.avs")
v16 = LSMASHVideoSource(dst_dir + "v16rc.mp4")

v16 = v16.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v16 = v16.convertToYV12(interlaced=false)

v16 = v16.deScratch
v16 = v16.removeDirt

v16 = v16.UnsharpMask(strength=400, radius=5, threshold=1)
v16 = v16.adjustBorders

va = BlankClip(v16, audio_rate = 48000, channels = 2).killVideo
v16 = v16.audioDub(va)

return v16.Prefetch

