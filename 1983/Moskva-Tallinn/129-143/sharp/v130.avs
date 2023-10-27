import("..\1983-Moskva-Tallinn.avs")

v130 = LSMASHVideoSource(dst_dir + "v130rc.mp4")

v130 = v130.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v130 = v130.convertToYV12(interlaced=false)

v130 = v130.deScratch
v130 = v130.removeDirt

v130 = v130.UnsharpMask(strength=500, radius=5, threshold=1)
v130 = v130.adjustBorders

va = BlankClip(v130, audio_rate = 48000, channels = 2).killVideo
v130 = v130.audioDub(va)

return v130.Prefetch

