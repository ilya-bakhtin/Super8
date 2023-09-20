import("..\1983-Moskva-Tallinn.avs")
v7 = LSMASHVideoSource(dst_dir + "v7rc.mp4")

v7 = v7.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v7 = v7.convertToYV12(interlaced=false)

v7 = v7.deScratch
v7 = v7.removeDirt

v7 = v7.UnsharpMask(strength=500, radius=5, threshold=1)
v7 = v7.adjustBorders

va = BlankClip(v7, audio_rate = 48000, channels = 2).killVideo
v7 = v7.audioDub(va)

return v7.Prefetch

