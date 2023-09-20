import("..\1983-Moskva-Tallinn.avs")
v34 = LSMASHVideoSource(dst_dir + "v34rc.mp4")

v34 = v34.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v34 = v34.convertToYV12(interlaced=false)

v34 = v34.deScratch
v34 = v34.removeDirt

v34 = v34.UnsharpMask(strength=500, radius=5, threshold=1)
v34 = v34.adjustBorders

va = BlankClip(v34, audio_rate = 48000, channels = 2).killVideo
v34 = v34.audioDub(va)

return v34.Prefetch

