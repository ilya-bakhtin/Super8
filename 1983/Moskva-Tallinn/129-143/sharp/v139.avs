import("..\1983-Moskva-Tallinn.avs")

v139 = LSMASHVideoSource(dst_dir + "v139rc.mp4")

v139 = v139.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v139 = v139.convertToYV12(interlaced=false)

v139 = v139.deScratch
v139 = v139.removeDirt

v139 = v139.UnsharpMask(strength=500, radius=5, threshold=1)
v139 = v139.adjustBorders

va = BlankClip(v139, audio_rate = 48000, channels = 2).killVideo
v139 = v139.audioDub(va)

return v139.Prefetch

