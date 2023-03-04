import("..\1983-Moskva-Tallinn.avs")
v13 = LSMASHVideoSource(dst_dir + "v13rc.mp4")

v13 = v13.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v13 = v13.convertToYV12(interlaced=false)

v13 = v13.deScratch
v13 = v13.removeDirt

v13 = v13.UnsharpMask(strength=400, radius=5, threshold=1)
v13 = v13.adjustBorders

va = BlankClip(v13, audio_rate = 48000, channels = 2).killVideo
v13 = v13.audioDub(va)

return v13.Prefetch

