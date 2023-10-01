import("..\1983-Moskva-Tallinn.avs")

v101 = LSMASHVideoSource(dst_dir + "v101rc.mp4")

v101 = v101.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v101 = v101.convertToYV12(interlaced=false)

v101 = v101.deScratch
v101 = v101.removeDirt

v101 = v101.UnsharpMask(strength=500, radius=5, threshold=1)
v101 = v101.adjustBorders

va = BlankClip(v101, audio_rate = 48000, channels = 2).killVideo
v101 = v101.audioDub(va)

return v101.Prefetch

