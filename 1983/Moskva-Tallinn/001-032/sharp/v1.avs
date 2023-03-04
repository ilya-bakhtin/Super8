import("..\1983-Moskva-Tallinn.avs")
v1 = LSMASHVideoSource(dst_dir + "v1rc.mp4")

v1 = v1.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v1 = v1.convertToYV12(interlaced=false)

v1 = v1.deScratch
v1 = v1.removeDirt

v1 = v1.UnsharpMask(strength=400, radius=5, threshold=1)
v1 = v1.adjustBorders

va = BlankClip(v1, audio_rate = 48000, channels = 2).killVideo
v1 = v1.audioDub(va)

return v1.Prefetch

