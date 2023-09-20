import("..\1983-Moskva-Tallinn.avs")

v87 = LSMASHVideoSource(dst_dir + "v87rc.mp4")

v87 = v87.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v87 = v87.convertToYV12(interlaced=false)

v87 = v87.deScratch
v87 = v87.removeDirt

v87 = v87.UnsharpMask(strength=500, radius=5, threshold=1)
v87 = v87.adjustBorders

va = BlankClip(v87, audio_rate = 48000, channels = 2).killVideo
v87 = v87.audioDub(va)

return v87.Prefetch

