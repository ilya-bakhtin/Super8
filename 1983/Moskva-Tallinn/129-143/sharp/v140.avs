import("..\1983-Moskva-Tallinn.avs")

v140 = LSMASHVideoSource(dst_dir + "v140rc.mp4")

v140 = v140.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v140 = v140.convertToYV12(interlaced=false)

v140 = v140.deScratch
v140 = v140.removeDirt

v140 = v140.UnsharpMask(strength=500, radius=5, threshold=1)
v140 = v140.adjustBorders

va = BlankClip(v140, audio_rate = 48000, channels = 2).killVideo
v140 = v140.audioDub(va)

return v140.Prefetch

