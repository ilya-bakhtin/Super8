import("..\1983-Moskva-Tallinn.avs")
v63 = LSMASHVideoSource(dst_dir + "v63rc.mp4")

v63 = v63.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v63 = v63.convertToYV12(interlaced=false)

v63 = v63.deScratch
v63 = v63.removeDirt

v63 = v63.UnsharpMask(strength=500, radius=5, threshold=1)
v63 = v63.adjustBorders

va = BlankClip(v63, audio_rate = 48000, channels = 2).killVideo
v63 = v63.audioDub(va)

return v63.Prefetch

